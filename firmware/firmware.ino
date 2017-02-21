#include <Arduino.h>
#include <SPI.h>
#include <InputDebounce.h>
#include "quaternionFilters.h"
#include <MPU9250.h>
#include "Adafruit_BLE.h"
#include "Adafruit_BluefruitLE_SPI.h"
#include "Adafruit_BLEGatt.h"


#define VERBOSE_MODE      false
#define SERIAL_DEBUG      false

// === PINOUT ===
#define POT_0         A1
#define POT_1         A2
#define PHOTO_RES     A3
#define PRESSURE_RES  A4
#define BATT_TEST     A7
#define BUTTON_0      5
#define BUTTON_1      6
#define BUTTON_2      10
#define BUTTON_3      11
#define BUTTON_4      12

// === BLE ===
#define BLUEFRUIT_SPI_CS               8
#define BLUEFRUIT_SPI_IRQ              7
#define BLUEFRUIT_SPI_RST              4
Adafruit_BluefruitLE_SPI ble(BLUEFRUIT_SPI_CS, BLUEFRUIT_SPI_IRQ, BLUEFRUIT_SPI_RST);
Adafruit_BLEGatt gatt(ble);

// === IMU ===
#define IMU_REFRESH_PERIOD 120 // ms
// Declination of North Park, San Diego (32°44'55.0"N 117°07'48.1"W) is
//   11.62° E  ± 0.33° on 2016-10-08
//   http://www.ngdc.noaa.gov/geomag-web/#declination
#define IMU_DECLINATION_ADJUSTMENT 11.62
MPU9250 imu;

// === UPDATE TUNING ===
#define ANALOG_VALUE_DELTA        3
#define ANALOG_POT_ZERO_THRESHOLD 14
#define UPDATE_BATT_PERC_MILLIS   12000
#define BUTTON_DEBOUNCE_DELAY     20
#define IMU_VALUE_DELTA           2

// === GLOBALS ===
int32_t serviceId;
int32_t analogCharIds[4] = {};
int32_t digitalCharIds[5] = {};
uint16_t analogValues[4] = {};
uint8_t digitalValues[5] = {};
int32_t imuCharId;
struct ImuValues {
  float yaw;
  float pitch;
  float roll;
};
ImuValues imuValues = {};

long lastBattUpdateMillis = 0;
static InputDebounce bouncers[5];


void setup(void) {
  delay(500);

  Serial.begin(115200);

  // buttons are pull-up (0V == on state)
  pinMode(BUTTON_0, INPUT_PULLUP);
  bouncers[0].setup(BUTTON_0, BUTTON_DEBOUNCE_DELAY, InputDebounce::PIM_INT_PULL_UP_RES);
  pinMode(BUTTON_1, INPUT_PULLUP);
  bouncers[1].setup(BUTTON_1, BUTTON_DEBOUNCE_DELAY, InputDebounce::PIM_INT_PULL_UP_RES);
  pinMode(BUTTON_2, INPUT_PULLUP);
  bouncers[2].setup(BUTTON_2, BUTTON_DEBOUNCE_DELAY, InputDebounce::PIM_INT_PULL_UP_RES);
  pinMode(BUTTON_3, INPUT_PULLUP);
  bouncers[3].setup(BUTTON_3, BUTTON_DEBOUNCE_DELAY, InputDebounce::PIM_INT_PULL_UP_RES);
  pinMode(BUTTON_4, INPUT_PULLUP);
  bouncers[4].setup(BUTTON_4, BUTTON_DEBOUNCE_DELAY, InputDebounce::PIM_INT_PULL_UP_RES);

  // init BLE
  beginBLE();

  // init IMU
  beginIMU();
}

void error(const __FlashStringHelper*err) {
  Serial.println(err);
  while (1);
}

void updateAnalogValue(uint16_t pin, int delta, int idx) {
  uint16_t value = (uint16_t)analogRead(pin);
  if (value < ANALOG_POT_ZERO_THRESHOLD) value = 0;
  if (abs(analogValues[idx] - value) > ANALOG_VALUE_DELTA) {
    gatt.setChar(analogCharIds[idx], (uint16_t)value);
    analogValues[idx] = value;
  }
}

void updateDigitalValue(int idx) {
  int isPressed = bouncers[idx].process(millis()) > 0;
  if (isPressed != digitalValues[idx]) {
    gatt.setChar(digitalCharIds[idx], (uint8_t)isPressed);
    digitalValues[idx] = isPressed;
  }
}

void loop(void) {
  // update battery status every so often
  if (millis() > lastBattUpdateMillis + UPDATE_BATT_PERC_MILLIS) {
    float measuredvbat = analogRead(BATT_TEST);
    measuredvbat = measuredvbat - 420; // 420 = 0%
    measuredvbat = measuredvbat / 2.40; // 660 = 100% (660-420 = 240)
    if (measuredvbat > 100) measuredvbat = 100;
    if (measuredvbat < 0) measuredvbat = 0;
    ble.print(F("AT+BLEBATTVAL="));
    ble.println((uint8_t)measuredvbat);
    lastBattUpdateMillis = millis();
  }

  // analogs
  updateAnalogValue(POT_0, ANALOG_VALUE_DELTA, 0);
  updateAnalogValue(POT_1, ANALOG_VALUE_DELTA, 1);
  updateAnalogValue(PHOTO_RES, ANALOG_VALUE_DELTA * 12, 2);
  updateAnalogValue(PRESSURE_RES, ANALOG_VALUE_DELTA, 3);

  // digitals
  updateDigitalValue(0);
  updateDigitalValue(1);
  updateDigitalValue(2);
  updateDigitalValue(3);
  updateDigitalValue(4);

  // IMU
  updateIMU();
  if (abs(imu.yaw - imuValues.yaw) > IMU_VALUE_DELTA ||
      abs(imu.pitch - imuValues.pitch) > IMU_VALUE_DELTA ||
      abs(imu.roll - imuValues.roll) > IMU_VALUE_DELTA) {

      // send all IMU data at once
      imuValues.yaw = imu.yaw;
      imuValues.pitch = imu.pitch;
      imuValues.roll = imu.roll;
      uint8_t* data = reinterpret_cast<uint8_t*>(&imuValues);
      gatt.setChar(imuCharId, data, 12);
  }

  delay(20);
}

// === BLE ===
void beginBLE() {
  boolean success;
  Serial.print(F("Initialising the Bluefruit LE module: "));
  if (!ble.begin(VERBOSE_MODE)) {
    error(F("Couldn't find Bluefruit, make sure it's in CoMmanD mode & check wiring?"));
  }
  Serial.println(F("Bluefruit LE module in CMD mode"));

  Serial.println(F("Performing a factory reset: "));
  if (!ble.factoryReset()) {
    error(F("Couldn't factory reset"));
  }

  ble.echo(false);

  Serial.println("Requesting Bluefruit info:");
  ble.info();

  Serial.println(F("Setting device name to 'GloveOfPower': "));
  if (!ble.sendCommandCheckOK(F("AT+GAPDEVNAME=GloveOfPower"))) {
    error(F("Could not set device name?"));
  }

  // Custom service definition
  Serial.println(F("Adding the Service definition (UUID): 84F20AFF-A73A-4FE6-850B-BDED53F7AC2A"));
  uint8_t uuid[] { 0x84, 0xF2, 0x0A, 0xFF, 0xA7, 0x3A, 0x4F, 0xE6, 0x85, 0x0B, 0xBD, 0xED, 0x53, 0xF7, 0xAC, 0x2A };
  serviceId = gatt.addService(uuid);
  if (serviceId == 0) {
    error(F("Could not add service"));
  }

  // add battery service
  ble.sendCommandCheckOK(F("AT+BLEBATTEN=1"));

  Serial.println(F("Adding characteristics"));

  // ANALOG input characteristics
  const struct GattPresentationFormat format_uint16 = {GATT_PRESENT_FORMAT_UINT16};
  analogCharIds[0] = gatt.addCharacteristic(0x0001, GATT_CHARS_PROPERTIES_NOTIFY, 1, 2, BLE_DATATYPE_BYTEARRAY, "/analog/0", &format_uint16);
  analogCharIds[1] = gatt.addCharacteristic(0x0002, GATT_CHARS_PROPERTIES_NOTIFY, 1, 2, BLE_DATATYPE_BYTEARRAY, "/analog/1", &format_uint16);
  analogCharIds[2] = gatt.addCharacteristic(0x0003, GATT_CHARS_PROPERTIES_NOTIFY, 1, 2, BLE_DATATYPE_BYTEARRAY, "/analog/2", &format_uint16);
  analogCharIds[3] = gatt.addCharacteristic(0x0004, GATT_CHARS_PROPERTIES_NOTIFY, 1, 2, BLE_DATATYPE_BYTEARRAY, "/analog/3", &format_uint16);

  // DIGITAL input characteristics
  const struct GattPresentationFormat format_uint8 = {GATT_PRESENT_FORMAT_UINT8};
  digitalCharIds[0] = gatt.addCharacteristic(0x0005, GATT_CHARS_PROPERTIES_NOTIFY, 1, 1, BLE_DATATYPE_BYTEARRAY, "/digital/0", &format_uint8);
  digitalCharIds[1] = gatt.addCharacteristic(0x0006, GATT_CHARS_PROPERTIES_NOTIFY, 1, 1, BLE_DATATYPE_BYTEARRAY, "/digital/1", &format_uint8);
  digitalCharIds[2] = gatt.addCharacteristic(0x0007, GATT_CHARS_PROPERTIES_NOTIFY, 1, 1, BLE_DATATYPE_BYTEARRAY, "/digital/2", &format_uint8);
  digitalCharIds[3] = gatt.addCharacteristic(0x0008, GATT_CHARS_PROPERTIES_NOTIFY, 1, 1, BLE_DATATYPE_BYTEARRAY, "/digital/3", &format_uint8);
  digitalCharIds[4] = gatt.addCharacteristic(0x0009, GATT_CHARS_PROPERTIES_NOTIFY, 1, 1, BLE_DATATYPE_BYTEARRAY, "/digital/4", &format_uint8);

  // IMU
  imuCharId = gatt.addCharacteristic(0xB102, GATT_CHARS_PROPERTIES_NOTIFY, 12, 12, BLE_DATATYPE_BYTEARRAY, "/imu");

  // advertise our custom service
  Serial.print(F("Adding Service UUID to the advertising payload: "));
  ble.sendCommandCheckOK( F("AT+GAPSETADVDATA=02-01-06-11-06-2A-AC-F7-53-ED-BD-0B-85-E6-4F-3A-A7-FF-0A-F2-84"));

  Serial.print(F("Performing a SW reset (service changes require a reset): "));
  ble.reset();
}


// === IMU ===
void beginIMU() {
  Wire.begin();

  // Read the WHO_AM_I register, this is a good test of communication
  byte c = imu.readByte(MPU9250_ADDRESS, WHO_AM_I_MPU9250);
  Serial.print("MPU9250 "); Serial.print("I AM "); Serial.print(c, HEX);
  Serial.print(" I should be "); Serial.println(0x71, HEX);

  // Start by performing self test and reporting values
  imu.MPU9250SelfTest(imu.SelfTest);
  if (SERIAL_DEBUG) {
    Serial.println("MPU9250 is online...");
    Serial.print("x-axis self test: acceleration trim within : ");
    Serial.print(imu.SelfTest[0], 1); Serial.println("% of factory value");
    Serial.print("y-axis self test: acceleration trim within : ");
    Serial.print(imu.SelfTest[1], 1); Serial.println("% of factory value");
    Serial.print("z-axis self test: acceleration trim within : ");
    Serial.print(imu.SelfTest[2], 1); Serial.println("% of factory value");
    Serial.print("x-axis self test: gyration trim within : ");
    Serial.print(imu.SelfTest[3], 1); Serial.println("% of factory value");
    Serial.print("y-axis self test: gyration trim within : ");
    Serial.print(imu.SelfTest[4], 1); Serial.println("% of factory value");
    Serial.print("z-axis self test: gyration trim within : ");
    Serial.print(imu.SelfTest[5], 1); Serial.println("% of factory value");
  }

  // Calibrate gyro and accelerometers, load biases in bias registers
  imu.calibrateMPU9250(imu.gyroBias, imu.accelBias);

  imu.initMPU9250();
  // Initialize device for active mode read of acclerometer, gyroscope, and temp
  if (SERIAL_DEBUG) {
    Serial.println("MPU9250 initialized for active data mode....");

    // Read the WHO_AM_I register of the magnetometer, this is a good test of comms
    byte d = imu.readByte(AK8963_ADDRESS, WHO_AM_I_AK8963);
    Serial.print("AK8963 "); Serial.print("I AM "); Serial.print(d, HEX);
    Serial.print(" I should be "); Serial.println(0x48, HEX);
  }

  // Get magnetometer calibration from AK8963 ROM
  imu.initAK8963(imu.magCalibration);
  // Initialize device for active mode read of magnetometer
  if (SERIAL_DEBUG) {
    Serial.println("AK8963 initialized for active data mode....");
    Serial.println("Calibration values: ");
    Serial.print("X-Axis sensitivity adjustment value ");
    Serial.println(imu.magCalibration[0], 2);
    Serial.print("Y-Axis sensitivity adjustment value ");
    Serial.println(imu.magCalibration[1], 2);
    Serial.print("Z-Axis sensitivity adjustment value ");
    Serial.println(imu.magCalibration[2], 2);
  }
}

void updateIMU() {
  if (imu.readByte(MPU9250_ADDRESS, INT_STATUS) & 0x01) {
    imu.readAccelData(imu.accelCount);  // Read the x/y/z adc values
    imu.getAres();

    // Now we'll calculate the accleration value into actual g's
    // This depends on scale being set
    imu.ax = (float)imu.accelCount[0] * imu.aRes; // - accelBias[0];
    imu.ay = (float)imu.accelCount[1] * imu.aRes; // - accelBias[1];
    imu.az = (float)imu.accelCount[2] * imu.aRes; // - accelBias[2];

    imu.readGyroData(imu.gyroCount);  // Read the x/y/z adc values
    imu.getGres();

    // Calculate the gyro value into actual degrees per second
    // This depends on scale being set
    imu.gx = (float)imu.gyroCount[0] * imu.gRes;
    imu.gy = (float)imu.gyroCount[1] * imu.gRes;
    imu.gz = (float)imu.gyroCount[2] * imu.gRes;

    imu.readMagData(imu.magCount);  // Read the x/y/z adc values
    imu.getMres();
    // User environmental x-axis correction in milliGauss, should be
    // automatically calculated
    imu.magbias[0] = +470.;
    // User environmental x-axis correction in milliGauss TODO axis??
    imu.magbias[1] = +120.;
    // User environmental x-axis correction in milliGauss
    imu.magbias[2] = +125.;

    // Calculate the magnetometer values in milliGauss
    // Include factory calibration per data sheet and user environmental
    // corrections
    // Get actual magnetometer value, this depends on scale being set
    imu.mx = (float)imu.magCount[0] * imu.mRes * imu.magCalibration[0] -
             imu.magbias[0];
    imu.my = (float)imu.magCount[1] * imu.mRes * imu.magCalibration[1] -
             imu.magbias[1];
    imu.mz = (float)imu.magCount[2] * imu.mRes * imu.magCalibration[2] -
             imu.magbias[2];
  }

  // Must be called before updating quaternions!
  imu.updateTime();

  // Sensors x (y)-axis of the accelerometer is aligned with the y (x)-axis of
  // the magnetometer; the magnetometer z-axis (+ down) is opposite to z-axis
  // (+ up) of accelerometer and gyro! We have to make some allowance for this
  // orientation mismatch in feeding the output to the quaternion filter. For the
  // MPU-9250, we have chosen a magnetic rotation that keeps the sensor forward
  // along the x-axis just like in the LSM9DS0 sensor. This rotation can be
  // modified to allow any convenient orientation convention. This is ok by
  // aircraft orientation standards! Pass gyro rate as rad/s
  MahonyQuaternionUpdate(imu.ax, imu.ay, imu.az, imu.gx * DEG_TO_RAD,
                         imu.gy * DEG_TO_RAD, imu.gz * DEG_TO_RAD, imu.my,
                         imu.mx, imu.mz, imu.deltat);
  // Note: our board mounts the IMU upside down
//  MahonyQuaternionUpdate(imu.ax, imu.ay, -imu.az, imu.gx * DEG_TO_RAD,
//                         imu.gy * DEG_TO_RAD, -imu.gz * DEG_TO_RAD, imu.my,
//                         imu.mx, -imu.mz, imu.deltat);
  // Serial print and/or display at 0.5 s rate independent of data rates
  imu.delt_t = millis() - imu.count;

  // calculate and transmit values ever X ms
  if (imu.delt_t > IMU_REFRESH_PERIOD) {
    // if (SerialDebug) {
    // Serial.print("ax = "); Serial.print((int)1000*imu.ax);
    // Serial.print(" ay = "); Serial.print((int)1000*imu.ay);
    // Serial.print(" az = "); Serial.print((int)1000*imu.az);
    // Serial.println(" mg");
    //
    // Serial.print("gx = "); Serial.print( imu.gx, 2);
    // Serial.print(" gy = "); Serial.print( imu.gy, 2);
    // Serial.print(" gz = "); Serial.print( imu.gz, 2);
    // Serial.println(" deg/s");
    //
    // Serial.print("mx = "); Serial.print( (int)imu.mx );
    // Serial.print(" my = "); Serial.print( (int)imu.my );
    // Serial.print(" mz = "); Serial.print( (int)imu.mz );
    // Serial.println(" mG");
    //
    // Serial.print("q0 = "); Serial.print(*getQ());
    // Serial.print(" qx = "); Serial.print(*(getQ() + 1));
    // Serial.print(" qy = "); Serial.print(*(getQ() + 2));
    // Serial.print(" qz = "); Serial.println(*(getQ() + 3));
    // }

    // Define output variables from updated quaternion---these are Tait-Bryan
    // angles, commonly used in aircraft orientation. In this coordinate system,
    // the positive z-axis is down toward Earth. Yaw is the angle between Sensor
    // x-axis and Earth magnetic North (or true North if corrected for local
    // declination, looking down on the sensor positive yaw is counterclockwise.
    // Pitch is angle between sensor x-axis and Earth ground plane, toward the
    // Earth is positive, up toward the sky is negative. Roll is angle between
    // sensor y-axis and Earth ground plane, y-axis up is positive roll. These
    // arise from the definition of the homogeneous rotation matrix constructed
    // from quaternions. Tait-Bryan angles as well as Euler angles are
    // non-commutative; that is, the get the correct orientation the rotations
    // must be applied in the correct order which for this configuration is yaw,
    // pitch, and then roll.
    // For more see
    // http://en.wikipedia.org/wiki/Conversion_between_quaternions_and_Euler_angles
    // which has additional links.
    imu.yaw   = atan2(2.0f * (*(getQ() + 1) * *(getQ() + 2) + *getQ() *
                              *(getQ() + 3)), *getQ() * *getQ() + * (getQ() + 1) * *(getQ() + 1)
                      - * (getQ() + 2) * *(getQ() + 2) - * (getQ() + 3) * *(getQ() + 3));
    imu.pitch = -asin(2.0f * (*(getQ() + 1) * *(getQ() + 3) - *getQ() *
                              *(getQ() + 2)));
    imu.roll  = atan2(2.0f * (*getQ() * *(getQ() + 1) + * (getQ() + 2) *
                              *(getQ() + 3)), *getQ() * *getQ() - * (getQ() + 1) * *(getQ() + 1)
                      - * (getQ() + 2) * *(getQ() + 2) + * (getQ() + 3) * *(getQ() + 3));
    imu.pitch *= RAD_TO_DEG;
    imu.yaw   *= RAD_TO_DEG;
    imu.yaw   -= IMU_DECLINATION_ADJUSTMENT;
    imu.roll  *= RAD_TO_DEG;

    if (SERIAL_DEBUG) {
      Serial.print("Yaw, Pitch, Roll: ");
      Serial.print(imu.yaw, 2);
      Serial.print(", ");
      Serial.print(imu.pitch, 2);
      Serial.print(", ");
      Serial.println(imu.roll, 2);

      Serial.print("rate = ");
      Serial.print((float)imu.sumCount/imu.sum, 2);
      Serial.println(" Hz");
    }
  }
}

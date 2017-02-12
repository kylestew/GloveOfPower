
#include <OSCBundle.h>
#include <SLIPEncodedUSBSerial.h>
#include <Bounce2.h>
#include "quaternionFilters.h"
#include <MPU9250.h>

#define SERIAL_DEBUG  false

#define STATUS_LED  13

#define FINGER_0    9
#define FINGER_1    10
#define FINGER_2    11
#define FINGER_3    12
#define BUTTON_X    8

#define POT0        A0
#define POT1        A1
#define PHOTO_RES   A6

SLIPEncodedUSBSerial SLIPSerial(thisBoardsSerialUSB);

Bounce bounce0 = Bounce();
Bounce bounce1 = Bounce();
Bounce bounce2 = Bounce();
Bounce bounce3 = Bounce();
Bounce bounceX = Bounce();

/* IMU */
#define IMU_REFRESH_PERIOD 250 // ms
// Declination of North Park, San Diego (32°44'55.0"N 117°07'48.1"W) is
//   11.62° E  ± 0.33° on 2016-10-08
//   http://www.ngdc.noaa.gov/geomag-web/#declination
#define IMU_DECLINATION_ADJUSTMENT 11.62
// TODO: move IMU adjustment to master control
MPU9250 imu;
bool transmitIMU = false;

void setup() {
  SLIPSerial.begin(115200);

  pinMode(STATUS_LED, OUTPUT);

  // buttons are pull-up (0V == on state)
  pinMode(FINGER_0, INPUT_PULLUP);
  bounce0.attach(FINGER_0);
  bounce0.interval(5); // ms

  pinMode(FINGER_1, INPUT_PULLUP);
  bounce1.attach(FINGER_1);
  bounce1.interval(5); // ms

  pinMode(FINGER_2, INPUT_PULLUP);
  bounce2.attach(FINGER_2);
  bounce2.interval(5); // ms

  pinMode(FINGER_3, INPUT_PULLUP);
  bounce3.attach(FINGER_3);
  bounce3.interval(5); // ms

  pinMode(BUTTON_X, INPUT_PULLUP);
  bounceX.attach(BUTTON_X);
  bounceX.interval(5); // ms

  // init IMU
  beginIMU();
}

void loop() {
  updateIMU();

  // read fingers
  bounce0.update();
  int finger0 = !bounce0.read();
  bounce1.update();
  int finger1 = !bounce1.read();
  bounce2.update();
  int finger2 = !bounce2.read();
  bounce3.update();
  int finger3 = !bounce3.read();
  bounceX.update();
  int buttonX = !bounceX.read();

  OSCBundle bundle;

  bundle.add("/imu/yaw").add(imu.yaw);
  bundle.add("/imu/pitch").add(imu.pitch);
  bundle.add("/imu/roll").add(imu.roll);

  bundle.add("/fingers/0").add(finger0);
  bundle.add("/fingers/1").add(finger1);
  bundle.add("/fingers/2").add(finger2);
  bundle.add("/fingers/3").add(finger3);

  bundle.add("/pots/0").add((int32_t)analogRead(POT0));
  bundle.add("/pots/1").add((int32_t)analogRead(POT1));

  bundle.add("/extras/0").add(buttonX);
  bundle.add("/extras/1").add((int32_t)analogRead(PHOTO_RES));

  SLIPSerial.beginPacket();
  bundle.send(SLIPSerial); // send the bytes to the SLIP stream
  SLIPSerial.endPacket(); // mark the end of the OSC Packet
  bundle.empty(); // empty the bundle to free room for a new one

  delay(40);
}



// === IMU ===
void beginIMU() {
  Wire.begin();

  // Read the WHO_AM_I register, this is a good test of communication
  // byte c = imu.readByte(MPU9250_ADDRESS, WHO_AM_I_MPU9250);
  // Serial.print("MPU9250 "); Serial.print("I AM "); Serial.print(c, HEX);
  // Serial.print(" I should be "); Serial.println(0x71, HEX);

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

      // Serial.print("rate = ");
      // Serial.print((float)imu.sumCount/imu.sum, 2);
      // Serial.println(" Hz");
    }
  }
}

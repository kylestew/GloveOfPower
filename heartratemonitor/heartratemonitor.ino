#include <Arduino.h>
#include <SPI.h>
#include <InputDebounce.h>
// #include "quaternionFilters.h"
// #include <MPU9250.h>
#include "Adafruit_BLE.h"
#include "Adafruit_BluefruitLE_SPI.h"
#include "Adafruit_BLEGatt.h"


#define VERBOSE_MODE      false
#define SERIAL_DEBUG      true

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
/*
#define IMU_REFRESH_PERIOD 120 // ms
// Declination of North Park, San Diego (32°44'55.0"N 117°07'48.1"W) is
//   11.62° E  ± 0.33° on 2016-10-08
//   http://www.ngdc.noaa.gov/geomag-web/#declination
#define IMU_DECLINATION_ADJUSTMENT 11.62
// TODO: move IMU adjustment to master control
MPU9250 imu;
bool transmitIMU = false;
*/

// === UPDATE TUNING ===
#define ANALOG_VALUE_DELTA        3
#define ANALOG_POT_ZERO_THRESHOLD 14
#define UPDATE_BATT_PERC_MILLIS   12000
#define BUTTON_DEBOUNCE_DELAY     20

// === GLOBALS ===
int32_t serviceId;
int32_t analogCharIds[4] = {};
int32_t digitalCharIds[5] = {};
uint16_t analogValues[4] = {};
uint8_t digitalValues[5] = {};
int32_t imuCharId;
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
  // beginIMU();
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
  // TODO: !!!!!!!


  delay(20);
}

// === BLE ===
void beginBLE() {
  boolean success;
  Serial.print(F("Initialising the Bluefruit LE module: "));
  if (!ble.begin(VERBOSE_MODE)) {
    error(F("Couldn't find Bluefruit, make sure it's in CoMmanD mode & check wiring?"));
  }
  Serial.println(F("OK!"));

  Serial.println(F("Performing a factory reset: "));
  if (!ble.factoryReset()) {
    error(F("Couldn't factory reset"));
  }

  Serial.println("Requesting Bluefruit info:");
  ble.echo(false);
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

  // TODO: IMU

  // advertise our custom service
  Serial.print(F("Adding Service UUID to the advertising payload: "));
  ble.sendCommandCheckOK( F("AT+GAPSETADVDATA=02-01-06-11-06-2A-AC-F7-53-ED-BD-0B-85-E6-4F-3A-A7-FF-0A-F2-84"));

  Serial.print(F("Performing a SW reset (service changes require a reset): "));
  ble.reset();
}

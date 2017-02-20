#include <Arduino.h>
#include <SPI.h>
// #include <Bounce2.h>
// #include "quaternionFilters.h"
// #include <MPU9250.h>
#include "Adafruit_BLE.h"
#include "Adafruit_BluefruitLE_SPI.h"
#include "Adafruit_BLEGatt.h"


#define VERBOSE_MODE      true
#define SERIAL_DEBUG      true

#define POT0          A1
#define POT1          A2
#define PHOTO_RES     A3
#define PRESSURE_RES  A4
#define BATT_TEST     A7

#define ANALOG_VALUE_DELTA        3
#define ANALOG_POT_ZERO_THRESHOLD 14
#define UPDATE_BATT_PERC_MILLIS   12000

#define BLUEFRUIT_SPI_CS               8
#define BLUEFRUIT_SPI_IRQ              7
#define BLUEFRUIT_SPI_RST              4
Adafruit_BluefruitLE_SPI ble(BLUEFRUIT_SPI_CS, BLUEFRUIT_SPI_IRQ, BLUEFRUIT_SPI_RST);

// BLE GATT command helper
Adafruit_BLEGatt gatt(ble);


void error(const __FlashStringHelper*err) {
  Serial.println(err);
  while (1);
}

int32_t serviceId;
int32_t imuInputId;
// int32_t digitalInputsId;

int32_t analog0_charId;
uint16_t analog0_prev;
int32_t analog1_charId;
uint16_t analog1_prev;
int32_t analog2_charId;
uint16_t analog2_prev;
int32_t analog3_charId;
uint16_t analog3_prev;

long lastBattUpdateMillis = 0;

void setup(void) {
  delay(500);

  boolean success;

  Serial.begin(115200);

  Serial.print(F("Initialising the Bluefruit LE module: "));
  if (!ble.begin(VERBOSE_MODE)) {
    error(F("Couldn't find Bluefruit, make sure it's in CoMmanD mode & check wiring?"));
  }
  Serial.println(F("OK!"));

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

  // IMU
  // DIGITAL

  // ANALOG input characteristics
  const struct GattPresentationFormat format_uint16 = {GATT_PRESENT_FORMAT_UINT16};
  analog0_charId = gatt.addCharacteristic(0x0001, GATT_CHARS_PROPERTIES_NOTIFY, 1, 2, BLE_DATATYPE_BYTEARRAY, "/analog/0", &format_uint16);
  if (analog0_charId == 0)
    error(F("Could not add characteristic"));

  analog1_charId = gatt.addCharacteristic(0x0002, GATT_CHARS_PROPERTIES_NOTIFY, 1, 2, BLE_DATATYPE_BYTEARRAY, "/analog/1", &format_uint16);
  if (analog1_charId == 0)
    error(F("Could not add characteristic"));

  analog2_charId = gatt.addCharacteristic(0x0003, GATT_CHARS_PROPERTIES_NOTIFY, 1, 2, BLE_DATATYPE_BYTEARRAY, "/analog/2", &format_uint16);
  if (analog2_charId == 0)
    error(F("Could not add characteristic"));

  analog3_charId = gatt.addCharacteristic(0x0004, GATT_CHARS_PROPERTIES_NOTIFY, 1, 2, BLE_DATATYPE_BYTEARRAY, "/analog/3", &format_uint16);
  if (analog3_charId == 0)
    error(F("Could not add characteristic"));

  // advertise our custom service
  Serial.print(F("Adding Service UUID to the advertising payload: "));
  ble.sendCommandCheckOK( F("AT+GAPSETADVDATA=02-01-06-11-06-2A-AC-F7-53-ED-BD-0B-85-E6-4F-3A-A7-FF-0A-F2-84"));

  Serial.print(F("Performing a SW reset (service changes require a reset): "));
  ble.reset();

  Serial.println();
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
  uint16_t analog0 = (uint16_t)analogRead(POT0);
  if (analog0 < ANALOG_POT_ZERO_THRESHOLD) analog0 = 0;
  if (abs(analog0_prev - analog0) > ANALOG_VALUE_DELTA) {
    gatt.setChar(analog0_charId, (uint16_t)analog0);
    analog0_prev = analog0;
  }
  uint16_t analog1 = (uint16_t)analogRead(POT1);
  if (analog1 < ANALOG_POT_ZERO_THRESHOLD) analog1 = 0;
  if (abs(analog1_prev - analog1) > ANALOG_VALUE_DELTA) {
    gatt.setChar(analog1_charId, (uint16_t)analog1);
    analog1_prev = analog1;
  }
  uint16_t analog2 = (uint16_t)analogRead(PHOTO_RES);
  if (abs(analog2_prev - analog2) > 3 * ANALOG_VALUE_DELTA) {
    gatt.setChar(analog2_charId, (uint16_t)analog2);
    analog2_prev = analog2;
  }
  uint16_t analog3 = (uint16_t)analogRead(PRESSURE_RES);
  if (abs(analog3_prev - analog3) > 3 * ANALOG_VALUE_DELTA) {
    gatt.setChar(analog3_charId, (uint16_t)analog3);
    analog3_prev = analog3;
  }

  // digitals

  // IMU




  delay(20);
}

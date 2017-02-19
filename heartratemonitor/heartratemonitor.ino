#include <Arduino.h>
#include <SPI.h>

#include "Adafruit_BLE.h"
#include "Adafruit_BluefruitLE_SPI.h"
#include "Adafruit_BluefruitLE_UART.h"


#define VERBOSE_MODE                   true  // If set to 'true' enables debug output

#define POT0        A0
#define POT1        A1
#define PHOTO_RES   A6

#define BLUEFRUIT_SPI_CS               8
#define BLUEFRUIT_SPI_IRQ              7
#define BLUEFRUIT_SPI_RST              4
Adafruit_BluefruitLE_SPI ble(BLUEFRUIT_SPI_CS, BLUEFRUIT_SPI_IRQ, BLUEFRUIT_SPI_RST);


// A small helper
void error(const __FlashStringHelper*err) {
  Serial.println(err);
  while (1);
}

int32_t serviceId;
int32_t imuInputId;
int32_t digitalInputsId;
int32_t analogInputsId;

void setup(void) {

  while (!Serial);  // required for Flora & Micro

  delay(500);

  boolean success;

  Serial.begin(115200);
  Serial.println(F("Adafruit Bluefruit Heart Rate Monitor (HRM) Example"));
  Serial.println(F("---------------------------------------------------"));

  randomSeed(micros());

  /* Initialise the module */
  Serial.print(F("Initialising the Bluefruit LE module: "));
  if (!ble.begin(VERBOSE_MODE)) {
    error(F("Couldn't find Bluefruit, make sure it's in CoMmanD mode & check wiring?"));
  }
  Serial.println(F("OK!"));

  /* Perform a factory reset to make sure everything is in a known state */
  Serial.println(F("Performing a factory reset: "));
  if (!ble.factoryReset()){
    error(F("Couldn't factory reset"));
  }

  /* Disable command echo from Bluefruit */
  ble.echo(false);

  Serial.println("Requesting Bluefruit info:");
  /* Print Bluefruit information */
  ble.info();

  /* Change the device name to make it easier to find */
  Serial.println(F("Setting device name to 'GloveOfPower': "));
  if (!ble.sendCommandCheckOK(F("AT+GAPDEVNAME=GloveOfPower"))) {
    error(F("Could not set device name?"));
  }

  // Custom service definition
  Serial.println(F("Adding the Service definition (UUID): "));
  success = ble.sendCommandWithIntReply(F("AT+GATTADDSERVICE=UUID128=84-F2-0A-FF-A7-3A-4F-E6-85-0B-BD-ED-53-F7-AC-2A"), &serviceId);
  if (!success) {
    error(F("Could not add service"));
  }

  // add battery service
  ble.sendCommandCheckOK(F("AT+BLEBATTEN=1"));

  // IMU
  // DIGITAL

  // ANALOG inputs characteristic
  Serial.println(F("Adding the characteristic"));
  success = ble.sendCommandWithIntReply(F("AT+GATTADDCHAR=UUID=0x0002,PROPERTIES=0x10,MIN_LEN=4,MAX_LEN=4,VALUE=0,DESCRIPTION=analogs"), &analogInputsId);
  if (!success) {
    error(F("Could not add characteristic"));
  }

  // /* Add the Body Sensor Location characteristic */
  // /* Chars ID for Body should be 2 */
  // Serial.println(F("Adding the Body Sensor Location characteristic (UUID = 0x2A38): "));
  // success = ble.sendCommandWithIntReply( F("AT+GATTADDCHAR=UUID=0x2A38, PROPERTIES=0x02, MIN_LEN=1, VALUE=3"), &hrmLocationCharId);
  //   if (! success) {
  //   error(F("Could not add BSL characteristic"));
  // }

  /* Add the Heart Rate Service to the advertising data (needed for Nordic apps to detect the service) */
  Serial.print(F("Adding Service UUID to the advertising payload: "));
  ble.sendCommandCheckOK( F("AT+GAPSETADVDATA=02-01-06-11-06-2A-AC-F7-53-ED-BD-0B-85-E6-4F-3A-A7-FF-0A-F2-84"));

  /* Reset the device for the new service setting changes to take effect */
  Serial.print(F("Performing a SW reset (service changes require a reset): "));
  ble.reset();

  Serial.println();
}

void loop(void) {


  // TODO: every so often send battery updates
  ble.println(F("AT+BLEBATTVAL=72"));


  /* Command is sent when \n (\r) or println is called */
  /* AT+GATTCHAR=CharacteristicID,value */
  ble.print(F("AT+GATTCHAR="));
  ble.print(analogInputsId);
  ble.print(F(","));

  char buff[3];
  sprintf(buff, "%03X", (int32_t)analogRead(POT0));
  ble.println(buff);




  /* Check if command executed OK */
  if (!ble.waitForOK()) {
    Serial.println(F("Failed to get response!"));
  }

  /* Delay before next measurement update */
  delay(2000);
}

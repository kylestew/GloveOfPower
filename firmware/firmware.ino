
#include <OSCBundle.h>
#include <SLIPEncodedUSBSerial.h>
#include <Bounce2.h>

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
}

void loop() {
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

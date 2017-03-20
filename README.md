# GloveOfPower
In progress generalized musical instrument interface. Uses BLE to talk to your computer or mobile device. 

## 3 Parts

### Arduino based controller

Captures input from user - broadcasts via BLE

### BLE to OSC client

Command line process that captures BLE input from controller and broadcasts as OSC data over local port

### MaxMSP patch

Drop in as a bpatcher or simple patch to get broken out inputs - modify if you create a new controller

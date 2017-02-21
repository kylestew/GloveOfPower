#import "bleoscProcess.h"
#import <OSCKit/OSCKit.h>
#import "BLEConnector.h"

@interface bleoscProcess() <BLEConnectorDelegate> {
    NSString* _udpAddr;
}

@property (nonatomic, strong) BLEConnector* connector;
@property (nonatomic, strong) OSCClient *client;

@end

@implementation bleoscProcess

- (void)start {
    _udpAddr = @"udp://localhost:4298";
    self.client = [[OSCClient alloc] init];
    
    self.connector = [[BLEConnector alloc] initWithTargetServiceUUID:@"84F20AFF-A73A-4FE6-850B-BDED53F7AC2A"];
    self.connector.delegate = self;
    [self.connector connect];
}

- (void)stop {
    [self.connector disconnect];
}

#pragma mark - BLEConnectorDelegate
- (void)connectorDidError {
    // TODO: shutdown cleanly?
    
    self.shouldExit = YES;
}

- (void)connectorDidUpdateBatteryLevel:(int)level {
    [self connectorDidUpdateValue:level forDescription:@"/battery"];
}

- (void)connectorDidUpdateIMUWithYaw:(float)yaw andPitch:(float)pitch andRoll:(float)roll {
    OSCMessage* mess = [OSCMessage to:@"/imu" with:@[ @(yaw), @(pitch), @(roll) ]];
    [self.client sendMessage:mess to:_udpAddr];
}

- (void)connectorDidUpdateValue:(int)value forDescription:(NSString *)description {
    OSCMessage* mess = [OSCMessage to:description with:@[ @(value) ]];
    [self.client sendMessage:mess to:_udpAddr];
}

@end

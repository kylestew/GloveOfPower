#import "bleoscProcess.h"
#import <OSCKit/OSCKit.h>
#import "BLEConnector.h"

@interface bleoscProcess() <BLEConnectorDelegate>

@property (nonatomic, strong) BLEConnector* connector;
@property (nonatomic, strong) OSCClient *client;

@end

@implementation bleoscProcess

- (void)start {
    self.client = [[OSCClient alloc] init];
    
    self.connector = [[BLEConnector alloc] initWithTargetServiceUUID:@"84F20AFF-A73A-4FE6-850B-BDED53F7AC2A"];
    self.connector.delegate = self;
    [self.connector connect];
}

#pragma mark - BLEConnectorDelegate
- (void)connectorDidError {
    // TODO: shutdown cleanly?
    
    self.shouldExit = YES;
}

- (void)connectorDidUpdateBatteryLevel:(int)level {
    OSCMessage* mess = [OSCMessage to:@"/battery" with:@[ @(level) ]];
    [self.client sendMessage:mess to:@"udp://localhost:4298"];
}

@end

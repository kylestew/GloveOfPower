#import <Foundation/Foundation.h>
@protocol BLEConnectorDelegate;

@interface BLEConnector : NSObject

@property (nonatomic, assign) id<BLEConnectorDelegate> delegate;

- (instancetype)initWithTargetServiceUUID:(NSString*)uuid;

- (void)connect;
- (void)disconnect;

@end

@protocol BLEConnectorDelegate <NSObject>

- (void)connectorDidError;
- (void)connectorDidUpdateBatteryLevel:(int)level;
- (void)connectorDidUpdateIMUWithYaw:(float)yaw andPitch:(float)pitch andRoll:(float)roll;
- (void)connectorDidUpdateValue:(int)value forDescription:(NSString*)description;

@end

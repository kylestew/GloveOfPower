#import <Foundation/Foundation.h>
@protocol BLEConnectorDelegate;

@interface BLEConnector : NSObject

@property (nonatomic, assign) id<BLEConnectorDelegate> delegate;

- (instancetype)initWithTargetServiceUUID:(NSString*)uuid;

- (void)connect;

@end

@protocol BLEConnectorDelegate <NSObject>

- (void)connectorDidError;
- (void)connectorDidUpdateBatteryLevel:(int)level;
//- (void)connectorDidUpdateValue:(int)value forSomething:

@end

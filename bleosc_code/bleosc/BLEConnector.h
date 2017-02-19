#import <Foundation/Foundation.h>

@interface BLEConnector : NSObject

@property (nonatomic, assign) BOOL shouldExit;

- (void)start;

@end

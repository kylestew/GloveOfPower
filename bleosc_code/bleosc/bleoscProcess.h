#import <Foundation/Foundation.h>

@interface bleoscProcess : NSObject

@property (nonatomic, assign) BOOL shouldExit;

- (void)start;
- (void)stop;

@end

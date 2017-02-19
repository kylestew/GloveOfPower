#import <Foundation/Foundation.h>

#import "bleoscProcess.h"

void SignalHandler(int signum) { NSLog(@"user did: %u", signum); }

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        // catch ctrl-c so we can shutdown
        signal(SIGINT, SignalHandler);
        
//        if (argc!=2) {
//            
//            // output usage
//            printf("Usage: bleosc <devicename>\n");
//            
//            // leave with code 1
//            exit(1);
//            
//        } else {
        
//            NSString* deviceName = [NSString stringWithUTF8String:argv[1]];
        
//            printf("Attempting to connect to %s...\n", [deviceName UTF8String]);
            
            bleoscProcess* main = [bleoscProcess new];
            [main start];
        
            // keep alive forever
            NSRunLoop* runLoop = [NSRunLoop currentRunLoop];
            
            // enter run loop
            while((!(main.shouldExit)) && (([runLoop runMode:NSDefaultRunLoopMode beforeDate:[NSDate dateWithTimeIntervalSinceNow:2]])));
            
//        }
    }
    return 0;
}

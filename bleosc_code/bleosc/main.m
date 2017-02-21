#import <Foundation/Foundation.h>

#import "bleoscProcess.h"

static bleoscProcess* proc;

void SignalHandler(int signum) {
    // disconnect from BLE process
    [proc stop];
    
    exit(1);
}

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
            
            proc = [bleoscProcess new];
            [proc start];
        
            // keep alive forever
            NSRunLoop* runLoop = [NSRunLoop currentRunLoop];
            
            // enter run loop
            while((!(proc.shouldExit)) && (([runLoop runMode:NSDefaultRunLoopMode beforeDate:[NSDate dateWithTimeIntervalSinceNow:2]])));
            
//        }
    }
    return 0;
}

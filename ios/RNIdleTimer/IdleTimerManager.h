#import <UIKit/UIKit.h>
#if __has_include("RCTBridgeModule.h")
#import "RCTBridgeModule.h"
#else
#import <React/RCTBridgeModule.h>
#endif

@interface IdleTimerManager : NSObject <RCTBridgeModule>

+ (void)activate:(NSString*)tag;
+ (void)deactivate:(NSString*)tag;

@end

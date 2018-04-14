#import "IdleTimerManager.h"

@implementation IdleTimerManager

RCT_EXPORT_MODULE();

RCT_EXPORT_METHOD(setIdleTimerDisabled:(BOOL)disabled) {
    dispatch_async(dispatch_get_main_queue(), ^{
        [UIApplication sharedApplication].idleTimerDisabled = disabled;
    });
}

@end

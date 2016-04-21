#import "IdleTimerManager.h"

@implementation IdleTimerManager

RCT_EXPORT_MODULE();

RCT_EXPORT_METHOD(setIdleTimerDisabled:(BOOL)disabled) {
    [UIApplication sharedApplication].idleTimerDisabled = disabled;
}

@end

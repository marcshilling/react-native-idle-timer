#import "IdleTimerManager.h"

const static NSMutableSet *tags;

@implementation IdleTimerManager

+ (void) initialize {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        tags = [NSMutableSet set];
    });
}

RCT_EXPORT_MODULE();

RCT_EXPORT_METHOD(setIdleTimerDisabled:(BOOL)disabled tag:(NSString *)tag) {
    if (disabled) {
        [IdleTimerManager activate:tag];
    } else {
        [IdleTimerManager deactivate:tag];
    }
}

+ (void)activate:(NSString*)tag {
    if ([tags count] == 0) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [UIApplication sharedApplication].idleTimerDisabled = YES;
        });
    }

    [tags addObject:tag ?: @""];
}

+ (void)deactivate:(NSString*)tag {
    if ([tags count] == 1 && [tags containsObject:tag ?: @""]) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [UIApplication sharedApplication].idleTimerDisabled = NO;
        });
    }

    [tags removeObject:tag ?: @""];
}

@end

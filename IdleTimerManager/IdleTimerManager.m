//
//  IdleTimerManager.m
//  DiscoveryVR
//
//  Created by Marc Shilling on 8/25/15.
//  Copyright (c) 2015 Facebook. All rights reserved.
//

#import "IdleTimerManager.h"

@implementation IdleTimerManager

RCT_EXPORT_MODULE();

RCT_EXPORT_METHOD(setIdleTimerDisabled:(BOOL)disabled) {
    [UIApplication sharedApplication].idleTimerDisabled = disabled;
}

@end

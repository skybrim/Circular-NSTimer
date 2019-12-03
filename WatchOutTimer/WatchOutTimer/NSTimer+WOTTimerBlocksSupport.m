//
//  NSTimer+WOTTimerBlocksSupport.m
//  WatchOutTimer
//
//  Created by wiley on 2019/12/3.
//  Copyright © 2019 wiley. All rights reserved.
//

#import "NSTimer+WOTTimerBlocksSupport.h"

@implementation NSTimer (WOTTimerBlocksSupport)

+ (NSTimer *)w_scheduledTimerWithTimeInterval:(NSTimeInterval)interval repeats:(BOOL)repeats block:(dispatch_block_t)block {
    return [self scheduledTimerWithTimeInterval:interval
                                         target:self
                                       selector:@selector(w_blockInvoke:)
                                       userInfo:[block copy]
                                        repeats:repeats];
}

+ (void)w_blockInvoke:(NSTimer *)timer {
    dispatch_block_t block = timer.userInfo;
    if (block) {
        block();
    }
}

@end

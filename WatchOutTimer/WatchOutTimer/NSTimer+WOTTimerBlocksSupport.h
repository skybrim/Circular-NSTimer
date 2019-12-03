//
//  NSTimer+WOTTimerBlocksSupport.h
//  WatchOutTimer
//
//  Created by wiley on 2019/12/3.
//  Copyright © 2019 wiley. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSTimer (WOTTimerBlocksSupport)

+ (NSTimer *)w_scheduledTimerWithTimeInterval:(NSTimeInterval)interval repeats:(BOOL)repeats block:(dispatch_block_t)block;

@end

NS_ASSUME_NONNULL_END

//
//  NSTimer+timer.h
//  BaseAPPFramework
//
//  Created by mac on 2019/1/14.
//  Copyright © 2019年 Robinson. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSTimer (timer)
typedef void(^ZJTimerCallback)(NSTimer *timer);


/**
 *    创建一个有时间间隔的计时器，重复或不重复，以及回调。
 *
 *    @param interval    Time interval
 *    @param repeats    Whether repeat to schedule.
 *    @param callback The callback block.
 *
 *    @return Timer object.
 */
+ (NSTimer *)zj_scheduledTimerWithTimeInterval:(NSTimeInterval)interval
                                       repeats:(BOOL)repeats
                                      callback:(ZJTimerCallback)callback;

/**
 *    创建具有时间间隔、重复计数和回调的计时器。
 *
 *    @param interval    Time interval
 *    @param count        When count <= 0, it means repeat.
 *    @param callback    The callback block
 *
 *    @return Timer object
 */
+ (NSTimer *)zj_scheduledTimerWithTimeInterval:(NSTimeInterval)interval
                                         count:(NSInteger)count
                                      callback:(ZJTimerCallback)callback;

/**
 *    立即开始计时。
 */
- (void)zj_fireTimer;

/**
 *    立即暂停计时器
 */
- (void)zj_unfireTimer;

/**
 *    销毁计时器
 */
- (void)zj_invalidate;
@end

NS_ASSUME_NONNULL_END

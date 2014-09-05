//
//  CalculateFuncTime.h
//  myProject
//
//  Created by NetEase on 14-9-3.
//  Copyright (c) 2014年 user. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CalculateFuncTime : NSObject
/**
 *  计算block的执行时间
 *
 *  @return 返回执行的时间
 */
+ (CGFloat)TimeBlock:(void(^)(void)) function;
/**
 *
 *
 *  @param endTime   结束时间
 *  @param beginTime 开始时间
 *
 *  @return 返回 结束时间-开始时间
 */
+ (CGFloat)timeSubtractEndTime:(uint64_t)endTime
                     startTime:(uint64_t)beginTime;


@end

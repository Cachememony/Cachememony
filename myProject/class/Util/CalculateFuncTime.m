//
//  CalculateFuncTime.m
//  myProject
//
//  Created by NetEase on 14-9-3.
//  Copyright (c) 2014年 user. All rights reserved.
//

#import "CalculateFuncTime.h"
#import <mach/mach_time.h>
@implementation CalculateFuncTime
+ (CGFloat)TimeBlock:(void(^)(void)) function
{
    mach_timebase_info_data_t info;
    if (mach_timebase_info(&info) != KERN_SUCCESS)
    {
        return -1.0;
    }
    uint64_t start = mach_absolute_time();
    function();
    uint64_t end = mach_absolute_time();
    uint64_t elapsed = end - start;
    uint64_t nanos = elapsed * info.numer / info.denom;
    return (CGFloat)nanos / NSEC_PER_SEC;
    
}
+ (CGFloat)timeSubtractEndTime:(uint64_t)endTime
                     startTime:(uint64_t)beginTime
{
    mach_timebase_info_data_t info;
    if (mach_timebase_info(&info) != KERN_SUCCESS)
    {
        return -1.0;
    }
    uint64_t elapsed = endTime - beginTime;
    uint64_t nanos = elapsed * info.numer / info.denom;
    return (CGFloat)nanos / NSEC_PER_SEC;
}

@end

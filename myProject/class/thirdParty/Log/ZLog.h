//
//  ZLog.h
//  cocoaPodsZLog
//
//  Created by zorro on 5/27/14.
//  Copyright (c) 2014 CoSciCo Technologies Corp. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import "DDLog.h"
#import "DDLog.h"
#import "DDLogMacros.h"
#ifdef DEBUG
static const int ddLogLevel = LOG_LEVEL_DEBUG;
#else
static const int ddLogLevel = LOG_LEVEL_WARN;
#endif

#define ZLogError(s, ...)     DDLogError(@"<%@:(%d) - %@> %@", [[NSString stringWithUTF8String:__FILE__] lastPathComponent], __LINE__, NSStringFromSelector(_cmd), [NSString stringWithFormat:(s), ##__VA_ARGS__])
#define ZLogWarn(s, ...)     DDLogWarn(@"<%@:(%d) - %@> %@", [[NSString stringWithUTF8String:__FILE__] lastPathComponent], __LINE__, NSStringFromSelector(_cmd), [NSString stringWithFormat:(s), ##__VA_ARGS__])
#define ZLogInfo(s, ...)     DDLogInfo(@"<%@:(%d) - %@> %@", [[NSString stringWithUTF8String:__FILE__] lastPathComponent], __LINE__, NSStringFromSelector(_cmd), [NSString stringWithFormat:(s), ##__VA_ARGS__])
#define ZLogDebug(s, ...)     DDLogDebug(@"<%@:(%d) - %@> %@", [[NSString stringWithUTF8String:__FILE__] lastPathComponent], __LINE__, NSStringFromSelector(_cmd), [NSString stringWithFormat:(s), ##__VA_ARGS__])

@interface ZLog : NSObject

+ (void)config;

@end

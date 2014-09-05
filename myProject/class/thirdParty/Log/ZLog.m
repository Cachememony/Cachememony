//
//  ZLog.m
//  cocoaPodsZLog
//
//  Created by zorro on 5/27/14.
//  Copyright (c) 2014 CoSciCo Technologies Corp. All rights reserved.
//

#import "ZLog.h"
#import "DDTTYLogger.h"
#import "DDFileLogger.h"

@implementation ZLog

+ (void)config {
    setenv("XcodeColors", "YES", 0); // enalbe XcodeColors in XCode
    
    DDFileLogger *fileLogger = [[DDFileLogger alloc] init];
    fileLogger.rollingFrequency = 60 * 60 * 24; // 24 hour rolling
    fileLogger.logFileManager.maximumNumberOfLogFiles = 7; // a week log files
    
    [DDLog addLogger:fileLogger withLogLevel:LOG_LEVEL_WARN];
    [DDLog addLogger:[DDTTYLogger sharedInstance] withLogLevel:LOG_LEVEL_DEBUG];
    [[DDTTYLogger sharedInstance] setColorsEnabled:YES];
    
#if TARGET_OS_IPHONE
    UIColor *pink = [UIColor colorWithRed:(180/255.0) green:(25/255.0) blue:(130/255.0) alpha:1.0];
    UIColor *green = [UIColor colorWithRed:(130/255.0) green:(190/255.0) blue:(90/255.0) alpha:1.0];
#else
    NSColor *pink = [NSColor colorWithCalibratedRed:(180/255.0) green:(25/255.0) blue:(130/255.0) alpha:1.0];
    NSColor *green = [NSColor colorWithCalibratedRed:(130/255.0) green:(190/255.0) blue:(90/255.0) alpha:1.0];
#endif
    
    [[DDTTYLogger sharedInstance] setForegroundColor:pink backgroundColor:nil forFlag:LOG_FLAG_INFO];
    [[DDTTYLogger sharedInstance] setForegroundColor:green backgroundColor:nil forFlag:LOG_FLAG_DEBUG];
    
}

@end

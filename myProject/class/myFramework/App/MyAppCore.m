//
//  myAppCore.m
//  myProject
//
//  Created by lwc on 14-7-22.
//  Copyright (c) 2014年 user. All rights reserved.
//

#import "myAppCore.h"
#import "ServiceManager.h"
#import "DelegateExecute.h"
#import "ZLog.h"

@interface MyAppCore()
@property (nonatomic, strong) id<ServiceManagerProtocol> serviceManager;

@end



@implementation MyAppCore
@synthesize serviceManager;
+ (instancetype) sharedMyAppCore
{
    static MyAppCore *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[MyAppCore alloc]init];
    });
    return instance;

}

- (id)init
{
    self = [super init];
    if (self)
    {
        self.serviceManager = [[ServiceManager alloc] init];
    }
    return self;
}

#pragma mark service
//加载登陆前要使用的service
- (void)loadPreLoginService
{
    [DelegateExecute executeNoParamDelegate:self.appCoreServiceDelegate selector:@selector(loadPreLoginService)];
}
//加载登陆后要使用的service
- (void)loadCoreService
{
    [DelegateExecute executeNoParamDelegate:self.appCoreServiceDelegate selector:@selector(loadCoreService)];
}
- (id<ServiceProtocol>) getServiceFromCore:(NSString*)serviceID
{
    return [self.serviceManager getServiceWithID:serviceID];
}
- (void)initApp
{
    [ZLog config];
    ZLogInfo(@"app start");
    ZLogError(@"app error info");
    ZLogWarn(@"app warning info");
    ZLogDebug(@"app debug info");
}

@end

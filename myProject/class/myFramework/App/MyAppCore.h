//
//  myAppCore.h
//  myProject
//
//  Created by lwc on 14-7-22.
//  Copyright (c) 2014年 user. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ServiceManager.h"




@interface MyAppCore : NSObject
@property (nonatomic, assign) id<AppCoreServiceProtocol> appCoreServiceDelegate;


+ (instancetype) sharedMyAppCore;

#pragma mark service
- (void)initApp;
- (void)loadPreLoginService;
- (void)loadCoreService;
- (id<ServiceProtocol>) getServiceFromCore:(NSString*)serviceID;

#pragma mark document


#pragma mark user



@end

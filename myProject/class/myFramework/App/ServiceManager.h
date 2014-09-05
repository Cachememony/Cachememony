//
//  ServiceManager.h
//  myProject
//
//  Created by lwc on 14-7-22.
//  Copyright (c) 2014年 user. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ServiceProtocol.h"

@protocol ServiceManagerProtocol <NSObject>


- (void)registerService:(id<ServiceProtocol>)service;
- (void)unregisterService:(id<ServiceProtocol>)service;
- (void)unregisterServiceWithID:(NSString*)serviceID;
- (id<ServiceProtocol>) getServiceWithID:(NSString*)serviceID;

@end
@interface ServiceManager : NSObject<ServiceManagerProtocol>


@end

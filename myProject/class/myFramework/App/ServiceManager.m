//
//  ServiceManager.m
//  myProject
//
//  Created by lwc on 14-7-22.
//  Copyright (c) 2014年 user. All rights reserved.
//

#import "ServiceManager.h"
@interface ServiceManager()

@property (nonatomic, retain) NSMutableDictionary *serviceDictionay;

@end
@implementation ServiceManager
- (id)init
{
    self = [super init];
    if (self)
    {
        _serviceDictionay = [[NSMutableDictionary alloc] init];
    }
    return self;
}

- (void)registerService:(id<ServiceProtocol>)service
{
    if ([service.serviceID length] <=0)
    {
        assert(0);
        return;
    }
    [_serviceDictionay setObject:service forKey:[service serviceID]];
}
- (void)unregisterService:(id<ServiceProtocol>)service
{
    [self unregisterServiceWithID:[service serviceID]];
}
- (void)unregisterServiceWithID:(NSString*)serviceID
{
    if ([serviceID length] <=0)
    {
        NSLog(@"service ID is empty");
        assert(0);
        return;
    }
    [_serviceDictionay removeObjectForKey:serviceID];
}
- (id<ServiceProtocol>) getServiceWithID:(NSString*)serviceID
{
    return [_serviceDictionay objectForKey:serviceID];
}
@end

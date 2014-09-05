//
//  ServiceProtocol.h
//  myProject
//
//  Created by lwc on 14-7-22.
//  Copyright (c) 2014年 user. All rights reserved.
//

#import <Foundation/Foundation.h>
@protocol AppCoreServiceProtocol <NSObject>

//加载登陆前要使用的service
- (void)loadPreLoginService;
//加载登陆后要使用的service
- (void)loadCoreService;

@end



@protocol ServiceProtocol <NSObject>
@property (nonatomic, assign) NSString  *serviceID;

@required
- (BOOL)onLoad;
- (void)onUnload;


@optional
@end


@protocol ResponseDataDelegate <NSObject>
- (void)onResponse:(NSInteger)code object:(id)object;
@end


//需要和服务交互的service
@protocol ServerServiceProtocol <ServiceProtocol>
@property (nonatomic, assign) id<ResponseDataDelegate> delegate;
@required
- (NSInteger)onPacket;
- (NSInteger)onWaitablePacket;



@end
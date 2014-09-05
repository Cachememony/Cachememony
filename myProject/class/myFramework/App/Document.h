//
//  Document.h
//  myProject
//
//  Created by book on 14-8-31.
//  Copyright (c) 2014年 user. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ServiceProtocol.h"

@interface DocProppertyItem : NSObject


@end



@interface DocDataItem : NSObject


@end


@protocol DocumentOperatorProtocol <NSObject>
/**
 *  保存数据
 */
- (void)save;
/**
 *  加载数据
 */
- (void)Load;
/**
 *  打开数据
 *
 *  @param service   关联的service
 *  @param dataID    dataID标记
 *  @param needCache 是否需要缓存
 *  @param needSync  是否需要同步
 *  @param needLocal 是否需要本地另存为
 */
- (void)openData:(id<ServiceProtocol>) service
          dataID:(NSString*)dataID
       needCache:(BOOL)needCache
        needSync:(BOOL)needSync
       needLocal:(BOOL)needLocal;

/**
 *  返回所有数据的keys
 *
 *  @param keys 保存keys
 */
- (void)returnAllDatas:(NSArray*)keys;

/**
 *  关闭dataID的数据
 *
 *  @param dataID标记
 */
- (void)closeData:(NSString*)dataID;

- (void)getDataItems:(NSString*)dataID
          returnKeys:(NSArray*)keys;
- (void)getDataItems:(NSString*)dataID
          lowerBound:(NSString*)lowerBound
          upperBound:(NSString*)upperBound
          returnKeys:(NSArray*)keys;

- (void)getDataItem:(NSString*)dataID
             itemID:(NSString*)itemID
     returnProperty:(NSDictionary*)dic;

- (BOOL)hasDataItem:(NSString*)dataID
             itemID:(NSString*)itemID;



@end

@protocol DocumentObserverProtocol <NSObject>

- (void)watch:(id)watchClass
 watchHandler:(SEL)handler
       dataID:(NSString*)dataID
       itemID:(NSString*)itemID
          tag:(NSInteger)tag;

- (void)revokeWithHandler:(SEL)handler;
- (void)revokeWithClass:(id)watchClass;
- (void)revokeAll;



@end


@interface Document : NSObject<DocumentOperatorProtocol>


@end

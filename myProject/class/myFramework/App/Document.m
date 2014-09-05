//
//  Document.m
//  myProject
//
//  Created by book on 14-8-31.
//  Copyright (c) 2014年 user. All rights reserved.
//

#import "Document.h"

typedef NS_ENUM(NSInteger, kDocEvent){
    kDocEventAdd,       //数据被添加       (ItemId)
    kDocEventChanged,   //数据发生改变     (TagId)
    kDocEventDeleted,   // 数据被删除      (DataId,ItemId)
    kDocEventReset,     //数据被重置       (DataId,ItemId,TagId)
};




@interface DocProppertyItem()
@property (nonatomic, retain) NSMutableDictionary *propertyDic;

@end


@implementation DocProppertyItem




@end


@interface DocDataItem()
@property (nonatomic, retain) NSMutableDictionary *itemDic;



@end
@implementation DocDataItem


@end








@interface Document()
@property (nonatomic, retain) NSMutableDictionary *dataDic;


@end


@implementation Document


@end

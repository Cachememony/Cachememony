//
//  DelegateExecute.m
//  myProject
//
//  Created by lwc on 14-7-22.
//  Copyright (c) 2014年 user. All rights reserved.
//

#import "DelegateExecute.h"

@implementation DelegateExecute
+ (void)executeNoParamDelegate:(id)delegate selector:(SEL)sel
{
    if (delegate)
    {
        if ([delegate respondsToSelector:sel])
        {
            [delegate performSelector:sel];
        }
        else
        {
            NSString *selName = [NSString stringWithUTF8String:sel_getName(sel)];
            NSLog(@"delegate not respondsToSelector %@", selName);
            assert(0);
        }
    }
    else
    {
        NSString *selName = [NSString stringWithUTF8String:sel_getName(sel)];
        NSLog(@"delegate is nil, respondsToSelector %@", selName);
        assert(0);
    }
}
@end

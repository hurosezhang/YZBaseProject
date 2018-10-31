//
//  YZAccountTool.m
//  YZBaseProject
//
//  Created by zhangyongkang on 2018/6/14.
//  Copyright © 2018年 JWHL.com. All rights reserved.
//

#import "YZAccountTool.h"
#import "YZAccountModel.h"



#define AccountFileName [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES)[0] stringByAppendingPathComponent:@"YZaccount.data"]

// 类方法一般用静态变量代替成员属性
static YZAccountModel *_account = nil;

@implementation YZAccountTool



@end

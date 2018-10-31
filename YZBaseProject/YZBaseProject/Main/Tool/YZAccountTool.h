//
//  YZAccountTool.h
//  YZBaseProject
//
//  Created by zhangyongkang on 2018/6/14.
//  Copyright © 2018年 JWHL.com. All rights reserved.
//

#import <Foundation/Foundation.h>
@class YZAccountModel;
@interface YZAccountTool : NSObject

/**
 当前登录的用户的信息
 
 @return <#return value description#>
 */
+ (YZAccountModel *)account;

@end

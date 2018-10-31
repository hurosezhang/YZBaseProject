//
//  MainTool.h
//  YZBaseProject
//
//  Created by zhangyongkang on 2018/6/17.
//  Copyright © 2018年 JWHL.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MainTool : NSObject
/**
 登录成功,进入主页
 */
+(void) changeMainControllerToRootViewController;

/**
 退出登录,进入登录界面
 */
+(void) changeLoginControllerToRootViewController;

@end

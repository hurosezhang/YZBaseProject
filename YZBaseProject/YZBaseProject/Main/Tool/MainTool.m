//
//  MainTool.m
//  YZBaseProject
//
//  Created by zhangyongkang on 2018/6/17.
//  Copyright © 2018年 JWHL.com. All rights reserved.
//

#import "MainTool.h"
#import "YZLoginViewController.h"
#import "YZNavigationViewController.h"
#import "UIView+YLXTransitionAnimation.h"
#import "YZMainViewController.h"
@implementation MainTool

+(void) changeMainControllerToRootViewController
{
    
    UIApplication *app = [UIApplication sharedApplication];
    
    [app.keyWindow doAnimationWithType:YLXTransitionAnimationTypeReveal subType:YLXTransitionAnimationSubTypeBottom animatonTime:0.6 animation:^(UIView *animationingView) {
        [[UIApplication sharedApplication].keyWindow setRootViewController:[[NSClassFromString(@"YZMainViewController") alloc] init]];
    }];

}
+(void) changeLoginControllerToRootViewController{
    
    UIApplication *app = [UIApplication sharedApplication];
    
    
    [app.keyWindow doAnimationWithType:YLXTransitionAnimationTypeMoveIn subType:YLXTransitionAnimationSubTypeLeft animatonTime:0.6 animation:^(UIView *animationingView) {
        
        YZNavigationViewController *controller = [[YZNavigationViewController alloc] initWithRootViewController:[[NSClassFromString(@"YZLoginViewController") alloc] init]];
        app.keyWindow.rootViewController = controller;
        
    }];
}


@end

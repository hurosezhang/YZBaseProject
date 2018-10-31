//
//  AppDelegate+YZRootController.m
//  YZBaseProject
//
//  Created by zhangyongkang on 2018/6/12.
//  Copyright © 2018年 JWHL.com. All rights reserved.
//

#import "AppDelegate+YZRootController.h"
#import "YZMainViewController.h"
#import "YZNavigationViewController.h"
#import "YZLoginViewController.h"
@implementation AppDelegate (YZRootController)

-(void)setUpRootViewController{
    
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    [self.window setBackgroundColor:[UIColor whiteColor]];
    
    
    if (/* DISABLES CODE */ (0)){
        
        UIViewController *controller = [[NSClassFromString(@"YZMainViewController") alloc] init];
        
        self.window.rootViewController = controller;
        
        
    }
    else{
        YZNavigationViewController *controller = [[YZNavigationViewController alloc] initWithRootViewController:[[NSClassFromString(@"YZLoginViewController") alloc] init]];
        self.window.rootViewController = controller;
    }
    
//    self.window.backgroundColor = [UIColor whiteColor];
    
    //    self.window.rootViewController = [[NSClassFromString(@"FPLoginViewController") alloc] init];
    [self.window makeKeyAndVisible];
    
    //高德地图
    
    
    //    if (@available(iOS 11.0, *)) {
    
    [UITableView appearance].estimatedRowHeight = 0;
    [UITableView appearance].estimatedSectionHeaderHeight=0;
    [UITableView appearance].estimatedSectionFooterHeight=0;
    [[UITableView appearance] setTableFooterView:[UIView new]];
    
    //    } else {
    //        // Fallback on earlier versions
    //    }
}
@end

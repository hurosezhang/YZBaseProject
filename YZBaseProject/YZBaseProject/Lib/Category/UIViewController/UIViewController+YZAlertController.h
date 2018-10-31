//
//  UIViewController+YZAlertController.h
//  YZBaseProject
//
//  Created by zhangyongkang on 2018/6/20.
//  Copyright © 2018年 JWHL.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (YZAlertController)


/**
 核心方法
 */
- (void)showAlertControllerWithTitle:(NSString *_Nullable)title message:(NSString *)message preferredStyle:(UIAlertControllerStyle)preferredStyle cancelTitle:(NSString *)canceltitle cancelAction:(void(^)(UIAlertAction *action))cancelaction WithOtherActionTitle:(NSString *)actionTitle Otherhandler:(void (^ __nullable)(UIAlertAction *action))otherhandler;


/**
 提示信息 无title 按钮为好的  
 */
- (void) showAlertWithMessage:(NSString *)message sureAction:(void(^)(UIAlertAction *action))action;

/**
 提示信息 无title 有取消按钮为好的
 */
- (void) showAlertWithMessage:(NSString *)message cancelTitle:(NSString *)canceltitle cancelAction:(void(^)(UIAlertAction *action))cancelaction  otherTitle:(NSString *)title otherAction:(void(^)(UIAlertAction *action))otheraction ;

@end

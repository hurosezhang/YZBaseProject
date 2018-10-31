//
//  UIViewController+YZAlertController.m
//  YZBaseProject
//
//  Created by zhangyongkang on 2018/6/20.
//  Copyright © 2018年 JWHL.com. All rights reserved.
//

#import "UIViewController+YZAlertController.h"

@implementation UIViewController (YZAlertController)

- (void)showAlertControllerWithTitle:(NSString *_Nullable)title message:(NSString *)message preferredStyle:(UIAlertControllerStyle)preferredStyle cancelTitle:(NSString *)canceltitle cancelAction:(void(^)(UIAlertAction *action))cancelaction WithOtherActionTitle:(NSString *)actionTitle Otherhandler:(void (^ __nullable)(UIAlertAction *action))otherhandler;
{
    UIAlertController *alerController = [UIAlertController alertControllerWithTitle:title  message:message preferredStyle:preferredStyle];
    
    
    if (canceltitle) {
        UIAlertAction *actionCacel = [UIAlertAction actionWithTitle:canceltitle style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            
            if (cancelaction) {
                cancelaction(action);
            }
        }];
        
        [alerController addAction:actionCacel];

    }
    
  
    
    UIAlertAction *actionSure = [UIAlertAction actionWithTitle:actionTitle   style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        if (otherhandler) {

            otherhandler(actionSure);
        }
        
    }];
    

    
    [alerController addAction:actionSure];
    
    [self presentViewController:alerController animated:YES completion:nil];

    
    
}
- (void)showAlertWithMessage:(NSString *)message sureAction:(void (^)(UIAlertAction *))sureaction{
    
    
    [self showAlertControllerWithTitle:nil message:message preferredStyle:UIAlertControllerStyleAlert cancelTitle:@"取消" cancelAction:^(UIAlertAction *action) {
        
    } WithOtherActionTitle:@"好的" Otherhandler:^(UIAlertAction *action) {
        
        if ( sureaction) {
            sureaction(action);
        }

    }];
}

- (void) showAlertWithMessage:(NSString *)message cancelTitle:(NSString *)canceltitle cancelAction:(void(^)(UIAlertAction *action))cancelaction  otherTitle:(NSString *)title otherAction:(void(^)(UIAlertAction *action))otheraction
{
    [self showAlertControllerWithTitle:nil message:message preferredStyle:UIAlertControllerStyleAlert cancelTitle:@"取消" cancelAction:^(UIAlertAction *action) {
        
        if (cancelaction) {
            
            cancelaction(action);
        }

    } WithOtherActionTitle:@"好的" Otherhandler:^(UIAlertAction *action) {
        
        if ( otheraction) {
            otheraction(action);
        }
        

    }];

    
}
@end

//
//  MBProgressHUD+JDragon.m
//  JDragonHUD
//
//  Created by JDragon on 2017/1/17.
//  Copyright © 2017年 JDragon. All rights reserved.
//

#import "MBProgressHUD+JDragon.h"

@implementation MBProgressHUD (JDragon)

+ (MBProgressHUD*)createMBProgressHUDviewWithMessage:(NSString*)message isWindiw:(BOOL)isWindow
{
    UIView  *view = isWindow? (UIView*)[UIApplication sharedApplication].delegate.window:[self getCurrentUIVC].view;
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.labelText=message?message:@"加载中.....";
    hud.labelFont=[UIFont systemFontOfSize:15];
    [hud.label setNumberOfLines:0];
    hud.removeFromSuperViewOnHide = YES;
    hud.dimBackground = NO;
    return hud;
}
#pragma mark-------------------- show Tip----------------------------

+ (void)showTipMessageInWindow:(NSString*)message
{
    [self showTipMessage:message isWindow:true timer:1.5];
}
+ (void)showTipMessageInView:(NSString*)message
{
    [self showTipMessage:message isWindow:false timer:1.5];
}
+ (void)showTipMessageInWindow:(NSString*)message timer:(int)aTimer
{
    [self showTipMessage:message isWindow:true timer:aTimer];
}
+ (void)showTipMessageInView:(NSString*)message timer:(int)aTimer
{
    [self showTipMessage:message isWindow:false timer:aTimer];
}
+ (void)showTipMessage:(NSString*)message isWindow:(BOOL)isWindow timer:(int)aTimer
{
    MBProgressHUD *hud = [self createMBProgressHUDviewWithMessage:message isWindiw:isWindow];
    hud.mode = MBProgressHUDModeText;
    [hud hideAnimated:YES afterDelay:aTimer];
}
#pragma mark-------------------- show Activity----------------------------

+ (void)showActivityMessageInWindow:(NSString*)message
{
    [self showActivityMessage:message isWindow:true timer:0];
}
+ (void)showActivityMessageInView:(NSString*)message
{
    [self showActivityMessage:message isWindow:false timer:0];
}
+ (void)showActivityMessageInWindow:(NSString*)message timer:(int)aTimer
{
    [self showActivityMessage:message isWindow:true timer:aTimer];
}
+ (void)showActivityMessageInView:(NSString*)message timer:(int)aTimer
{
    [self showActivityMessage:message isWindow:false timer:aTimer];
}
+ (void)showActivityMessage:(NSString*)message isWindow:(BOOL)isWindow timer:(int)aTimer
{
    MBProgressHUD *hud  =  [self createMBProgressHUDviewWithMessage:message isWindiw:isWindow];
    hud.mode = MBProgressHUDModeIndeterminate;
    if (aTimer>0) {
        [hud hide:YES afterDelay:aTimer];
    }
}
#pragma mark-------------------- show Image----------------------------

+ (void)showSuccessMessage:(NSString *)Message
{
    [self hideHUD];
    NSString *name =@"MBProgressHUD+JDragon.bundle/MBProgressHUD/MBHUD_Success";
    [self showCustomIconInWindow:name message:Message];
}
+ (void)showErrorMessage:(NSString *)Message
{
    [self hideHUD];
    NSString *name =@"MBProgressHUD+JDragon.bundle/MBProgressHUD/MBHUD_Error";
    [self showCustomIconInWindow:name message:Message];
}

+ (void)showErrorMessageLongDelay:(NSString *)Message {
    
    [self hideHUD];
    NSString *name =@"MBProgressHUD+JDragon.bundle/MBProgressHUD/MBHUD_Error";
    [self showCustomIconLongDelayInWindow:name message:Message];
}
+ (void)showInfoMessage:(NSString *)Message
{
    [self hideHUD];
    NSString *name =@"MBProgressHUD+JDragon.bundle/MBProgressHUD/MBHUD_Info";
    [self showCustomIconInWindow:name message:Message];
}
+ (void)showWarnMessage:(NSString *)Message
{
    [self hideHUD];
    NSString *name =@"MBProgressHUD+JDragon.bundle/MBProgressHUD/MBHUD_Warn";
    [self showCustomIconInWindow:name message:Message];
}

+ (void)showCustomIconLongDelayInWindow:(NSString *)iconName message:(NSString *)message
{
    [self hideHUD];
    [self showCustomIcon:iconName message:message isWindow:true affterDelay:2];
    
}
+ (void)showCustomIconInWindow:(NSString *)iconName message:(NSString *)message
{
    [self hideHUD];
    [self showCustomIcon:iconName message:message isWindow:true affterDelay:2];
    
}
+ (void)showCustomIconInView:(NSString *)iconName message:(NSString *)message
{
    [self hideHUD];
    [self showCustomIcon:iconName message:message isWindow:false affterDelay:2];
}
+ (void)showCustomIcon:(NSString *)iconName message:(NSString *)message isWindow:(BOOL)isWindow affterDelay:(NSInteger)delay
{
    [self hideHUD];
    MBProgressHUD *hud  =  [self createMBProgressHUDviewWithMessage:message isWindiw:isWindow];
    hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:iconName]];
    hud.mode = MBProgressHUDModeCustomView;
    [hud hide:YES afterDelay:delay];
    
}
+ (void)hideHUD
{
    UIView  *winView =(UIView*)[UIApplication sharedApplication].delegate.window;
    [self hideAllHUDsForView:winView animated:YES];
    [self hideAllHUDsForView:[self getCurrentUIVC].view animated:YES];
}
//获取当前屏幕显示的viewcontroller
+(UIViewController *)getCurrentWindowVC
{
    UIViewController *result = nil;
    UIWindow * window = [[UIApplication sharedApplication] keyWindow];
    if (window.windowLevel != UIWindowLevelNormal)
    {
        NSArray *windows = [[UIApplication sharedApplication] windows];
        for(UIWindow * tempWindow in windows)
        {
            if (tempWindow.windowLevel == UIWindowLevelNormal)
            {
                window = tempWindow;
                break;
            }
        }
    }
    UIView *frontView = [[window subviews] objectAtIndex:0];
    id nextResponder = [frontView nextResponder];
    if ([nextResponder isKindOfClass:[UIViewController class]])
    {
        result = nextResponder;
    }
    else
    {
        result = window.rootViewController;
    }
    return  result;
}
+(UIViewController *)getCurrentUIVC
{
    UIViewController  *superVC = [[self class]  getCurrentWindowVC ];
    
    if ([superVC isKindOfClass:[UITabBarController class]]) {
        
        UIViewController  *tabSelectVC = ((UITabBarController*)superVC).selectedViewController;
        
        if ([tabSelectVC isKindOfClass:[UINavigationController class]]) {
            
            return ((UINavigationController*)tabSelectVC).viewControllers.lastObject;
        }
        return tabSelectVC;
    }else
    if ([superVC isKindOfClass:[UINavigationController class]]) {
        
        return ((UINavigationController*)superVC).viewControllers.lastObject;  
    }
    return superVC;
}

@end

//
//  UIView+Extension.m
//  YZBaseProject
//
//  Created by zhangyongkang on 2018/6/20.
//  Copyright © 2018年 JWHL.com. All rights reserved.
//

#import "UIView+Extension.h"

@implementation UIView (Extension)
- (BOOL)yz_isShowingOnKeyWindow{
    
    // 主窗口
    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    
    // 以主窗口左上角为坐标原点, 计算self的矩形框
    CGRect newFrame = [keyWindow convertRect:self.frame fromView:self.superview];
    CGRect winBounds = keyWindow.bounds;
    
    // 主窗口的bounds 和 self的矩形框 是否有重叠
    BOOL intersects = CGRectIntersectsRect(newFrame, winBounds);
    
    return !self.isHidden && self.alpha > 0.01 && self.window == keyWindow && intersects;
}

+ (instancetype)yz_viewFromXib{
    
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] lastObject];

}
@end

//
//  UIView+Extension.h
//  YZBaseProject
//
//  Created by zhangyongkang on 2018/6/20.
//  Copyright © 2018年 JWHL.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Extension)

/**
 * 判断一个控件是否真正显示在主窗口
 */
- (BOOL)yz_isShowingOnKeyWindow;

/**
 * xib创建的view
 */
+ (instancetype)yz_viewFromXib;

@end

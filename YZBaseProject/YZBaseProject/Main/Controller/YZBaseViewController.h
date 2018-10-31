//
//  YZBaseViewController.h
//  YZBaseProject
//
//  Created by zhangyongkang on 2018/6/16.
//  Copyright © 2018年 JWHL.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YZBaseViewController : UIViewController

/**
 设置左侧按钮默认的格式
 */
//- (void)setUPLeftButtondefaultType;


/**
 取消左侧的按钮
 */
- (void)setUpLeftButtonNil;

/**
 设置左侧按钮的图片

 @param imageName 图片名
 */
- (void)setUPLeftButtonWithImageName:(NSString *)imageName;

/**
 左侧按钮的点击事件
 */
- (void)leftButtonOnClicked:(UIButton *)leftBtn ;


/**
 设置右侧按钮的图片
 
 @param imageName 图片名
 */
- (void)setUPRightButtonWithImageName:(NSString *)imageName;


/**
 设置右侧按钮的文字
 
 @param title 按钮名
 */
- (void)setUPRightButtonWithtitle:(NSString *)title;

/**
 设置右侧按钮的文字的字体

 @param font <#font description#>
 */
- (void)setUPRightButtonTitleWithFont:(UIFont *)font;

/**
  设置右侧按钮的文字的颜色

 @param color <#color description#>
 */
- (void)setUPRightButtonTitleWithUIColor:(UIColor *)color;



/**
 右侧按钮的点击事件

 @param leftBtn <#leftBtn description#>
 */
- (void)RightButtonOnClicked:(UIButton *)leftBtn;


// *******************设置导航栏******

/**
 显示导航栏背景
 */
- (void) showNavBackground;

/**
 隐藏导航栏背景
 */
- (void) hiddenNavBackground;

- (void) hiddenNavBottomLine;
- (void) showNavBottomLine;



@end

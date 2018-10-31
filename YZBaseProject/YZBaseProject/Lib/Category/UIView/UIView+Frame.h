//
//  UIView+Frame.h
//  MDSnSpeedNews
//
//  Created by Medalands on 16/7/29.
//  Copyright © 2016年 Medalands. All rights reserved.
//

#import <UIKit/UIKit.h>
// 当想要对一个类进行扩充，又不想去改变类的源代码的时候。我们可以采用分类
//分类一般是用来对方法的扩充，
//如果是对属性进行扩充，系统不会生成setter和getter方法的实现
@interface UIView (Frame)

@property (nonatomic , assign) CGFloat x;
@property (nonatomic , assign) CGFloat y;
@property (nonatomic , assign) CGFloat width;
@property (nonatomic , assign) CGFloat height;

@property (nonatomic , assign) CGFloat centerX;
@property (nonatomic , assign) CGFloat centerY;

@property (nonatomic , assign) CGFloat bottom;

@property (nonatomic , assign) CGFloat left;
@property (nonatomic , assign) CGFloat right;

@property (nonatomic , assign) CGSize size;



/**
 添加底部阴影
 */
- (void) addBottomShadow;

/**
YZ添加圆角

 @param radius <#radius description#>
 */
- (void)addCornerRadius:(CGFloat)radius ;


/**
 改变宽度

 @param title <#title description#>
 @param font <#font description#>
 @param space <#space description#>
 */
- (void)changeWidthWithTitle:(NSString *)title font:(CGFloat)font space:(CGFloat)space;

@end

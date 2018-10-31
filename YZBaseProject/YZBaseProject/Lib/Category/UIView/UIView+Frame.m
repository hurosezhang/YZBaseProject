//
//  UIView+Frame.m
//  MDSnSpeedNews
//
//  Created by Medalands on 16/7/29.
//  Copyright © 2016年 Medalands. All rights reserved.
//

#import "UIView+Frame.h"

@implementation UIView (Frame)

// 调用X的setter方法，我们传进来一个值，方法吧这个值赋给控件的frame.origin.x
- (void)setX:(CGFloat)x{
    // self 就等于调用这个方法的view
    CGRect frame = self.frame;
    
    frame.origin.x = x;
    
    self.frame = frame;
}

// 调用x的getter方法，我们把控件的frame.origin.x传出去
- (CGFloat)x{
    
    return self.frame.origin.x;
}

- (void)setY:(CGFloat)y{
    // self 就等于调用这个方法的view
    CGRect frame = self.frame;
    
    frame.origin.y = y;
    
    self.frame = frame;
}

- (CGFloat)y{
    
    return self.frame.origin.y;
}

- (void)setWidth:(CGFloat)width{
    // self 就等于调用这个方法的view
    CGRect frame = self.frame;
    
    frame.size.width = width;
    
    self.frame = frame;
}

- (CGFloat)width{
    
    return self.frame.size.width;
}

- (void)setHeight:(CGFloat)height{
    // self 就等于调用这个方法的view
    CGRect frame = self.frame;
    
    frame.size.height = height;
    
    self.frame = frame;
}

- (CGFloat)height{
    
    return self.frame.size.height;
}

- (void)setCenterX:(CGFloat)centerX{
    
    // self 就等于调用这个方法的view
    CGPoint center = self.center;
    
    center.x = centerX;
    
    self.center = center;
    
}

- (CGFloat)centerX{
    return self.center.x;
}

- (void)setCenterY:(CGFloat)centerY{
    
    // self 就等于调用这个方法的view
    CGPoint center = self.center;
    
    center.y = centerY;
    
    self.center = center;
    
}

- (CGFloat)centerY{
    return self.center.y;
}


- (void)setBottom:(CGFloat)bottom{
    
    CGRect frame = self.frame;
    
    frame.origin.y = bottom - frame.size.height;
    
    self.frame = frame;
    
    
}

- (CGFloat)bottom{
    return CGRectGetMaxY(self.frame);
}

- (void)setLeft:(CGFloat)left{
    [self setX:left];
}

- (CGFloat)left{
    return self.frame.origin.x;
    
}

- (void)setRight:(CGFloat)right{
    CGRect frame = self.frame;
    
    frame.origin.x = right - frame.size.width;
    
    self.frame = frame;

}
- (CGFloat)right{
    return self.frame.origin.x + self.frame.size.width ;
}

- (CGSize)size{
    return self.frame.size;
}

- (void)setSize:(CGSize)size{
    CGRect frame = self.frame;
    
    frame.size = size;
    
    self.frame = frame;
}

- (void)addCornerRadius:(CGFloat)radius
{
    [self.layer setMasksToBounds:YES];
    
    [self.layer setCornerRadius:radius];
    
}

- (void) addBottomShadow{
    UIColor *color = KRGBA(0XB5, 0XAE, 0XAE, 1);
    
    [self.layer setShadowColor:color.CGColor];
    [self.layer setShadowOffset:CGSizeMake(0, 0)];
    [self.layer setShadowOpacity:0.5];
}

- (void)changeWidthWithTitle:(NSString *)title font:(CGFloat)font space:(CGFloat)space{
    
    CGSize titleSize = [title sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:font]}];
    
    self.width = titleSize.width+KGetProportion(10);
}


@end

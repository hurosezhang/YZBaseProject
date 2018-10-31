//
//  UIView+YLXTransitionAnimation.h
//  YLXS
//
//  Created by forping on 2017/6/6.
//  Copyright © 2017年 JWHL.com. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger , YLXTransitionAnimationType) {
    
    YLXTransitionAnimationTypeFade, //交叉淡化过渡
    YLXTransitionAnimationTypeMoveIn, // 新视图移到旧视图上面
    YLXTransitionAnimationTypePush,//新视图把旧视图推出去
    YLXTransitionAnimationTypeReveal,//将旧视图移开,显示下面的新视图
    YLXTransitionAnimationTypePageCurl,//向上翻一页
    YLXTransitionAnimationTypePageUnCurl,//向下翻一页
    YLXTransitionAnimationTypeRippleEffect,//滴水效果
    YLXTransitionAnimationTypeSuckEffect,//收缩效果，如一块布被抽走
    YLXTransitionAnimationTypeCube,//立方体效果
    YLXTransitionAnimationTypeOglFlip,//上下左右翻转效果
    YLXTransitionAnimationTypeRotate,//旋转效果
    YLXTransitionAnimationTypeCameraIrisHollowClose,//相机镜头关上效果(不支持过渡方向)
    YLXTransitionAnimationTypeCameraIrisHollowOpen,//相机镜头打开效果(不支持过渡方向)
};

typedef NS_ENUM(NSInteger , YLXTransitionAnimationSubType) { //动画方向(比如说是从左边进入，还是从右边进入...)
    
    YLXTransitionAnimationSubTypeRight,
    YLXTransitionAnimationSubTypeLeft,
    YLXTransitionAnimationSubTypeTop,
    YLXTransitionAnimationSubTypeBottom
    /*
     当 type 为@"rotate"(旋转)的时候,它也有几个对应的 subtype,分别为:
     90cw 逆时针旋转 90°
     90ccw 顺时针旋转 90°
     180cw 逆时针旋转 180°
     180ccw  顺时针旋转 180°
     */
    
};

@interface UIView (YLXTransitionAnimation)

- (void)doAnimationWithType:(YLXTransitionAnimationType)type subType:(YLXTransitionAnimationSubType)subType animatonTime:(CGFloat)duration animation:(void(^)(UIView *animationingView))animation;

@end

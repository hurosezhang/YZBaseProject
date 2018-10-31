//
//  UIView+YLXTransitionAnimation.m
//  YLXS
//
//  Created by forping on 2017/6/6.
//  Copyright © 2017年 JWHL.com. All rights reserved.
//

#import "UIView+YLXTransitionAnimation.h"

@implementation UIView (YLXTransitionAnimation)

- (void)doAnimationWithType:(YLXTransitionAnimationType)type subType:(YLXTransitionAnimationSubType)subType animatonTime:(CGFloat)duration animation:(void(^)(UIView *animationingView))animation{
    
    NSLog(@"1");
    
    WS(weakSelf);
    
    if (animation) {
        animation(weakSelf);
    }
    
    CATransition *anni = [CATransition animation];
    
    switch (type) {
        case YLXTransitionAnimationTypeFade:
            anni.type = @"fade";
            break;
        case YLXTransitionAnimationTypeMoveIn:
            anni.type = @"moveIn";
            break;
        case YLXTransitionAnimationTypePush:
            anni.type = @"push";
            break;
        case YLXTransitionAnimationTypeReveal:
            anni.type = @"reveal";
            break;
        case YLXTransitionAnimationTypePageCurl:
            anni.type = @"pageCurl";
            break;
        case YLXTransitionAnimationTypePageUnCurl:
            anni.type = @"pageUnCurl";
            break;
        case YLXTransitionAnimationTypeRippleEffect:
            anni.type = @"rippleEffect";
            break;
        case YLXTransitionAnimationTypeSuckEffect:
            anni.type = @"suckEffect";
            break;
        case YLXTransitionAnimationTypeCube:
            anni.type = @"cube";
            break;
        case YLXTransitionAnimationTypeOglFlip:
            anni.type = @"oglFlip";
            break;
        case YLXTransitionAnimationTypeRotate:
            anni.type = @"rotate";
            break;
        case YLXTransitionAnimationTypeCameraIrisHollowClose:
            anni.type = @"cameraIrisHollowClose";
            break;
        case YLXTransitionAnimationTypeCameraIrisHollowOpen:
            anni.type = @"cameraIrisHollowOpen";
            break;
    }
    switch (subType) {
        case YLXTransitionAnimationSubTypeRight:
            anni.subtype = @"fromRight";
            break;

        case YLXTransitionAnimationSubTypeLeft:
            anni.subtype = @"fromLeft";
            break;

        case YLXTransitionAnimationSubTypeTop:
            anni.subtype = @"fromTop";
            break;

        case YLXTransitionAnimationSubTypeBottom:
            anni.subtype = @"fromBottom";
            break;

        default:
            break;
    }
    
    anni.duration = duration;
    
    [self.layer addAnimation:anni forKey:nil];
}

@end

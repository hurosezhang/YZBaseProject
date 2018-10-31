//
//  UIScrollView+Extension.m
//  ios11tableView
//
//  Created by zhangyongkang on 2018/6/25.
//  Copyright © 2018年 JWHL.com. All rights reserved.
//

#import "UIScrollView+Extension.h"

@implementation UIScrollView (Extension)

- (void)contentInsetAdjustmentBehaviorForiOS11inSuperViewController:(UIViewController *)viewController
{
    
    if (@available(iOS 11.0, *)) {
        self.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    } else {
        viewController.automaticallyAdjustsScrollViewInsets = NO;
    }

    
}
@end

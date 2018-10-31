//
//  UITableView+noDateView.m
//  ios11tableView
//
//  Created by zhangyongkang on 2018/6/25.
//  Copyright © 2018年 JWHL.com. All rights reserved.
//

#import "UITableView+noDateView.h"

#import <objc/runtime.h>


@implementation UITableView (noDateView)

- (YZNodataView *)noDataView
{
    
    // objc_getAssociatedObject(self, _cmd)
    YZNodataView *view = objc_getAssociatedObject(self, _cmd);
    
    if (view == nil) {
        view = [[YZNodataView alloc] initWithFrame:self.bounds];
        
        [self setNoDataView:view];
    }
    
    if (view.superview == nil) {
        [self addSubview:view];
    }
    
    return view;
    
}
- (void)setNoDataView:(YZNodataView *)noDataView
{
    
    objc_setAssociatedObject(self, @selector(noDataView), noDataView, OBJC_ASSOCIATION_RETAIN);
}
@end

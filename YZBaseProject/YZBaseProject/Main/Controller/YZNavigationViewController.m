//
//  YZNavigationViewController.m
//  YZBaseProject
//
//  Created by zhangyongkang on 2018/6/12.
//  Copyright © 2018年 JWHL.com. All rights reserved.
//

#import "YZNavigationViewController.h"

@interface YZNavigationViewController ()
<
UIGestureRecognizerDelegate
>

@end

@implementation YZNavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    [self.navigationBar setBarTintColor:[UIColor colorWithHexString:@"#BF232F"]];
    
    self.navigationBar.translucent = NO;
    
    [self.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:[UIFont boldSystemFontOfSize:17.0f]}];
    
    
    // interactive  机交式
    [self.interactivePopGestureRecognizer setDelegate:self];


}
// 决定是否触发手势
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch{
    
    
    NSString *lastControllerClass = NSStringFromClass(self.viewControllers.lastObject.class);
    if ([lastControllerClass isEqualToString:@"SaleManUpResultViewController"]){
        
        return NO;
        
    }
    
    return self.childViewControllers.count > 1;

    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

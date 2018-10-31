//
//  YZMainViewController.m
//  YZBaseProject
//
//  Created by zhangyongkang on 2018/6/12.
//  Copyright © 2018年 JWHL.com. All rights reserved.
//

#import "YZMainViewController.h"
#import "YZNavigationViewController.h"
#import "MainTool.h"
@interface YZMainViewController ()

@end

@implementation YZMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    

    [self setUpChildViewController];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [MainTool changeLoginControllerToRootViewController];
}

- (void) setUpChildViewController{
    
    
    UIViewController *homeViewController = [[UIViewController alloc] init];
    
    homeViewController.view.backgroundColor = KrandomColor;
    YZNavigationViewController *navHomeController = [self setChildViewControllerNavController:homeViewController imaeNamed:@"main_home" selectImageName:@"main_home_selected" title:@"首页"];
    
    UIViewController *shopViewController = [[UIViewController alloc] init];
    
    shopViewController.view.backgroundColor = KrandomColor;

    YZNavigationViewController *navshopController = [self setChildViewControllerNavController:shopViewController imaeNamed:@"main_shop" selectImageName:@"main_shop_selected" title:@"商户"];
    
    
    UIViewController *saleManViewController = [[UIViewController alloc] init];
    saleManViewController.view.backgroundColor = KrandomColor;

    YZNavigationViewController *navsaleManController = [self setChildViewControllerNavController:saleManViewController imaeNamed:@"main_ salesman" selectImageName:@"main_ salesman_selected" title:@"业务员"];
    
    UIViewController *huojiaViewController = [[UIViewController alloc] init];
    YZNavigationViewController *navhuojiaController = [self setChildViewControllerNavController:huojiaViewController imaeNamed:@"main_huojia" selectImageName:@"main_huojia_selected" title:@"货架"];
    
    
    UIViewController *myViewController = [[UIViewController alloc] init];
    myViewController.view.backgroundColor = KrandomColor;

    YZNavigationViewController *navmyController = [self setChildViewControllerNavController:myViewController imaeNamed:@"main_my" selectImageName:@"main_my_selected" title:@"我的"];
    
    
    
    self.viewControllers = @[navHomeController,navshopController, navsaleManController,navmyController];
    
//    if ([FPLoginTool account].kind.integerValue == KSaleManCode) {// 业务员登录
//
//        self.viewControllers = @[navHomeController,navshopController,navhuojiaController,navmyController];
//
//    }
}



#pragma mark - 给视图控制器添加导航栏和图片标题
- (YZNavigationViewController *) setChildViewControllerNavController:(UIViewController *)controller imaeNamed:(NSString *)imageName selectImageName:(NSString *)selectImageName title:(NSString *)title{
    
    YZNavigationViewController *navController = [[YZNavigationViewController alloc] initWithRootViewController:controller];
    
    navController.tabBarItem.image = [[UIImage imageNamed:imageName] imageWithRenderingMode:(UIImageRenderingModeAlwaysOriginal)];
    navController.tabBarItem.selectedImage = [[UIImage imageNamed:selectImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    navController.tabBarItem.title = title;
    [navController.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName: KRGBA(199, 89, 94, 1)} forState:UIControlStateSelected];
    
    return navController;
}
@end

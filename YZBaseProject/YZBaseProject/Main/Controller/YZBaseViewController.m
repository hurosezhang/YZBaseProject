//
//  YZBaseViewController.m
//  YZBaseProject
//
//  Created by zhangyongkang on 2018/6/16.
//  Copyright © 2018年 JWHL.com. All rights reserved.
//

#import "YZBaseViewController.h"

@interface YZBaseViewController ()
//左侧按钮
@property (nonatomic,strong) UIButton *leftButton;
//右侧按钮
@property (nonatomic,strong) UIButton *rightButton;

@property (nonatomic , strong)  UIColor *navBarColor;


@end

#define LeftRect     CGRectMake(0, 0, 44, 44)

#define RightRect    CGRectMake(0, 0, 44, 44)

@implementation YZBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    
    // 默认的按钮
    [self setUpLeftButtondefaultType];
}

- (void)setUpLeftButtonNil
{
    _leftButton = nil;
    
    self.navigationItem.leftBarButtonItem = nil;
}
// 左侧按钮
- (void)setUpLeftButtondefaultType{
   
    [self makeLeftBarButtomItem:nil];

}
- (void)setUPLeftButtonWithImageName:(NSString *)imageName
{
    
    [self makeLeftBarButtomItem:imageName];
}

// 右侧按钮
- (void)setUpRightButtonWithtitle:(NSString *)title
{
    [self makeRightBarButtomItemImageName:nil withTitle:title];
}

- (void)setUpRightButtonWithImageName:(NSString *)imageName
{
    [self makeRightBarButtomItemImageName:imageName withTitle:nil];

}
// 按钮的颜色属性
- (void)setUpRightButtonTitleWithFont:(UIFont *)font
{
    _rightButton.titleLabel.font = [UIFont systemFontOfSize:16];
    
}
- (void)setUpRightButtonTitleWithUIColor:(UIColor *)color;
{
    _rightButton.titleLabel.textColor = color;
    
}
- (void)makeRightBarButtomItemImageName:(NSString *)imageName withTitle:(NSString *)title
{
    
    UIButton *RightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [RightButton setFrame:RightRect];
    _rightButton = RightButton;
    [RightButton addTarget:self action:@selector(RightButtonOnClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    if (imageName == nil) { //无图片
        
    }else{  // 自定义左侧图片
        
        [RightButton setImage:[UIImage imageNamed: imageName] forState:UIControlStateNormal];

    }
    
    if (title == nil) { // 无文字
        
        [RightButton setTitle:title forState:UIControlStateNormal];
        
    }else{
        
        
    }
    

    RightButton.titleLabel.textColor = [UIColor redColor];;
    
    UIBarButtonItem *RightButtomItem = [[UIBarButtonItem alloc] initWithCustomView:RightButton];
    self.navigationItem.leftBarButtonItem = RightButtomItem ;

    
    
}


- (void)makeLeftBarButtomItem:(NSString *)imageName
{
    
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftButton setFrame:LeftRect];
    _leftButton = leftButton;
    [leftButton addTarget:self action:@selector(leftButtonOnClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    NSString *imageStr ;
    if (imageName == nil) { //默认格式
        
        imageStr = @"back_black";
    }else{  // 自定义左侧图片
        
        imageStr = imageName;
        
    }
    

    
    [leftButton setImage:[UIImage imageNamed: imageStr] forState:UIControlStateNormal];
    UIBarButtonItem *leftButtomItem = [[UIBarButtonItem alloc] initWithCustomView:leftButton];
    self.navigationItem.leftBarButtonItem = leftButtomItem ;
    
}




#pragma mark - 按钮的点击事件
- (void)leftButtonOnClicked:(UIButton *)leftBtn
{
    [self.navigationController popViewControllerAnimated:YES];
    
}
- (void)RightButtonOnClicked:(UIButton *)leftBtn

{
    
}


#pragma mark - 导航栏的隐藏和显示

- (void) showNavBackground{
    self.navigationController.navigationBar.barTintColor = self.navBarColor;
    [self showNavBottomLine];
}

- (void)showNavBottomLine{
    [self.navigationController.navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:nil];
}

- (void) hiddenNavBackground{
    self.navBarColor = self.navigationController.navigationBar.barTintColor;
    [self.navigationController.navigationBar setBarTintColor:nil];
    [self hiddenNavBottomLine];
}

- (void)hiddenNavBottomLine{
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
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

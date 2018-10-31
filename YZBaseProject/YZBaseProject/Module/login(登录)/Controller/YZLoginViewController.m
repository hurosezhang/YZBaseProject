//
//  YZLoginViewController.m
//  YZBaseProject
//
//  Created by zhangyongkang on 2018/6/16.
//  Copyright © 2018年 JWHL.com. All rights reserved.
//

#import "YZLoginViewController.h"
#import "YZLoginTextFieldView.h"
#import "YZMainViewController.h"
#import "MainTool.h"

#import "YZSaveReadTool.h"
#import "YZPersonModel.h"
#import "UIViewController+YZAlertController.h"

#import <MBProgressHUD.h>
#import <zhPopupController.h>
#import "UIImageView+WebCache.h"
@interface YZLoginViewController ()

@end

@implementation YZLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setUpLeftButtonNil];
    [self hiddenNavBackground];
    
    
    
    [self setUpViews];
    
}
- (void)setUpViews{
    
    
    
    UIImageView * imageView = [[UIImageView alloc] initWithFrame:CGRectMake(50, 50, 50, 40)];
    NSString * str = @"http://test-pa.oss-cn-hzfinance.aliyuncs.com/Cocreate/index信美%403x.png";
    
//    NSString * str = @"https://sit-public-bucket.oss-cn-hzfinance.aliyuncs.com/CRM_WEB/Project/1508159525992Koala.jpg";
    NSURL *url = [NSURL URLWithString:str];
    
    [str stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];

    [imageView sd_setImageWithURL:url];
    
//    [imageView sd_setImageWithPreviousCachedImageWithURL: url placeholderImage:nil options:SDWebImageRetryFailed progress:^(NSInteger receivedSize, NSInteger expectedSize, NSURL * _Nullable targetURL) {
//
//    } completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
//
//    }];
    
    [self.view addSubview:imageView];
    
//
//    CGFloat spaceX = 30;
//
//    YZLoginTextFieldView *phonetfView = [YZLoginTextFieldView  textFieldView];
//
//    phonetfView.frame = CGRectMake(0, 180, KScreenWidth - 2 * spaceX, 60) ;
//
//
//    phonetfView.centerX = self.view.centerX;
//    [phonetfView setLeftimage:@"login_phone"];
//    phonetfView.backgroundColor = [UIColor blueColor];
//
//    [self.view addSubview:phonetfView];
    
    
//    YZPersonModel * person = [[YZPersonModel alloc] init];
//    
//    person.name = @"jack";
//    person.age = @"18";
//    
//    [YZSaveReadTool saveObject:person toFile:@"person.data"];

    
    
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    UILabel *label = [UILabel new];
    
    label.text = @"你好";
    label.font = [UIFont systemFontOfSize:12];
    label.textColor = [UIColor blueColor];
    
    label.frame = CGRectMake(0, 200, 100, 30);
    
    [self.zh_popupController presentContentView:label duration:0.5 springAnimated:YES inView:nil displayTime:2.0];
    
//    
//    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:[UIApplication sharedApplication].keyWindow.rootViewController.view animated:YES];
//    
//    hud.label.text = @"loading";
//    hud.detailsLabel.text = @"details";
    
    
    
//    [self showAlertWithMessage:@"准备好了就上" cancelTitle:@"没有" cancelAction:^(UIAlertAction *action) {
//
//        NSLog(@"超鬼");
//    } otherTitle:@"好的" otherAction:^(UIAlertAction *action) {
//        NSLog(@"大杀特杀");
//    }];
    
//    [self showAlertWithMessage:@"如果暴力不是为了杀戮" sureAction:^(UIAlertAction *action) {
//
//        NSLog(@"那将毫无意义");
//    }];
//
//    [self showAlertControllerWithTitle:@"lol" message:@"蛮子" preferredStyle:UIAlertControllerStyleAlert cancelTitle:@"取消" cancelAction:^(UIAlertAction *action) {
//
//        NSLog(@"超鬼");
//
//    } WithOtherActionTitle:@"确定" Otherhandler:^(UIAlertAction *action) {
//
//        NSLog(@"大杀特杀");
//
//    }];
    
    
    
//    YZPersonModel *person = [YZSaveReadTool readObjectFromFileName:@"person.data"];
    
//    MJExtensionLog(@"%@",person);
    
//    NSLog(@"%@---%@",person.name,person.age);
    
    
//    [MainTool changeMainControllerToRootViewController];
    

    
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

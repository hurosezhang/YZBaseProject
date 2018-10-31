//
//  YZLoginTextFieldView.h
//  YZBaseProject
//
//  Created by zhangyongkang on 2018/6/16.
//  Copyright © 2018年 JWHL.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YZLoginTextFieldView : UIView

@property (weak, nonatomic) IBOutlet UITextField *textfiled;
+ (instancetype)textFieldView;

- (void)setLeftimage:(NSString *)imageName;
@end

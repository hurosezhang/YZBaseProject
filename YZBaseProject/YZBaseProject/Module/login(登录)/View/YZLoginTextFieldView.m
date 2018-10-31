//
//  YZLoginTextFieldView.m
//  YZBaseProject
//
//  Created by zhangyongkang on 2018/6/16.
//  Copyright © 2018年 JWHL.com. All rights reserved.
//

#import "YZLoginTextFieldView.h"

@interface YZLoginTextFieldView ()<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *imageV;
@property (weak, nonatomic) IBOutlet UIButton *rightBtn;

@end

@implementation YZLoginTextFieldView

- (void)awakeFromNib{
    [super awakeFromNib];
    
    
    NSLog(@"%@",self.textfiled);
    
}
+ (instancetype)textFieldView
{
    
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:self options:nil] lastObject];

    
}

- (void)setLeftimage:(NSString *)imageName
{
    [self.imageV setImage:[UIImage imageNamed:imageName]];
    
}

- (IBAction)eyeBtn:(UIButton *)sender {
    sender.selected = !sender.selected;
    
    if (sender.selected) {
        
        self.textfiled.secureTextEntry = YES;
    }else{
        
        self.textfiled.secureTextEntry = YES;
        

    }
}



@end

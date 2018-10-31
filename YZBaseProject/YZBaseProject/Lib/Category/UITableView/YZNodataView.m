//
//  YZNodataView.m
//  ios11tableView
//
//  Created by zhangyongkang on 2018/6/26.
//  Copyright © 2018年 JWHL.com. All rights reserved.
//

#import "YZNodataView.h"
#define KGetProportion(point) ([[UIScreen mainScreen] bounds].size.width/375.0)*(point)

@implementation YZNodataView
#define KscreenWith [UIScreen mainScreen].bounds.size.width
#define KscreenHeight [UIScreen mainScreen].bounds.size.height
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        
        [self setUpView];
        
        
    }
    return self;
}

- (void)setUpView{
    
    self.imageView = [[UIImageView alloc] init];
    
    [self.imageView setContentMode:UIViewContentModeScaleAspectFit];
    [self.imageView setImage:[UIImage imageNamed:@"main_no_data"]];
    [self addSubview:self.imageView];
    
    self.titleLabel = [[UILabel alloc] init];
    
    self.titleLabel.textColor = [UIColor grayColor];
    [self.titleLabel setFont:[UIFont systemFontOfSize:KGetProportion(14.0f)]];
    [self.titleLabel setTextAlignment:NSTextAlignmentCenter];
    [self.titleLabel setText:@"暂无数据"];
    [self addSubview:_titleLabel];
    
    
}


-(void)layoutSubviews{
    [super layoutSubviews];
    
    
    
    [self.imageView setFrame:CGRectMake((self.frame.size.width - KGetProportion(112)) / 2, (self.frame.size.height - KGetProportion(105)) / 2, KGetProportion(112), KGetProportion(105))];

    
    CGFloat labelH = [self.titleLabel.text sizeWithAttributes:@{NSFontAttributeName:self.titleLabel.font}].height;
    
    [self.titleLabel setFrame:CGRectMake(0, CGRectGetMaxY(self.imageView.frame) + KGetProportion(10), self.frame.size.width, labelH)];
}
@end

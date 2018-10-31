//
//  Confing.h
//  YZBaseProject
//
//  Created by zhangyongkang on 2018/6/12.
//  Copyright © 2018年 JWHL.com. All rights reserved.
//

#ifndef Confing_h
#define Confing_h


#define KScreenHeight [[UIScreen mainScreen] bounds].size.height
#define KScreenWidth [[UIScreen mainScreen] bounds].size.width
#define KeyWindow [[UIApplication sharedApplication] keyWindow]


#define KRGBA(r,g,b,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:a]

#define  KrandomColor  KRGBA(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256), 1)


#define KGetProportion(point) ([[UIScreen mainScreen] bounds].size.width/375.0)*(point)

// 弱引用
#define WS(weakSelf) __weak __typeof(&*self) weakSelf = self

#define KeyWindow [[UIApplication sharedApplication] keyWindow]










#endif /* Confing_h */

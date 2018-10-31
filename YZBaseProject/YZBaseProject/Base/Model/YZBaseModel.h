//
//  YZBaseModel.h
//  YZBaseProject
//
//  Created by zhangyongkang on 2018/6/17.
//  Copyright © 2018年 JWHL.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YZBaseModel : NSObject

//success : Boolean,         //true=请求成功, false=请求失败(服务端有异常)
//code : Integer,         //服务端有异常时的异常代码
//message : String,        //服务端有异常时的异常信息
//data: Object            //服务端接口实际返回的结果
@property (nonatomic , assign)  BOOL success;
@property (nonatomic , assign)  NSInteger code;
@property (nonatomic , copy)  NSString *message;

@end

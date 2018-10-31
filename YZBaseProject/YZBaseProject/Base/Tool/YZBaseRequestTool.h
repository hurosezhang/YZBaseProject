//
//  YZBaseRequestTool.h
//  YZBaseProject
//
//  Created by zhangyongkang on 2018/6/17.
//  Copyright © 2018年 JWHL.com. All rights reserved.
//

#import <Foundation/Foundation.h>
@class YZBaseModel ;
@interface YZBaseRequestTool : NSObject

//域名+固定不变的路径
+ (NSString *) host;


/**
 返回失败和成功的信息,error 是成功之后出来不了的信息 核心方法
 
 */
+ (NSURLSessionDataTask *) postWithUrl:(NSString *)urlStr param:(id)param success:(void(^)(id responseobj, YZBaseModel *baseModel))success error:(void(^)(YZBaseModel *baseModel))error failure:(void(^)(NSError *error))failure;

/**
 post 返回失败和成功的信息,无动画 把error 和 failure 统一展示
 */
+ (NSURLSessionDataTask *) postWithUrl:(NSString *)urlStr param:(id)param success:(void(^)(id responseobj, YZBaseModel *baseModel))success failure:(void(^)(NSError *error))failure;

/**
  post 返回失败和成功的信息,网络动画,返回error信息,展示failure

 */
+ (NSURLSessionDataTask *) postWithUrl:(NSString *)urlStr param:(id)param success:(void(^)(id responseobj, YZBaseModel *baseModel))success error:(void(^)(YZBaseModel *baseModel))error animation:(BOOL)animation toView:(UIView *)view showHUDWhenFailure:(BOOL)show;
/**
 post 返回失败和成功的信息,网络动画,不返回error信息,展示出来
 
 */
+ (NSURLSessionDataTask *) postWithUrl:(NSString *)urlStr param:(id)param success:(void(^)(id responseobj , YZBaseModel *baseModel))success animation:(BOOL)animation toView:(UIView *)view showHUDWhenFailure:(BOOL)show;


+ (NSURLSessionDataTask *) upload:(NSString *)URLString
                       parameters:(id)parameters fileData:(NSData *)data name:(NSString *)name fileName:(NSString *)fileName mimeType:(NSString *)mimeType progress:(void (^)(NSProgress *progress))progressblock
                          success:(void(^)(id responseobj, YZBaseModel *baseModel))success failure:(void(^)(NSError *error))failure;

@end

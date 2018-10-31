//
//  YZhttpRequest.h
//  YZNetWork
//
//  Created by zhangyongkang on 2018/6/17.
//  Copyright © 2018年 JWHL.com. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef NS_ENUM(NSInteger, NetworkStatus) {
    NetworkStatusUnknown          = -1,
    NetworkStatusNotReachable     = 0,
    NetworkStatusReachableViaWWAN = 1,
    NetworkStatusReachableViaWiFi = 2,
};


@interface YZhttpRequest : NSObject

/**
 *  get请求方式
 *
 *  @param URLString  接口地址
 *  @param parameters 接口参数
 *  @param success    请求成功的回调
 *  @param failure    请求失败的回调
 */
+ (NSURLSessionDataTask *) GET:(NSString *)URLString
                    parameters:(id)parameters
                       success:(void (^)(NSURLSessionDataTask * task,id responseObj))success
                       failure:(void (^)(NSURLSessionDataTask * task,NSError * error))failure;

/**
 *  post请求方式
 *
 *  @param URLString  接口地址
 *  @param parameters 接口参数
 *  @param success    请求成功的回调
 *  @param failure    请求失败的回调
 */
+ (NSURLSessionDataTask *) POST:(NSString *)URLString
                     parameters:(id)parameters
                        success:(void (^)(NSURLSessionDataTask * task,id responseObj))success
                        failure:(void (^)(NSURLSessionDataTask * task,NSError * error))failure;

/**
 *  网络状态发生了改变
 *
 *  @param statu 改变后的网络状态
 */
+ (void) netStatusDidChanged:(void(^)(NetworkStatus netStatus))statu;

//114.158177,纬度：22.284681,海拔：0.000000,航向：-1.000000,行走速度：-1.000000
/**
 *  文件的上传
 *
 *  @param URLString      接口地址
 *  @param parameters     接口参数
 *  @param data           文件的数据
 *  @param name           服务器给的字段(和我们没关系)
 *  @param fileName       在服务器上保存的文件名
 *  @param mimeType       文件的类型http://www.iana.org/assignments/media-types/media-types.xhtml
 *  @param progress       上传的进度
 *  @param success        成功
 *  @param failure        失败
 */
+ (NSURLSessionDataTask *) upload:(NSString *)URLString
                       parameters:(id)parameters fileData:(NSData *)data name:(NSString *)name fileName:(NSString *)fileName mimeType:(NSString *)mimeType progress:(void (^)(NSProgress *progress))progress
                          success:(void (^)(NSURLSessionDataTask * task,id responseObj))success
                          failure:(void (^)(NSURLSessionDataTask * task,NSError * error))failure;
/**
 *  下载
 *
 *  @param URLString 下载链接
 *  @param savePath  保存的路径
 *  @param need      是否需要使用建议的文件名
 *  @param progress  进度的回调
 *  @param success   成功的回调
 *  @param failure   失败的回调
 */
+ (NSURLSessionDataTask *) download:(NSString *)URLString savePath:(NSString *)savePath needSuggest:(BOOL)need progress:(void (^)(NSProgress *progress))progress
                            success:(void (^)(NSString *filePath))success
                            failure:(void (^)(NSError * error))failure;


@end

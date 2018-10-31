//
//  YZhttpRequest.m
//  YZNetWork
//
//  Created by zhangyongkang on 2018/6/17.
//  Copyright © 2018年 JWHL.com. All rights reserved.
//

#import "YZhttpRequest.h"
#import <AFNetworking.h>

@implementation YZhttpRequest

AFHTTPSessionManager *manager_ = nil;

+ (AFHTTPSessionManager *)sharedHTTPSession
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        manager_ = [AFHTTPSessionManager manager];
        manager_.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html", nil];
        
        manager_.responseSerializer = [AFHTTPResponseSerializer serializer];
    });
    
    return manager_;
    
}

+ (NSURLSessionDataTask *) GET:(NSString *)URLString
                    parameters:(id)parameters
                       success:(void (^)(NSURLSessionDataTask * task,id responseObj))success
                       failure:(void (^)(NSURLSessionDataTask * task,NSError * error))failure
{
    
    return [[self sharedHTTPSession] GET:URLString parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
        nil;
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        if (success) {
            success(task,responseObject);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        if (failure) {
            failure(task,error);
        }
        
    }];
    
    
}
+ (NSURLSessionDataTask *)POST:(NSString *)URLString parameters:(id)parameters success:(void (^)(NSURLSessionDataTask *, id))success failure:(void (^)(NSURLSessionDataTask *, NSError *))failure
{
    
    // afn里面就帮我们开辟了线程,去执行网络的请求.一旦网络请求成功之后,再把数据反馈给主线程,

    return [[self sharedHTTPSession] POST:URLString parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        nil;
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            success(task,responseObject);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
       
        if (error) {
            failure(task,error);
        }
    }];
    

}

+ (void)netStatusDidChanged:(void (^)(NetworkStatus))statu
{
    
    // 1.开始检测网络状态
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
    
    // 2.设置网络状态改变后的回调方法
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        
        if (status == AFNetworkReachabilityStatusUnknown) {
            
            // 网络状态不知道
            statu(NetworkStatusUnknown);
        }
        else if(status == AFNetworkReachabilityStatusNotReachable){
            // 没有网络
            statu(NetworkStatusNotReachable);
        }
        else if(status == AFNetworkReachabilityStatusReachableViaWWAN){
            // 蜂窝移动
            statu(NetworkStatusReachableViaWWAN);
        }
        else if(status == AFNetworkReachabilityStatusReachableViaWiFi){
            // 无线网络
            statu(NetworkStatusReachableViaWiFi);
        }
    }];

    
}
+ (NSURLSessionDataTask *)upload:(NSString *)URLString parameters:(id)parameters fileData:(NSData *)data name:(NSString *)name fileName:(NSString *)fileName mimeType:(NSString *)mimeType progress:(void (^)(NSProgress *))progress success:(void (^)(NSURLSessionDataTask *, id))success failure:(void (^)(NSURLSessionDataTask *, NSError *))failure
{
    
    return [[self sharedHTTPSession] POST:URLString parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        // 我们需要在这里,进行图片的上传
        
        [formData appendPartWithFileData:data name:name fileName:fileName mimeType:mimeType];

        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        nil;
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        if (success) {
            success(task,responseObject);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        if (failure) {
            failure(task,error);
        }
    }];
    
    
}
+ (NSURLSessionDataTask *)download:(NSString *)URLString savePath:(NSString *)savePath needSuggest:(BOOL)need progress:(void (^)(NSProgress *))progress success:(void (^)(NSString *))success failure:(void (^)(NSError *))failure
{
    
    // 1. 创建管理者对象
    
    // 2. 确定请求的url的地址
    //    NSURL *url = [NSURL URLWithString:URLString];

    NSError *serializationError = nil;
    NSMutableURLRequest *request = [[self sharedHTTPSession].requestSerializer requestWithMethod:@"GET" URLString:[[NSURL URLWithString:URLString relativeToURL:[self sharedHTTPSession].baseURL] absoluteString] parameters:nil error:&serializationError ];
    
    if (serializationError) {
        if (failure) {
            failure(serializationError);
        }else{
            return nil;
        }
    }
    
       // 3. 创建请求
    
     // 4. 下载任务
    
    NSURLSessionDownloadTask * task = [[self sharedHTTPSession] downloadTaskWithRequest:request progress:^(NSProgress * _Nonnull downloadProgress) {
        if (progress) {
            progress(downloadProgress);
        }
    } destination:^NSURL * _Nonnull(NSURL * _Nonnull targetPath, NSURLResponse * _Nonnull response) {
        
        NSString *resutSavePath = nil;
        if (need) {
            if ([savePath hasSuffix:@"/"]) {
                resutSavePath = [savePath stringByAppendingString:response.suggestedFilename];
            }
            else{
                
                resutSavePath = [savePath stringByAppendingPathComponent:response.suggestedFilename];
            }
        }
        else{
            resutSavePath = savePath;
        }
        NSURL *url = [NSURL fileURLWithPath:resutSavePath];
        return url;

        
    } completionHandler:^(NSURLResponse * _Nonnull response, NSURL * _Nullable filePath, NSError * _Nullable error) {
        
//        AILog(@"%@ %@  %@", response, error, filePath);
        
        
        if (error) {
            if (failure) {
                failure(error);
            }
        }
        else{
            if (success) {
                success(filePath.path);
            }
        }

        
    }];
    [task resume];

    return  task;
    
    
}
@end

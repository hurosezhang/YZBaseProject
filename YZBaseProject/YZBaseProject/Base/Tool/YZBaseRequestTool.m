//
//  YZBaseRequestTool.m
//  YZBaseProject
//
//  Created by zhangyongkang on 2018/6/17.
//  Copyright © 2018年 JWHL.com. All rights reserved.
//

#import "YZBaseRequestTool.h"
#import "MBProgressHUD+JDragon.h"
#import "YZBaseModel.h"
#import "YZhttpRequest.h"
@implementation YZBaseRequestTool

+ (NSString *)host{
    
  
#ifdef DEBUG
 
    return @"https://dev";

#else
    return @"https://dis";

#endif
    
}

// 核心方法
+ (NSURLSessionDataTask *) postWithUrl:(NSString *)urlStr param:(id)param success:(void(^)(id responseobj, YZBaseModel *baseModel))success error:(void(^)(YZBaseModel *baseModel))error failure:(void(^)(NSError *error))failure{
    
    return [YZhttpRequest POST:[[self host] stringByAppendingString:urlStr] parameters:param success:^(NSURLSessionDataTask * task,id responseObj) {
        
        AILog(@"成功   %@----%@-----%@",[[self host] stringByAppendingString:urlStr],param,responseObj);
        
        NSHTTPURLResponse * responses = (NSHTTPURLResponse *)task.response;
        
        
        YZBaseModel *model = [YZBaseModel mj_objectWithKeyValues:responseObj];
        
        if (responses.statusCode == 210) {
        
//            [FPLoginTool refreshToken];
            
        }
        else if(responses.statusCode == 401){
        
//            [KeyWindow.rootViewController showAlertToRenewLoginWithStr:model.message];
            
        }
        
        if (model.code == 401) {
//            [KeyWindow.rootViewController showAlertToRenewLoginWithStr:model.message];
            
        }
//        else if (model.success) {
            
            if (success) {
                success(responseObj, model);
            }
//        }
        else{
            if (error) {
                error(model);
            }
        }
    } failure:^(NSURLSessionDataTask * task,NSError *error) {
        AILog(@"失败 %@----%@-----%@",[[self host] stringByAppendingString:urlStr],param,error.description);
        
        NSError *selferror = [NSError errorWithDomain:[self errorStrWithError:error] code:error.code userInfo:error.userInfo];
        
        if (failure) {
            failure(selferror);  //
        }
        
    }];
    
}


+ (NSURLSessionDataTask *)postWithUrl:(NSString *)urlStr param:(id)param success:(void (^)(id, YZBaseModel *))success failure:(void (^)(NSError *))failure
{
    
    return [self postWithUrl:urlStr param:param success:^(id responseobj, YZBaseModel *baseModel) {
        
        if (success) {
            success(responseobj, baseModel);
        }

        
    } error:^(YZBaseModel *baseModel) {
        if (failure) {
            NSError *error = [[NSError alloc] initWithDomain:baseModel.message code:baseModel.code userInfo:nil];
            failure(error);
        }

    } failure:^(NSError *error) {
        
        NSError *selferror = [NSError errorWithDomain:[self errorStrWithError:error] code:error.code userInfo:error.userInfo];
        
        if (failure) {
            failure(selferror);
        }
    }];


}
+ (NSURLSessionDataTask *) postWithUrl:(NSString *)urlStr param:(id)param success:(void(^)(id responseobj , YZBaseModel *baseModel))success animation:(BOOL)animation toView:(UIView *)view showHUDWhenFailure:(BOOL)show
{
    if (animation) {
        [MBProgressHUD showActivityMessageInView:@""];
    }

    return [self postWithUrl:urlStr param:param success:^(id responseobj, YZBaseModel *baseModel) {
        if (animation) {
            [MBProgressHUD hideHUD];
        }
        if (success) {
            success(responseobj, baseModel);
        }

    } error:^(YZBaseModel *baseModel) {
        
        if (animation) {
            [MBProgressHUD hideHUD];
        }
        
        if(show){
            
            [MBProgressHUD showTipMessageInWindow:baseModel.message timer:2];
            
        }

        
    } failure:^(NSError *error) {
        if (animation) {
            [MBProgressHUD hideHUD];
        }
        
        if (show) {
            [MBProgressHUD showTipMessageInWindow:[self errorStrWithError:error] timer:2];
        }

    }];
    
}

+ (NSURLSessionDataTask *) postWithUrl:(NSString *)urlStr param:(id)param success:(void(^)(id responseobj, YZBaseModel *baseModel))success error:(void(^)(YZBaseModel *baseModel))error animation:(BOOL)animation toView:(UIView *)view showHUDWhenFailure:(BOOL)show
{
    if (animation) {
        [MBProgressHUD showActivityMessageInView:@""];
    }

    return [self postWithUrl:urlStr param:param success:^(id responseobj, YZBaseModel *baseModel) {
        
        if (animation) {
            [MBProgressHUD hideHUD];
        }
        
        
        if (success) {
            success(responseobj, baseModel);
        }

    } error:^(YZBaseModel *baseModel) {
        
        if (animation) {
            [MBProgressHUD hideHUD];
        }
        
        if(error){
            
            error(baseModel);
            
        }

        
    } failure:^(NSError *error) {
        
        if (animation) {
            [MBProgressHUD hideHUD];
        }
        
        if (show) {
            [MBProgressHUD showTipMessageInWindow:[self errorStrWithError:error] timer:2];
        }

        
    }];
    
}

+ (NSURLSessionDataTask *)upload:(NSString *)URLString parameters:(id)parameters fileData:(NSData *)data name:(NSString *)name fileName:(NSString *)fileName mimeType:(NSString *)mimeType progress:(void (^)(NSProgress *))progressblock success:(void (^)(id, YZBaseModel *))success failure:(void (^)(NSError *))failure
{
    
    return [YZhttpRequest upload:[[self host] stringByAppendingString:URLString] parameters:parameters fileData:data name:name fileName:fileName mimeType:mimeType progress:^(NSProgress *progress) {
        if (progressblock) {
            progressblock(progress);
        }
    } success:^(NSURLSessionDataTask *task, id responseObj) {
        
        NSHTTPURLResponse * responses = (NSHTTPURLResponse *)task.response;
        //        NSLog(@"%ld",(long)responses.statusCode);
        
        YZBaseModel *model = [YZBaseModel mj_objectWithKeyValues:responseObj];
        
        
        if (responses.statusCode == 210) {
            
//            [FPLoginTool refreshToken];
            
        }
        else if(responses.statusCode == 401){
            
//            [KeyWindow.rootViewController showAlertToRenewLoginWithStr:model.message];
            
        }
        
        
        
        if (model.code == 401) {
//            [KeyWindow.rootViewController showAlertToRenewLoginWithStr:model.message];
            
        }
        else if (model.success) {
            
            if (success) {
                success(responseObj, model);
            }
        }
        else{
            
            if (failure) {
                NSError *error = [[NSError alloc] initWithDomain:model.message code:model.code userInfo:nil];
                failure(error);
            }
        }
        
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
        NSError *selferror = [NSError errorWithDomain:[self errorStrWithError:error] code:error.code userInfo:error.userInfo];
        
        if (failure) {
            failure(selferror);
        }
        
    }];
    

    
    
    
    
}
+(NSString *)errorStrWithError:(NSError *)error{
    
    NSString *str = nil;
    
    if (error == nil) {
        str = @"请求失败,请稍后重试";
        
        return str;
    }
    switch (error.code) {
        case -1009:
            
            str = @"网络断开连接";
            break;
        case -1003:
            
            str = @"服务器异常";
            break;
        case -1004:
            
            str = @"服务器异常";
            break;
            //            case 3848:
            //
            //                str = @"转换JSON格式错误";
            //                break;
            //            case -1016:
            //
            //                str = @"请求的内容格式个解析方法不匹配";
            //                break;
        default:
            str = @"请求失败,请稍后再试";
            break;
    }
    
    return str;
    
}



@end

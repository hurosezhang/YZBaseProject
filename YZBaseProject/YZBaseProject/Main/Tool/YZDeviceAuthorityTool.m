//
//  YZDeviceAuthorityTool.m
//  YZBaseProject
//
//  Created by zhangyongkang on 2018/6/20.
//  Copyright © 2018年 JWHL.com. All rights reserved.
//

#import "YZDeviceAuthorityTool.h"
//#import<AVFoundation/AVCaptureDevice.h>
#import <Photos/PHPhotoLibrary.h>
#import <AVFoundation/AVFoundation.h>
@implementation YZDeviceAuthorityTool

/*
 #ifdef __IPHONE_8_0
 //跳入当前App设置界面,
 [[UIApplication sharedApplication]openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString]];
 #else
 //适配iOS7 ,跳入系统设置界面
 [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"prefs:General&path=Reset"]];
 #endif
*/
+ (BOOL)getAuthorityCamera
{
    
    AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
    if (authStatus ==AVAuthorizationStatusRestricted ||//此应用程序没有被授权访问的照片数据。可能是家长控制权限
        authStatus ==AVAuthorizationStatusDenied)  //用户已经明确否认了这一照片数据的应用程序访问
    {
        
        // 无权限 引导去开启
         NSString *tips = [NSString stringWithFormat:@"请在iPhone的”设置-隐私-相机“选项中，允许%@访问你的手机相机",NSLocalizedString(@"AppName",@"GMChatDemo")];
        
        NSLog(@"%@",tips);

        return NO;
    }
    
    return YES;

}
+ (BOOL)getAuthorityPhotoalbum
{
    
    // ios 8.0 开始使用
    PHAuthorizationStatus status = [PHPhotoLibrary authorizationStatus];
    if (status == PHAuthorizationStatusRestricted || status == PHAuthorizationStatusDenied)
    {
        // 无权限
        // do something...
        
        // 无权限 引导去开启
        NSString *tips = [NSString stringWithFormat:@"请在iPhone的”设置-隐私-相机“选项中，允许%@访问你的手机相册",NSLocalizedString(@"AppName",@"GMChatDemo")];
        
        NSLog(@"%@",tips);

        return NO;
    }
    
    return YES;
}

+ (BOOL)getAuthorityLocation
{
    CLAuthorizationStatus status = [CLLocationManager authorizationStatus];
    
    if (kCLAuthorizationStatusDenied == status || kCLAuthorizationStatusRestricted == status) {
        
        // 无权限 引导去开启
        NSString *tips = [NSString stringWithFormat:@"请在iPhone的”设置-隐私-相机“选项中，允许%@访问你的手机定位权限",NSLocalizedString(@"AppName",@"GMChatDemo")];
        
        NSLog(@"%@",tips);

        
        return NO;
    }
    
    return YES;
}
+ (BOOL)getAuthorityRecord
{
    __block BOOL bCanRecord = YES;
    if ([[[UIDevice currentDevice] systemVersion] compare:@"7.0"] != NSOrderedAscending)
    {
        AVAudioSession *audioSession = [AVAudioSession sharedInstance];
        if ([audioSession respondsToSelector:@selector(requestRecordPermission:)]) {
            [audioSession performSelector:@selector(requestRecordPermission:) withObject:^(BOOL granted) {
                bCanRecord = granted;
            }];
        }
    }
    return bCanRecord;
    
    
}
@end

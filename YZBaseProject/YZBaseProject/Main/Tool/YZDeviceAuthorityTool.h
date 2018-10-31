//
//  YZDeviceAuthorityTool.h
//  YZBaseProject
//
//  Created by zhangyongkang on 2018/6/20.
//  Copyright © 2018年 JWHL.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YZDeviceAuthorityTool : NSObject



/**
 询问相机权限

 @return <#return value description#>
 */
+ (BOOL)getAuthorityCamera;

/**
 询问相册权限

 @return <#return value description#>
 */
+ (BOOL)getAuthorityPhotoalbum;

/**
 询问定位权限

 @return <#return value description#>
 */
+ (BOOL)getAuthorityLocation;

/**
 麦克风权限（录音等）

 @return <#return value description#>
 */
+ (BOOL)getAuthorityRecord;

@end

//
//  YZSaveReadTool.h
//  YZBaseProject
//
//  Created by zhangyongkang on 2018/6/18.
//  Copyright © 2018年 JWHL.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YZSaveReadTool : NSObject


/**
 保存对象的方法,对象需要归档

 @param object <#object description#>
 @param fileName <#fileName description#>
 */
+ (void)saveObject:(id)object toFile:(NSString *)fileName;

/**
 从文件夹获得对象的方法

 @param fileName <#fileName description#>
 @return <#return value description#>
 */
+ (id)readObjectFromFileName:(NSString *)fileName;

/**
 删除文件夹内的对象

 @param fileName <#fileName description#>
 @return <#return value description#>
 */
+ (void)deleteObjectFromFileName:(NSString *)fileName;


@end

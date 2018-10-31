//
//  YZSaveReadTool.m
//  YZBaseProject
//
//  Created by zhangyongkang on 2018/6/18.
//  Copyright © 2018年 JWHL.com. All rights reserved.
//

#import "YZSaveReadTool.h"

@implementation YZSaveReadTool

+ (NSString *)getfielPathWithFileName:(NSString *)fileName
{
    // 获取沙盒Document路径
    NSString *    filePath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    
    //获取沙盒temp路径
    filePath = NSTemporaryDirectory();
    
    //获取沙盒Cache路径
    filePath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject];
    
    //文件路径

    
    NSString *uniquePath=[filePath stringByAppendingPathComponent:fileName];
    
    return uniquePath;

    
}

+ (void)saveObject:(id)object toFile:(NSString *)fileName
{
    
    // 需要判读 文件夹的名字是否有重名的
    
    [NSKeyedArchiver archiveRootObject:object  toFile:[self getfielPathWithFileName:fileName]];
    
    
}

+ (id)readObjectFromFileName:(NSString *)fileName
{
    
    
return [NSKeyedUnarchiver unarchiveObjectWithFile:[self getfielPathWithFileName:fileName]];
    
    
}

+ (void)deleteObjectFromFileName:(NSString *)fileName{
    
    
    NSString * filePath = [self getfielPathWithFileName:fileName];
    //创建文件管理对象
    NSFileManager* fileManager=[NSFileManager defaultManager];
    
    //文件是否存在
    BOOL blHave=[[NSFileManager defaultManager] fileExistsAtPath:filePath];
    //进行逻辑判断
    if (!blHave) {
        NSLog(@"文件不存在");
        return ;
    }else {
        //文件是否被删除
        BOOL blDele= [fileManager removeItemAtPath:filePath error:nil];
        //进行逻辑判断
        if (blDele) {
            NSLog(@"删除成功");
        }else {
            
            NSLog(@"删除失败");
        }
    }
    

}

@end

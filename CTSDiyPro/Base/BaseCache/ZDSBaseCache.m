//
//  ZDSBaseCache.m
//  CacheImagesDemo
//
//  Created by 周大生 on 2018/6/22.
//  Copyright © 2018年 周大生. All rights reserved.
//

#import "ZDSBaseCache.h"

@implementation ZDSBaseCache
+(void)setObjectOfDic:(NSData *)data key:(NSString *)key
{
    // 缓存的 文件夹路径
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject];
    
    NSString *filePath = [path stringByAppendingPathComponent:@"com.zhoudasheng.listDataCache"];
    
    NSFileManager *fileManager = [[NSFileManager alloc] init];
    // 判断 文件夹 是否 存在，不存在则 创建
    if ([fileManager fileExistsAtPath:filePath] == NO)
    {
        [fileManager createDirectoryAtPath:filePath withIntermediateDirectories:YES attributes:nil error:nil];
    }
    //缓存文件的路径
    NSString *cacheFilePath = [filePath stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.plist",key]];
    // 直接写入文件
    BOOL isSuccess =    [data writeToFile:cacheFilePath atomically:NO];
    if (isSuccess == YES)
    {
        NSLog(@"缓存数据成功 path--:%@",cacheFilePath);
    }else{
        NSLog(@"缓存数据失败");
    }
}

+(NSData *)cacheDicForKey:(NSString *)key
{
    // 缓存的 文件夹路径
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject];
    
    NSString *filePath = [path stringByAppendingPathComponent:@"com.zhoudasheng.listDataCache"];
    
    //缓存文件的路径
    NSString *cacheFilePath = [filePath stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.plist",key]];
    
    //  取得 缓存数据
    NSData *cacheData = [NSData dataWithContentsOfFile:cacheFilePath];
    //NSDictionary *cacheDic = [NSDictionary dictionaryWithContentsOfFile:cacheFilePath];
    
    return cacheData;
}

+(void)clearCacheListData:(void (^)())completion
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        // 清除缓存
        //  移除 缓存数据的 文件夹，创建 一个 新的空得文件夹
        NSFileManager *manager = [NSFileManager defaultManager];
        // 缓存的 文件夹路径
        NSString *path = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject];
        
        NSString *filePath = [path stringByAppendingPathComponent:@"com.zhoudasheng.listDataCache"];
        // 移除 文件夹
        [manager removeItemAtPath:filePath error:nil];
        //  创建 一个新的 文件夹
        [manager createDirectoryAtPath:filePath withIntermediateDirectories:YES attributes:nil error:nil];
        if (completion)
        {
            //回调 主线程
            dispatch_async(dispatch_get_main_queue(), ^{
                //调用Block
                completion();
            });
        }
    });
    
    
}
@end

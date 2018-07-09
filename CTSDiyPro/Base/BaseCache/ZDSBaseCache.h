//
//  ZDSBaseCache.h
//  CacheImagesDemo
//
//  Created by 周大生 on 2018/6/22.
//  Copyright © 2018年 周大生. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZDSBaseCache : NSObject
+(void)setObjectOfDic:(NSData *)data key:(NSString *)key;
+(NSData *)cacheDicForKey:(NSString *)key;
+(void)clearCacheListData:(void (^)())completion;
@end

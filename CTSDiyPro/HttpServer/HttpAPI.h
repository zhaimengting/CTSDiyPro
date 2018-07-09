//
//  HttpAPI.h
//  CacheImagesDemo
//
//  Created by 周大生 on 2018/6/20.
//  Copyright © 2018年 周大生. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

@interface HttpAPI : NSObject
typedef NS_ENUM(NSInteger, NetworkReachabilityStatus) {    NetworkReachabilityStatusUnknown          = -1,    NetworkReachabilityStatusNotReachable     = 0,    NetworkReachabilityStatusReachableViaWWAN = 1,    NetworkReachabilityStatusReachableViaWiFi = 2,
};
// GET请求
+ (void)getWithURLString:(NSString *)URLString
              parameters:(id)parameters
                 success:(void (^)(id))success
                 failure:(void (^)(NSError * error))failure;


// POST请求
+ (void)postWithURLString:(NSString *)URLString
               parameters:(id)parameters
                  success:(void (^)(id))success
                  failure:(void (^)(NSError *))failure;
//PUT请求
+ (void)putWithURLString:(NSString *)URLString
               parameters:(id)parameters
                  success:(void (^)(id))success
                  failure:(void (^)(NSError *))failure;
//delete请求
+ (void)deleteWithURLString:(NSString *)URLString
                 parameters:(id)parameters
                    success:(void (^)(id))success
                    failure:(void (^)(NSError *))failure;
/**
 *检测网络状态
 */
+(void)setReachabilityStatusChangeBlock:(void(^)(NetworkReachabilityStatus status))block;

@end

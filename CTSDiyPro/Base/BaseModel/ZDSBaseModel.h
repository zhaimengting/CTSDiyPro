//
//  ZDSBaseModel.h
//  CacheImagesDemo
//
//  Created by 周大生 on 2018/6/21.
//  Copyright © 2018年 周大生. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZDSBaseModel : NSObject<NSCoding>
-(instancetype)initWithDictionary:(NSDictionary *)dic;
@end

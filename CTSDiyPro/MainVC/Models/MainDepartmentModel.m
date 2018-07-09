//
//  MainDepartmentModel.m
//  CacheImagesDemo
//
//  Created by 周大生 on 2018/6/25.
//  Copyright © 2018年 周大生. All rights reserved.
//

#import "MainDepartmentModel.h"

@implementation MainDepartmentModel
-(void)setValue:(id)value forKey:(NSString *)key{
    if ([key isEqualToString:@"id"]) {
        //self.departmentID = value;
    }else{
        [super setValue:value forKey:key];
    }
}
-(instancetype)initWithDictionary:(NSDictionary *)dic{
    self = [super initWithDictionary:dic];
    if (self) {
        self.dict = dic;
    }
    return self;
}
//-(instancetype)initWithCoder:(NSCoder *)aDecoder{
//    if (self = [super init]) {
//        self.department_name = [aDecoder decodeObjectForKey:@"department_name"];
//    }
//    return self;
//}
//-(void)encodeWithCoder:(NSCoder *)aCoder{
//    [aCoder encodeObject:self.department_name forKey:@"department_name"];
//}
@end

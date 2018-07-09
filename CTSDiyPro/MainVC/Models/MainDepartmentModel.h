//
//  MainDepartmentModel.h
//  CacheImagesDemo
//
//  Created by 周大生 on 2018/6/25.
//  Copyright © 2018年 周大生. All rights reserved.
//

#import "ZDSBaseModel.h"

@interface MainDepartmentModel : ZDSBaseModel
/**
 *id
 */
@property(nonatomic,copy)NSString *departmentID;
/**
 *是否被删除
 */
@property(nonatomic,assign)BOOL is_delete;
/**
 *create_userid
 */
@property(nonatomic,copy)NSString *create_userid;
/**
 *create_date
 */
@property(nonatomic,copy)NSNumber *create_date;
/**
 *update_userid
 */
@property(nonatomic,copy)NSString *update_userid;
/**
 *update_date
 */
@property(nonatomic,copy)NSNumber *update_date;
/**
 *parent_id
 */
@property(nonatomic,copy)NSString *parent_id;
/**
 *company_id
 */
@property(nonatomic,copy)NSString *company_id;
/**
 *department_name
 */
@property(nonatomic,copy)NSString *department_name;
/**
 *short_name
 */
@property(nonatomic,copy)NSString *short_name;
/**
 *tele_phone
 */
@property(nonatomic,copy)NSString *tele_phone;
/**
 *create_userid
 */
@property(nonatomic,copy)NSString *fax_number;
/**
 *remark
 */
@property(nonatomic,copy)NSString *remark;
/**
 *parent_id
 */
@property(nonatomic,strong)NSNumber *sort_code;

@property(nonatomic,strong)NSDictionary *dict;
@end

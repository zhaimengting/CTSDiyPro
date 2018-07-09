//
//  BaseViewController.h
//  CacheImagesDemo
//
//  Created by 周大生 on 2018/7/5.
//  Copyright © 2018年 周大生. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController
/**
 *返回按钮
 */
@property(nonatomic,strong)UIButton *backBtn;
/**
 *返回事件
 */
-(void)backOnclick:(UIButton *)sender;
@end

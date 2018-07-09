//
//  MainShowTableViewCell.h
//  CacheImagesDemo
//
//  Created by 周大生 on 2018/6/19.
//  Copyright © 2018年 周大生. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainShowTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (weak, nonatomic) IBOutlet UILabel *numLabel;
@property (weak, nonatomic) IBOutlet UILabel *telphoneLabel;

@end

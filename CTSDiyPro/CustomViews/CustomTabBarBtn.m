//
//  CustomTabBarBtn.m
//  CacheImagesDemo
//
//  Created by 周大生 on 2018/6/15.
//  Copyright © 2018年 周大生. All rights reserved.
//

#import "CustomTabBarBtn.h"

@implementation CustomTabBarBtn

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        //布局
        self.backgroundColor = [UIColor grayColor];
        
        [self initViews];
    }
    return self;
}
-(void)initViews{
    //添加图片
    self.imgView = [[UIImageView alloc]initWithFrame:CGRectMake(MainW/3-49/2, 0, 49, 49)];
    //self.imgView.image = [UIImage imageNamed:@"jt_hl"];
    [self addSubview:self.imgView];
    //添加文字
    self.mainLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 49, MainW/3, 15)];
    //self.mainLabel.text = @"首页";
    self.mainLabel.textColor = [UIColor blackColor];
    self.mainLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:self.mainLabel];
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

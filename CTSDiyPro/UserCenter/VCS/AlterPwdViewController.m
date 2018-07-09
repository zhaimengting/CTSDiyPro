//
//  AlterPwdViewController.m
//  CacheImagesDemo
//
//  Created by 周大生 on 2018/7/6.
//  Copyright © 2018年 周大生. All rights reserved.
//

#import "AlterPwdViewController.h"

@interface AlterPwdViewController ()

@end

@implementation AlterPwdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.backBtn.tag = 2;
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

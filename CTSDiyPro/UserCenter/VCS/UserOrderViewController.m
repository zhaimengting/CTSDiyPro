//
//  UserOrderViewController.m
//  CacheImagesDemo
//
//  Created by 周大生 on 2018/6/19.
//  Copyright © 2018年 周大生. All rights reserved.
//

#import "UserOrderViewController.h"

@interface UserOrderViewController ()

@end

@implementation UserOrderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self addBackBtn];
}
#pragma mark - 返回按钮
-(void)addBackBtn{
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    backBtn.frame = CGRectMake(20, 20, 44, 44);
    backBtn.backgroundColor = [UIColor yellowColor];
    [backBtn setTitle:@"返回" forState:UIControlStateNormal];
    [backBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(backVC) forControlEvents:UIControlEventTouchDown];
    [self.navigationController.view addSubview:backBtn];
}

-(void)backVC{
    [self dismissViewControllerAnimated:YES completion:nil];
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

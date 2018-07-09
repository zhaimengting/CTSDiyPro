//
//  BaseViewController.m
//  CacheImagesDemo
//
//  Created by 周大生 on 2018/7/5.
//  Copyright © 2018年 周大生. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //self.navigationController.hidesBarsOnTap= YES;
    [self addBackBtn];
}
-(void)addBackBtn{
    
    self.backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.backBtn.frame = CGRectMake(20, 20, 44, 44);
    self.backBtn.backgroundColor = [UIColor yellowColor];
    [self.backBtn setTitle:@"返回" forState:UIControlStateNormal];
    [self.backBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.backBtn addTarget:self action:@selector(backOnclick:) forControlEvents:UIControlEventTouchDown];
    [self.navigationController.view addSubview:self.backBtn];
//    UIBarButtonItem *barBtnItem = [[UIBarButtonItem alloc]initWithTitle:@"" style:UIBarButtonItemStylePlain target:self action:@selector(backOnclick:)];
//    self.navigationItem.backBarButtonItem = barBtnItem;
}
-(void)backOnclick:(UIButton *)sender{
    //if (sender.tag == 1) {
        [self dismissViewControllerAnimated:YES completion:nil];
    //}else{
     //   [self.navigationController popViewControllerAnimated:YES];
   // }
    
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

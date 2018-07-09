//
//  OrderViewController.m
//  CacheImagesDemo
//
//  Created by 周大生 on 2018/7/5.
//  Copyright © 2018年 周大生. All rights reserved.
//

#import "OrderViewController.h"
#import "AlterPwdViewController.h"

@interface OrderViewController ()

@end

@implementation OrderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.backBtn.tag = 2;
    [self addButton];
    
}
-(void)addBackBtn{
        UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
        backButton.frame = CGRectMake(20, 20, 44, 44);
        backButton.backgroundColor = [UIColor yellowColor];
        [backButton setTitle:@"返回" forState:UIControlStateNormal];
        [backButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(back:) forControlEvents:UIControlEventTouchDown];
        [self.navigationController.view addSubview:backButton];
}
#pragma mark - 添加button
-(void)addButton{
    UIButton *loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [loginBtn setFrame:CGRectMake(100, 100+20, 100, 100)];
    loginBtn.layer.cornerRadius = 8.0f;
    loginBtn.clipsToBounds = YES;
    loginBtn.backgroundColor = [UIColor grayColor];
    [loginBtn setTitle:@"登陆" forState:UIControlStateNormal];
    [loginBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [loginBtn addTarget:self action:@selector(onclickMainVC:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:loginBtn];
}
-(void)onclickMainVC:(UIButton *)button{
    AlterPwdViewController *vc = [[AlterPwdViewController alloc
                                   ]init];
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:vc];
    vc.title = @"修改密码";
    [self presentViewController:nav animated:YES completion:nil];
}
-(void)back:(UIButton *)btn{
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

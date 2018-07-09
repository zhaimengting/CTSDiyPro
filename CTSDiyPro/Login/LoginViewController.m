//
//  LoginViewController.m
//  CacheImagesDemo
//
//  Created by 周大生 on 2018/6/13.
//  Copyright © 2018年 周大生. All rights reserved.
//

#import "LoginViewController.h"
#import "CustomTabBarC.h"
#import "AppDelegate.h"
#import "AFNetworking.h"
#import "HttpAPI.h"


@interface LoginViewController ()
@property(nonatomic,strong)AFHTTPSessionManager *sessionManager;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self initViews];
//    [self getAPI];
    //[self postAPI];
//    [self putAPI];
   // [self deleteAPI];
}
-(void)initViews{
    //用户名
    CGFloat leftSpace = 100;
    CGFloat topSpace = 100;
    CGFloat userTFHeight = 50;
    UITextField *userNameTF = [[UITextField alloc]initWithFrame:CGRectMake(leftSpace, topSpace, self.view.frame.size.width - leftSpace*2, userTFHeight)];
    userNameTF.borderStyle = UITextBorderStyleRoundedRect;
    userNameTF.placeholder = @"用户名";
    [self.view addSubview:userNameTF];
    //密码
    UITextField *passwordTF = [[UITextField alloc]initWithFrame:CGRectMake(userNameTF.frame.origin.y, userNameTF.frame.origin.y +100 +20, userNameTF.frame.size.width, userNameTF.frame.size.height)];
    passwordTF.borderStyle = UITextBorderStyleRoundedRect;
    passwordTF.placeholder = @"密码";
    [self.view addSubview:passwordTF];
    
    //登陆
    UIButton *loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [loginBtn setFrame:CGRectMake(100, passwordTF.frame.origin.y+100+20, userNameTF.frame.size.width, userNameTF.frame.size.height)];
    loginBtn.layer.cornerRadius = 8.0f;
    loginBtn.clipsToBounds = YES;
    loginBtn.backgroundColor = [UIColor grayColor];
    [loginBtn setTitle:@"登陆" forState:UIControlStateNormal];
    [loginBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [loginBtn addTarget:self action:@selector(onclickMainVC:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:loginBtn];
}
#pragma arguments 按钮点击事件
//登录事件
-(void)onclickMainVC:(UIButton *)button{
    CustomTabBarC *tabbar = [[CustomTabBarC alloc]init];
    AppDelegate *appDele = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    appDele.window.rootViewController = tabbar;
    
}
-(AFHTTPSessionManager *)sessionManager{
    if (!_sessionManager) {
        _sessionManager = [[AFHTTPSessionManager alloc]init];
        _sessionManager.responseSerializer.acceptableContentTypes = [_sessionManager.responseSerializer.acceptableContentTypes setByAddingObject:@"text/html"];
         //_sessionManager.requestSerializer.timeoutInterval = 10.0f;
    }
    return _sessionManager;
}
#pragma mark - get请求
-(void)getAPI{
    NSString *requestURL = [[NSString alloc]initWithFormat:@"%@%@%@",BaseAPI,APIVersion,@"Department/5b285d249963ee61f9f62358"];
    //NSString *temUrl = @"http://10.0.88.70:8080/api/v1/Department/"
        NSLog(@"BasicURL:%@",requestURL);
    NSMutableDictionary *paraDict = [[NSMutableDictionary alloc]init];
    [paraDict setValue:@"IT部" forKey:@"department_name"];
        [HttpAPI getWithURLString:requestURL parameters:paraDict success:^(id responseObject) {
            if (!responseObject) {
                return ;
            }
            
            //NSLog(@"成功%@",responseObject);
            if (responseObject != nil ){
                NSLog(@"Successfully deserialized...");
                //如果jsonObject是字典类
                if ([responseObject isKindOfClass:[NSDictionary class]]){
    
                    NSDictionary *weatherDic = (NSDictionary *)responseObject;
                    NSLog(@"Dersialized JSON Dictionary = %@", weatherDic);
                }
            }
        } failure:^(NSError *error) {
    
        }];
}
#pragma mark - Post请求
-(void)postAPI{
    NSString *postUrl  = [[NSString alloc]initWithFormat:@"%@%@%@",BaseAPI,APIVersion,@"/base/Department/"];
    NSDictionary *paraDict = @{@"department_name":@"信华南办",@"company_id":@"5b285bad99634e66d309ca29"};
    NSLog(@"paraDict%@",paraDict);
    [HttpAPI postWithURLString:postUrl parameters:paraDict success:^(id responseObject) {
        if (responseObject != nil ){
            NSLog(@"Successfully deserialized...");
            NSLog(@"%@",responseObject);
            NSString *json =    [[NSString alloc]initWithData:responseObject encoding:NSUTF8StringEncoding];
            NSLog(@"字符串%@",json);
            //如果jsonObject是字典类
            if ([responseObject isKindOfClass:[NSDictionary class]]){
                NSDictionary *weatherDic = (NSDictionary *)responseObject;
                NSLog(@"Dersialized JSON Dictionary = %@", weatherDic);
            }
        }
    } failure:^(NSError *error) {
        NSLog(@"error---%@",error);
    }];
}
#pragma mark - 修改信息
-(void)putAPI{
    NSString *alterID = @"5b285d249963ee61f9f62358";
    NSString *postUrl  = [[NSString alloc]initWithFormat:@"%@%@%@%@",BaseAPI,APIVersion,@"Department/",alterID];
    NSMutableDictionary *paraDict = [[NSMutableDictionary alloc]init];
    [paraDict setValue:@"5b285d249963ee61f9f62358" forKey:@"id"];
    [paraDict setValue:@"13065469877" forKey:@"tele_phone"];
    [HttpAPI putWithURLString:postUrl parameters:paraDict success:^(id responseObject) {
        if (responseObject != nil ){
            NSLog(@"responseObject%@",responseObject);
            NSString *json =    [[NSString alloc]initWithData:responseObject encoding:NSUTF8StringEncoding];
            NSLog(@"字符串%@",json);
            //如果jsonObject是字典类
            if ([responseObject isKindOfClass:[NSDictionary class]]){
                NSDictionary *weatherDic = (NSDictionary *)responseObject;
                NSLog(@"Dersialized JSON Dictionary = %@", weatherDic);
            }
        }
    } failure:^(NSError *error) {
        NSLog(@"error---%@",error);
    }];
}
#pragma mark - 删除信息
-(void)deleteAPI{
    //删除部门的ID
    NSString *deleteITDepID = @"5b285d729963ee61f9f62360";
    NSString *url  = [[NSString alloc]initWithFormat:@"%@%@%@%@",BaseAPI,APIVersion,@"/base/Department/",deleteITDepID];
    NSMutableDictionary *paraDict = [[NSMutableDictionary alloc]init];
    [paraDict setValue:@"5b285d729963ee61f9f62360" forKey:@"id"];
    [HttpAPI deleteWithURLString:url parameters:paraDict success:^(id responseObject) {
        //NSLog(@"Successfully deserialized...");
        //NSLog(@"%@",responseObject);
        NSString *json =    [[NSString alloc]initWithData:responseObject encoding:NSUTF8StringEncoding];
        NSLog(@"字符串%@",json);
    } failure:^(NSError *error) {
        NSLog(@"delete error - %@",error);
    }];
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

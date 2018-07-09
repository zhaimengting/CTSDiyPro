//
//  CustomTabBarC.m
//  CacheImagesDemo
//
//  Created by 周大生 on 2018/6/12.
//  Copyright © 2018年 周大生. All rights reserved.
//

#import "CustomTabBarC.h"
#import "UserCenterViewController.h"
#import "MainViewController.h"
#import "CustomTabBarBtn.h"
#import "MadeViewController.h"
#import "CustomNavViewController.h"

@interface CustomTabBarC ()
//记录当前被点击的button
@property(nonatomic,strong)CustomTabBarBtn *flagBtn;
@end

@implementation CustomTabBarC
- (void)viewWillAppear:(BOOL)animated

{
    
    [super viewWillAppear:animated];
    
    // 删除系统自带的tabBarButton
    
    for (UIView *tabBarButton in self.tabBar.subviews) {
        
        if ([tabBarButton isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            
            [tabBarButton removeFromSuperview];
            
        }
        
    }
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //self.tabBar.hidden = YES;
    MainViewController *mainVC = [[MainViewController alloc]init];
    UINavigationController *mainNav = [[UINavigationController alloc]initWithRootViewController:mainVC];
    //图片能够显示
    //mainNav.tabBarItem.image = [[UIImage imageNamed:@"jt_hl"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];

    MadeViewController *madeVC = [[MadeViewController alloc]init];
    UINavigationController *madNav = [[UINavigationController alloc]initWithRootViewController:madeVC];
    //madNav.tabBarItem.image = [[UIImage imageNamed:@"jt_hl"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    UserCenterViewController *userCenter = [[UserCenterViewController alloc]init];
    UINavigationController *userCenterNav = [[UINavigationController alloc]initWithRootViewController:userCenter];
    //图片
   // userCenterNav.tabBarItem.image = [[UIImage imageNamed:@"zs_hl"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
   // userCenterNav.tabBarItem.title = @"个人中心";
    //控制器数组
    NSArray *vcArry = [NSArray arrayWithObjects:mainNav,madNav,userCenterNav,nil];
    //标题数组
    NSArray *titleArry = [NSArray arrayWithObjects:@"首页",@"定制中心",@"个人中心", nil];
    //图片数组
    NSArray *imgArry = [NSArray arrayWithObjects:@"1",@"2",@"2",nil];
    self.viewControllers = vcArry;
    for (int i = 0; i <3; i++) {
        CustomTabBarBtn *btn = [CustomTabBarBtn buttonWithType:UIButtonTypeCustom];
        //btn.backgroundColor = [UIColor yellowColor];
        [btn setFrame:CGRectMake(MainW/3*i,MainH - 64, MainW/3, 64)];
        [btn setTag:i];
        //添加事件
        [btn addTarget:self action:@selector(changeVC:) forControlEvents:UIControlEventTouchDown];
        btn.imgView.image = [UIImage imageNamed:imgArry[i]];
        btn.mainLabel.text = titleArry[i];
        //默认点击第一个
        if (i == 0) {
            btn.imgView.image = [UIImage imageNamed:imgArry[0]];
            btn.mainLabel.textColor = [UIColor redColor];
            _flagBtn = btn;
        }
        [self.view addSubview:btn];
    }
    
}
//按钮点击事件
-(void)changeVC:(CustomTabBarBtn *)button{
    self.selectedIndex = button.tag;
    if (_flagBtn!=button) {
        _flagBtn.imgView.image = [UIImage imageNamed:@""];
        _flagBtn.mainLabel.textColor = [UIColor blackColor];
        
        button.imgView.image = [UIImage imageNamed:@""];
        button.mainLabel.textColor = [UIColor redColor];
        _flagBtn = button;
    }
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

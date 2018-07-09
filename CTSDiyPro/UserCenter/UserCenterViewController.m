//
//  UserCenterViewController.m
//  CacheImagesDemo
//
//  Created by 周大生 on 2018/6/12.
//  Copyright © 2018年 周大生. All rights reserved.
//

#import "UserCenterViewController.h"
#import "OrderManagerViewController.h"
#import "UserOrderViewController.h"
#import "OrderViewController.h"

@interface UserCenterViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *maintableView;
@property(nonatomic,strong)NSMutableArray *titleArr;

@end
static NSString *cellName = @"cellName";
@implementation UserCenterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.titleArr = [[NSMutableArray alloc]initWithObjects:@"个人信息",@"客户管理",@"订单管理",@"修改密码",@"关于", nil];
    [self initViews];
}
-(void)initViews{
    self.maintableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, MainW, MainH-49) style:UITableViewStyleGrouped];
    self.maintableView.delegate = self;
    self.maintableView.dataSource = self;
    [self.view addSubview:self.self.maintableView];
    
    [self.maintableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellName];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.titleArr.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellName forIndexPath:indexPath];
    cell.textLabel.text = self.titleArr[indexPath.row];
    //为单元格的label设置数据
    //cell.textLabel.text = @"铂金";
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 2) {
//        OrderManagerViewController *vc = [[OrderManagerViewController alloc]init];
//        vc.hidesBottomBarWhenPushed = YES;
//        [self.navigationController pushViewController:vc animated:YES];
        OrderViewController *orderVC = [[OrderViewController alloc]init];
        UINavigationController *nv = [[UINavigationController alloc]initWithRootViewController:orderVC];
        orderVC.title = @"订单管理";
        [self presentViewController:nv animated:YES completion:nil];
        
       // [self.navigationController pushViewController:orderVC animated:YES];
    }
}
//行高
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return MainH/15;
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

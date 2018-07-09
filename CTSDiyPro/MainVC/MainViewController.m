//
//  MainViewController.m
//  CacheImagesDemo
//
//  Created by 周大生 on 2018/6/11.
//  Copyright © 2018年 周大生. All rights reserved.
//

#import "MainViewController.h"
#import "MJRefresh.h"
#import "MainShowTableViewCell.h"
#import "HttpAPI.h"
#import "MainDepartmentModel.h"
#import "UIImageView+WebCache.h"
#import "ZDSBaseCache.h"

#import "SVProgressHUD.h"

@interface MainViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSMutableArray *headArry;
/**
 *总数据
 */
@property(nonatomic,strong)NSMutableArray *dataArr;
/**
 *保存的数组
 */
@property(nonatomic,strong)NSMutableArray *dataArray;
/**
 *页数
 */
@property(nonatomic,assign)NSInteger pageNumber;
/**
 *总页数
 */
@property(nonatomic,assign)NSInteger allPages;
@end

@implementation MainViewController
static NSString *cellName = @"cellName";
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view setBackgroundColor:[UIColor whiteColor]];
    self.headArry = [[NSMutableArray alloc]initWithObjects:@"百资女戒", @"白魅吊坠",@"玫瑰与诗",@"幸福时刻",@"LOVE100星座极光",nil];
   
    [self initData];
    //[self showImage];
    [SVProgressHUD showWithStatus:@"正在加载"];
    [self initViews];
}
#pragma mark - Datas
-(void)initData{
    self.dataArr = [[NSMutableArray alloc]init];
    self.dataArray = [[NSMutableArray alloc]init];
    self.pageNumber = 1;
}
#pragma mark - views
//刷新列表r
-(void)initViews{
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, MainW, MainH-49) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellName];
    [self.tableView registerNib:[UINib nibWithNibName:@"MainShowTableViewCell" bundle:nil] forCellReuseIdentifier:@"MainShowTableViewCell"] ;
    //下拉刷新
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewTopic)];
    
    //自动更改透明度
    self.tableView.mj_header.automaticallyChangeAlpha = YES;
    
    //进入刷新状态
    [self.tableView.mj_header beginRefreshing];
    
    //上拉刷新
    self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreTopic)];
    //结束头部刷新
    [self.tableView.mj_header endRefreshing];
    
    //结束尾部刷新
    [self.tableView.mj_footer endRefreshing];
    
}
//-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
//    UIView *headView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, MainW, 80)];
//
//    UILabel *healabel = [[UILabel alloc]initWithFrame:headView.frame];
//    healabel.backgroundColor = [UIColor redColor];
//    healabel.textAlignment = NSTextAlignmentCenter;
//    healabel.text = self.headArry[section];
//    [headView addSubview:healabel];
//    return headView;
//}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.dataArr.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MainShowTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MainShowTableViewCell" forIndexPath:indexPath];
    cell.imgView.image = [UIImage imageNamed:@"erding.jpg"];
    MainDepartmentModel *model = self.dataArr[indexPath.row];
    cell.telphoneLabel.text = [NSString stringWithFormat:@"%ld",indexPath.row];;
    cell.numLabel.text =model.department_name;
    //为单元格的label设置数据
    //cell.textLabel.text = [NSString stringWithFormat:@"%ld",indexPath.row+1];
    return cell;
}
//行高
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return MainH/6;
}
#pragma mark - 包装parameters
-(NSDictionary *)parametersDict{
    NSMutableDictionary *paraDict = [[NSMutableDictionary alloc]init];
    NSNumber *pageNum = [NSNumber numberWithInteger:self.pageNumber];
    NSNumber *rowsNum = [NSNumber numberWithInteger:10];
    [paraDict setValue:pageNum forKey:@"page"];
    [paraDict setValue:rowsNum forKey:@"rows"];
    [paraDict setValue:@"" forKey:@"sort"];
    [paraDict setValue:@"asc" forKey:@"dir"];
    [paraDict setValue:@"" forKey:@"searchFileds"];
    return paraDict;
}
#pragma mark - 下拉刷新
-(void)loadNewTopic{
    if (self.dataArr.count>0) {
        [self.tableView.mj_header endRefreshing];
    }
    NSLog(@"清除后的数据数量%d",self.dataArr.count);
    //[self readData];
    NSDictionary *paraDict = [self parametersDict];
    [self getAPI:paraDict];
}
#pragma mark - 上拉刷新
-(void)loadMoreTopic{
    //页数+1，原数组不变
    self.pageNumber++;
    NSLog(@"页数:--------%ld",self.pageNumber);
    NSDictionary *paraDict = [self parametersDict];
    NSLog(@"ParaDict%@",paraDict);
    [self getAPI:paraDict];
}

#pragma mark - get请求
-(void)getAPI:(NSDictionary *)paraDict{
    __weak typeof(self)weakS = self;
    NSString *requestURL = [[NSString alloc]initWithFormat:@"%@%@%@",BaseAPI,APIVersion,@"/base/Department/"];
//    NSString *tempUrl = @"http://bb.shoujiduoduo.com/baby/bb.php?//ver=ErGeDD_ip_2.1.0.4.ipa&grade=&type=getvideos&page=0&pagesize=40&collectid=23&hasseq=0";
    
    //NSString *temUrl = @"http://10.0.88.70:8080/api/v1/Department/"
    NSLog(@"BasicURL:%@",requestURL);
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
                NSDictionary *dataDict = [weatherDic objectForKey:@"data"];
                NSNumber *tempPageNumber = [weatherDic objectForKey:@"pages"];
                //是否为第几页
                NSNumber *isFirstPage = [dataDict objectForKey:@"isFirstPage"];
                //总页数
                NSNumber *total = [dataDict objectForKey:@"total"];
                self.allPages = tempPageNumber.integerValue;
                NSArray *listArr = [dataDict objectForKey:@"list"];
                //判断当前的数组的总数与服务器给的总数
                if (weakS.dataArr.count<total.integerValue) {
                    //判断当前页数是否为第一页
                    if (isFirstPage.boolValue) {
                        //清空数组数据
                        [self.dataArr removeAllObjects];
                        [self.dataArray removeAllObjects];
                        //清除缓存数据，防止重复缓存
                        [self clearCache];
                    }
                    for (int i = 0; i < listArr.count; i++) {
                        NSDictionary *dict = listArr[i];
                        [self.dataArray addObject:listArr[i]];
                        MainDepartmentModel *model = [[MainDepartmentModel alloc]initWithDictionary:dict];
                        [weakS.dataArr addObject:model];
                    }
                    [weakS.tableView reloadData];
                    [weakS saveDada];
                }else{
                    NSLog(@"加载完毕");
                }
                [SVProgressHUD dismiss];
            }
        }
    } failure:^(NSError *error) {
//        [SVProgressHUD showWithStatus:[NSString stringWithFormat:@"%@",error]];
        NSLog(@"Get error --%@",error);
    }];
    [self.tableView.mj_header endRefreshing];
    [self.tableView.mj_footer endRefreshing];
}
#pragma mark - 展示图片
-(void)showImage{
    NSString *urlString = @"http://c.hiphotos.baidu.com/image/w%3D2048/sign=396e9d640b23dd542173a068e531b2de/cc11728b4710b9123a8117fec1fdfc039245226a.jpg";
    //显示URL地址中的图片
    UIImageView *imgView = [[UIImageView alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];

    UIImage *cachedImage = [[SDImageCache sharedImageCache] imageFromDiskCacheForKey:urlString];
    [imgView setImage:cachedImage];
    
    [self.view addSubview:imgView];
    
}
#pragma mark - 缓存
-(void)saveDada{
    NSMutableArray *dataArray = [NSMutableArray array];
    for (MainDepartmentModel *model in self.dataArr) {
        [dataArray addObject:model.dict];
        //NSLog(@"model.dict%@",model.dict);
    }
    //存储数据
    NSDictionary *dic = @{@"arry":self.dataArray};
    NSData *data =  [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:nil];
    
    [ZDSBaseCache setObjectOfDic:data key:@"Main"];
}
#pragma mark - 读取
-(void)readData{
    [self.dataArr removeAllObjects];
    NSData *data = [ZDSBaseCache cacheDicForKey:@"Main"];
    if (data != nil) {
        //将NSdata转换为字典
        NSDictionary *dictionary =[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
        NSMutableArray *tempArr = [dictionary objectForKey:@"arry"];
        for (NSDictionary *dict in tempArr) {
            MainDepartmentModel *model = [[MainDepartmentModel alloc]initWithDictionary:dict];
            [self.dataArr addObject:model];
        }
    }
}
#pragma mark - 清除缓存
-(void)clearCache{
    [ZDSBaseCache clearCacheListData:^{
        NSLog(@"清除完毕");
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

//
//  NFBaseTableViewController.m
//  footballnews
//
//  Created by jason.cao on 2018/5/25.
//  Copyright © 2018年 niefan. All rights reserved.
//

#import "NFBaseTableViewController.h"
#import "NFBaseTableViewCell.h"
#import "NFNewsDetailsViewController.h"
#import "NFNewsShowModel.h"

@interface NFBaseTableViewController ()
@property (nonatomic, strong) NSNumber *mid;
@property (nonatomic, strong) NSMutableArray *datasource;
@property (nonatomic, assign) NSInteger page;
@property (nonatomic, strong) MBProgressHUD *hud;
@end

static NSString *BaseTableViewCellId = @"BaseTableViewCellId";
@implementation NFBaseTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupTable];
    
}

- (NSMutableArray *)datasource{
    if (_datasource == nil) {
        _datasource = [NSMutableArray array];
    }
    return _datasource;
}

- (void)setupTable{
    
    _page = 1;
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    [self.tableView registerNib:[UINib nibWithNibName:@"NFBaseTableViewCell" bundle:nil] forCellReuseIdentifier:BaseTableViewCellId];
    self.tableView.rowHeight = 290.f;
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(requestData)];
    [self.tableView.mj_header beginRefreshing];
    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(requestData)];
    
    _hud = [[MBProgressHUD alloc] initWithView:self.view];
    [self.view addSubview:_hud];
}

- (void)requestData{
    [_hud showAnimated:YES];
    NSString *url = @"http://zx.ixinjiapo28.com/news/bymid";
    NSMutableDictionary *parameter = [NSMutableDictionary dictionary];
    parameter[@"mid"]=_type;
    parameter[@"page"]=[NSString stringWithFormat:@"%ld",_page];
    parameter[@"limit"]=@10;
    
    [NFNetTools get:url parameters:parameter netBlock:^(NSString *result, NSDictionary *data) {
        if ([result isEqualToString:@"success"]) {
            NSLog(@"sucee");
            NSDictionary *resMsg = data[@"resMsg"];
            NSArray *newsArr = resMsg[@"module_news"];
            if(newsArr.count == 0){
                [self.tableView.mj_footer endRefreshingWithNoMoreData];
            }else{
                _page++;
                for (NSDictionary *dict in newsArr) {
                    NFNewsShowModel *model = [NFNewsShowModel mj_objectWithKeyValues:dict];
                    [self.datasource addObject:model];
                }
                [self.tableView.mj_footer endRefreshing];
            }
            [self.tableView reloadData];
            [self.tableView.mj_header endRefreshing];
            
        }else{
            
            NSLog(@"fail");
            [self.tableView.mj_header endRefreshing];
            [self.tableView.mj_footer endRefreshing];
        }
        [_hud hideAnimated:YES];
    }];
    
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return _datasource.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NFBaseTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:BaseTableViewCellId forIndexPath:indexPath];
    cell.model = _datasource[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NFNewsDetailsViewController *detail = [[NFNewsDetailsViewController alloc] init];
    [self.navigationController pushViewController:detail animated:YES];
    
}

@end

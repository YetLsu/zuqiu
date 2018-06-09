//
//  NFSettingViewController.m
//  footballnews
//
//  Created by jason.cao on 2018/5/31.
//  Copyright © 2018年 niefan. All rights reserved.
//

#import "NFSettingViewController.h"
#import "NFProfileViewController.h"

@interface NFSettingViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic, strong) UITableView *tableView;
@property(nonatomic, strong) NSArray *titles;
@property(nonatomic, strong) NSArray *datas;
@property (nonatomic, strong) MBProgressHUD *hud;
@end
static NSString *settingIdentifierId = @"settingIdentifierId";
@implementation NFSettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupTable];
    _hud = [[MBProgressHUD alloc] initWithView:self.view];
    [self.view addSubview:_hud];
    
}
- (void)setupTable{
    self.view.backgroundColor = [UIColor whiteColor];
    _titles = @[@"当前版本",@"清理缓存"];
    NSString *version = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
    _datas = @[version, @"12.5M"];
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.rowHeight = 50;
    _tableView.bounces = NO;
    _tableView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_tableView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _datas.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:settingIdentifierId];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:settingIdentifierId];
    }
    cell.textLabel.text = _titles[indexPath.row];
    cell.detailTextLabel.text = _datas[indexPath.row];
    cell.detailTextLabel.font = [UIFont systemFontOfSize:15];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.001;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 60;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView *footer = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 60)];
    footer.backgroundColor = [UIColor colorWithHexString:@"#efefef"];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [btn setTitle:@"退出登录" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(logout) forControlEvents:UIControlEventTouchUpInside];
    [footer addSubview:btn];
    btn.frame =  CGRectMake(0, 10, kScreenWidth, 50);
    btn.backgroundColor = [UIColor whiteColor];
    return footer;
}

- (void)logout{
    UIAlertController *alertCtrl = [UIAlertController alertControllerWithTitle:@"是否退出当前账号登陆" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    
    UIAlertAction *logout = [UIAlertAction actionWithTitle:@"确定退出" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"login"];
        NFProfileViewController *pro = (NFProfileViewController *)self.mm_drawerController.leftDrawerViewController;
        [pro refresh];
        
    }];
    
    UIAlertAction *cancle = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    
    [alertCtrl addAction:logout];
    [alertCtrl addAction:cancle];
    [self presentViewController:alertCtrl animated:YES completion:nil];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.row == 1) {
        [_hud showAnimated:YES];
        [_hud hideAnimated:YES afterDelay:2];
        [self performSelector:@selector(changeWithIndexPath:) withObject:indexPath afterDelay:2];
    }
}

- (void)changeWithIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
    cell.detailTextLabel.text = @"0M";
}






@end

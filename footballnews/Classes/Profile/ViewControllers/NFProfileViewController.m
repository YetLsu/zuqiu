//
//  NFProfileViewController.m
//  footballnews
//
//  Created by jason.cao on 2018/5/25.
//  Copyright © 2018年 niefan. All rights reserved.
//

#import "NFProfileViewController.h"
#import "NFCollectionController.h"
#import "CenterViewController.h"
#import "NFAboutusViewController.h"
#import "NFSettingViewController.h"
#import "NFLoginViewController.h"
#import "NFUserInfoViewController.h"

@interface NFProfileViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *titles;
@property (nonatomic, strong) NSMutableArray *images;

@end

static NSString *ProfileCellId = @"ProfileCellId";
@implementation NFProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupData];
    [self setupTableView];
}
- (void)refresh{
    [self setupData];
    [_tableView reloadData];
}

- (void)setupData{
    _images = [NSMutableArray array];
    _titles = @[@"未登录",@"关于我们",@"视频收藏",@"设置"];
    NSArray *imageNames = @[@"default_icon",@"profile_center",@"profile_videos",@"profile_setting"];
    for (NSString *names in imageNames) {
        UIImage *image = [UIImage imageNamed:names];
        [_images addObject:image];
    }
    
    if ([[NSUserDefaults standardUserDefaults] boolForKey:@"login"]) {
        NSData *data = [[NSUserDefaults standardUserDefaults] dataForKey:@"userimage"];
        _userName = [[NSUserDefaults standardUserDefaults] stringForKey:@"username"];
        _userImage = [UIImage imageWithData:data scale:0.5];
        _images[0] = _userImage;
        _titles = @[_userName,@"关于我们",@"视频收藏",@"设置"];
    }
}


- (void)setupTableView{
    UIImageView *bgImageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    bgImageView.image = [UIImage imageNamed:@"profile_bg"];
    [self.view addSubview:bgImageView];
   
    
    
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    _tableView.backgroundColor = [UIColor clearColor];
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:ProfileCellId];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ProfileCellId forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.backgroundColor = [UIColor clearColor];
    cell.imageView.image = _images[indexPath.row];
    cell.textLabel.text = _titles[indexPath.row];
    cell.textLabel.textColor = [UIColor whiteColor];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        
        return 100.f;
    }
    return 44.f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    switch (indexPath.row) {
        case 0:
        {
            if (![[NSUserDefaults standardUserDefaults] boolForKey:@"login"]) {
                [self.mm_drawerController closeDrawerAnimated:YES completion:^(BOOL finished) {
                    NFLoginViewController *login = [[NFLoginViewController alloc] initWithNibName:@"NFLoginViewController" bundle:nil];
                    login.title = @"用户登录";
                    [[self getNavigationController] pushViewController:login animated:YES];
                }];
            }else{
                [self.mm_drawerController closeDrawerAnimated:YES completion:^(BOOL finished) {
                    NFUserInfoViewController *userInfo = [[NFUserInfoViewController alloc] init];
                    userInfo.title = @"修改资料";
                    [[self getNavigationController] pushViewController:userInfo animated:YES];
                }];
                
            }
            
            
            
        }
            break;
        case 1:
        {
            [self.mm_drawerController closeDrawerAnimated:YES completion:^(BOOL finished) {
                NFAboutusViewController *aboutus = [[NFAboutusViewController alloc] init];
                aboutus.title = @"关于我们";
                [[self getNavigationController] pushViewController:aboutus animated:YES];
            }];

        }
            break;
        case 2:
        {
            [self.mm_drawerController closeDrawerAnimated:YES completion:^(BOOL finished) {
                NFCollectionController *collection = [[NFCollectionController alloc] init];
                collection.title = @"我的收藏";
                [[self getNavigationController] pushViewController:collection animated:YES];
            }];
        }
            break;
        case 3:
        {
            [self.mm_drawerController closeDrawerAnimated:YES completion:^(BOOL finished) {
                NFSettingViewController *setting = [[NFSettingViewController alloc] init];
                setting.title = @"设置";
                [[self getNavigationController] pushViewController:setting animated:YES];
            }];
        }
            break;
            
        default:
            break;
    }
}

- (UINavigationController *)getNavigationController{
    CenterViewController *center = (CenterViewController *)self.mm_drawerController.centerViewController;
    //获取tabBarController选中的是哪个
    NSInteger i = center.selectedIndex;
    return center.childViewControllers[i];
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

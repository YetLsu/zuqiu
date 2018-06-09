//
//  CenterViewController.m
//  footballnews
//
//  Created by jason.cao on 2018/5/25.
//  Copyright © 2018年 niefan. All rights reserved.
//

#import "CenterViewController.h"
#import "BaseNavigationController.h"
#import "NFNationalViewController.h"
#import "NFLocalViewController.h"
#import "NFVideoViewController.h"

@interface CenterViewController ()

@end

@implementation CenterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupChildVcs];
}

- (void)setupChildVcs{
    NFNationalViewController *national = [[NFNationalViewController alloc] init];
    national.titles = @[@"最新",@"英超",@"西甲",@"德甲",@"意甲"];
    [self addChildViewController:national normalImage:@"tab_national_normal" selectedImage:@"tab_national_selected" title:@"国际足球"];
    
//    NFNationalViewController *local = [[NFNationalViewController alloc] init];
    NFLocalViewController *local = [[NFLocalViewController alloc] init];
    local.titles = @[@"最新",@"中超",@"国足",@"女足",@"中甲"];
    [self addChildViewController:local normalImage:@"tab_local_normal" selectedImage:@"tab_local_selected" title:@"中国足球"];
    
    NFVideoViewController *video = [[NFVideoViewController alloc] init];
    [self addChildViewController:video normalImage:@"tab_video_normal" selectedImage:@"tab_video_selected" title:@"精彩视频"];
}


- (void)addChildViewController:(UIViewController *)childController normalImage:(NSString *)normalImage selectedImage:(NSString *)selectedImage title:(NSString *)title{
    // 设置子控制器的文字
    childController.title = title; // 同时设置tabbar和navigationBar的文字
    
//    childController.tabBarItem.title = title;
    
    // 设置子控制器的图片
    childController.tabBarItem.image = [UIImage imageNamed:normalImage];
    childController.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    // 设置文字的样式
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName] = [UIColor colorWithHexString:@"#666666"];
    NSMutableDictionary *selectTextAttrs = [NSMutableDictionary dictionary];
    selectTextAttrs[NSForegroundColorAttributeName] = [UIColor colorWithHexString:@"#13227A"];
    
    [childController.tabBarItem setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    
    [childController.tabBarItem setTitleTextAttributes:selectTextAttrs forState:UIControlStateSelected];
    
    BaseNavigationController *nav = [[BaseNavigationController alloc] initWithRootViewController:childController];
    
    UIButton *leftItem = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftItem setImage:[UIImage imageNamed:@"navi_profile"] forState:UIControlStateNormal];
    leftItem.frame = CGRectMake(0, 0, 40, 40);
    [leftItem addTarget:self action:@selector(setprofile:) forControlEvents:UIControlEventTouchUpInside];
//    UIBarButtonItem *item = [UIBarButtonItem itemWithTarget:self action:@selector(setprofile:) image:@"navi_profile" highImage:@"navi_profile"];
//    childController.navigationItem.leftBarButtonItem = item;
    
    childController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftItem];
    
    [self addChildViewController:nav];
}

- (void)setprofile:(UIButton *)button{
    [self.mm_drawerController openDrawerSide:MMDrawerSideLeft animated:YES completion:nil];
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

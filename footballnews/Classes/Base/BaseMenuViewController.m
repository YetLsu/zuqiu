//
//  BaseMenuViewController.m
//  footballnews
//
//  Created by jason.cao on 2018/5/25.
//  Copyright © 2018年 niefan. All rights reserved.
//

#import "BaseMenuViewController.h"
#import "CenterViewController.h"
#import "NFProfileViewController.h"
#import "BaseNavigationController.h"

@interface BaseMenuViewController ()

@end

@implementation BaseMenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupContent];
    [self setupNetMonitor];
}

- (void)setupNetMonitor{
    AFNetworkReachabilityManager *manager = [AFNetworkReachabilityManager sharedManager];
    [manager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        switch (status) {
            case AFNetworkReachabilityStatusNotReachable:{
                NSLog(@"没网了");
            }
                break;
            case AFNetworkReachabilityStatusReachableViaWiFi:
            {
                NSLog(@"wifi");
            }
                break;
            case AFNetworkReachabilityStatusReachableViaWWAN:
            {
                NSLog(@"4g");
            }
                break;
            default:
                break;
        }
    }];
    [manager startMonitoring];
    
}

- (void)setupContent{
    NFProfileViewController *leftVC = [[NFProfileViewController alloc] init];
//    BaseNavigationController *leftVC = [[BaseNavigationController alloc] initWithRootViewController:profilVc];
    self.leftDrawerViewController = leftVC;
    self.maximumLeftDrawerWidth = kScreenWidth*0.7;
    CenterViewController *mainVC = [[CenterViewController alloc] init];
    self.centerViewController = mainVC;
    
    self.showsShadow = NO;
    self.openDrawerGestureModeMask = MMOpenDrawerGestureModeAll;
    self.closeDrawerGestureModeMask = MMCloseDrawerGestureModeAll;

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

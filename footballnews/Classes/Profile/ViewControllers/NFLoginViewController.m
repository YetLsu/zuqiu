//
//  NFLoginViewController.m
//  footballnews
//
//  Created by jason.cao on 2018/5/17.
//  Copyright © 2018年 niefan. All rights reserved.
//

#import "NFLoginViewController.h"
#import "NFRegisterViewController.h"
#import "NFProfileViewController.h"

@interface NFLoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *userTf;
@property (weak, nonatomic) IBOutlet UITextField *pswTf;
@property (nonatomic, strong) MBProgressHUD *hud;

@end

@implementation NFLoginViewController

- (void)awakeFromNib{
    
    [super awakeFromNib];
}
- (void)viewWillAppear:(BOOL)animated{
     [self setupHud];
}
- (void)setupHud{
    _hud = [[MBProgressHUD alloc] initWithView:self.view];
    [self.view addSubview:_hud];
}
- (IBAction)loginAction:(UIButton *)sender {
    [self checkUser];
    
    
}
- (void)checkUser{
    if (_userTf.text.length == 0) {
        UIAlertController *alert = [UIAlertController alertControllerWithMessage:@"请输入账号！！！" actionTitle:@"OK"];
        [self presentViewController:alert animated:YES completion:nil];
    }else if(_pswTf.text.length == 0){
        UIAlertController *alert = [UIAlertController alertControllerWithMessage:@"请输入密码！！！" actionTitle:@"OK"];
        [self presentViewController:alert animated:YES completion:nil];
        
    }else if(![_userTf.text isEqualToString:@"test123"] || ![_pswTf.text isEqualToString:@"test123456"]){
        UIAlertController *alert = [UIAlertController alertControllerWithMessage:@"账号和密码不匹配！！！" actionTitle:@"OK"];
        [self presentViewController:alert animated:YES completion:nil];
    }else{
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"login"];
        _hud.label.text = @"登陆中...";
        [_hud showAnimated:YES];
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"login"];
        NFProfileViewController *pro = (NFProfileViewController *)self.mm_drawerController.leftDrawerViewController;
        [pro refresh];
        [self.navigationController performSelector:@selector(popViewControllerAnimated:) withObject:@"YES" afterDelay:2];
    }
}
- (void)viewWillDisappear:(BOOL)animated{
    [_hud hideAnimated:YES];
}


- (IBAction)registerClick:(UIButton *)sender {
    NFRegisterViewController *registerVc = [[NFRegisterViewController alloc] init];
    registerVc.title = @"注册";
    [self.navigationController pushViewController:registerVc animated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
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

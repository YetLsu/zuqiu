//
//  NFRegisterViewController.m
//  footballnews
//
//  Created by jason.cao on 2018/5/17.
//  Copyright © 2018年 niefan. All rights reserved.
//

#import "NFRegisterViewController.h"
#import "NFProtocolViewController.h"

@interface NFRegisterViewController ()
@property (weak, nonatomic) IBOutlet UITextField *userTf;
@property (weak, nonatomic) IBOutlet UITextField *pswTf;
@property (weak, nonatomic) IBOutlet UITextField *rePswTf;
@property (nonatomic, strong) MBProgressHUD *hud;
@end
@implementation NFRegisterViewController


- (void)viewWillAppear:(BOOL)animated{
    [self setupHud];
}
- (void)setupHud{
    _hud = [[MBProgressHUD alloc] initWithView:self.view];
    [self.view addSubview:_hud];
}



- (void)checkUser{
    if (_userTf.text.length == 0) {
        UIAlertController *alert = [UIAlertController alertControllerWithMessage:@"请输入账号！！！" actionTitle:@"OK"];
        [self presentViewController:alert animated:YES completion:nil];
    }else if(_pswTf.text.length < 6 || _pswTf.text.length > 13){
        UIAlertController *alert = [UIAlertController alertControllerWithMessage:@"请确保密码格式正确！！！" actionTitle:@"OK"];
        [self presentViewController:alert animated:YES completion:nil];
        
    }else if(![_rePswTf.text isEqualToString:_pswTf.text]){
        UIAlertController *alert = [UIAlertController alertControllerWithMessage:@"两次输入不一致，请重新输入！！！" actionTitle:@"OK"];
        [self presentViewController:alert animated:YES completion:nil];
    }else{
        
        [_hud showAnimated:YES];
        [self.navigationController performSelector:@selector(popViewControllerAnimated:) withObject:@"YES" afterDelay:2];
    }
}

- (IBAction)registerAction:(UIButton *)sender {
    [self checkUser];
}
- (IBAction)protocolClick:(UIButton *)sender {
    NFProtocolViewController *pro = [[NFProtocolViewController alloc] initWithNibName:@"NFProtocolViewController" bundle:nil];
    [self.navigationController pushViewController:pro animated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

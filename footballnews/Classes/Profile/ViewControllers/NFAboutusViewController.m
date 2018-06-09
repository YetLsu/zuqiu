//
//  NFAboutusViewController.m
//  footballnews
//
//  Created by jason.cao on 2018/5/31.
//  Copyright © 2018年 niefan. All rights reserved.
//

#import "NFAboutusViewController.h"

@interface NFAboutusViewController ()

@end

@implementation NFAboutusViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupContent];
}

- (void)setupContent{
    self.view.backgroundColor = [UIColor whiteColor];
    UIImageView *logo = [[UIImageView alloc] initWithFrame:CGRectMake((kScreenWidth - 80)/2, 110, 80, 80)];
    logo.layer.cornerRadius = 10.f;
    logo.layer.masksToBounds = YES;
    logo.image = [UIImage imageNamed:@"logo"];
    [self.view addSubview:logo];
    
    UILabel *appLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 205, kScreenWidth - 20, 20)];
    
    appLabel.text = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleDisplayName"];
    
    appLabel.textColor = [UIColor blackColor];
    appLabel.textAlignment = NSTextAlignmentCenter;
    appLabel.font = [UIFont systemFontOfSize:18];
    [self.view addSubview:appLabel];
    
    //此获取的版本号对应version，打印出来对应为1.2.3.4.5这样的字符串
    NSString *version = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
    
    UILabel *versionLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 225 + 20, kScreenWidth - 20, 20)];
    versionLabel.textColor = [UIColor blackColor];
    versionLabel.textAlignment = NSTextAlignmentCenter;
    versionLabel.font = [UIFont systemFontOfSize:14];
    versionLabel.text = [NSString stringWithFormat:@"%@ 版本",version];
    [self.view addSubview:versionLabel];
    
    UITextView *textView = [[UITextView alloc] initWithFrame:CGRectMake(20, versionLabel.y+ versionLabel.height + 10, kScreenWidth - 40, 300)];
    textView.text = @"足球资讯app是一款专门为足球爱好者提供多方面的足球新闻资讯的app。旨在满足足球粉丝的新闻资讯实时更新的需求，并可以在线观看更多的足球视频。";
    textView.userInteractionEnabled = NO;
    textView.textAlignment = NSTextAlignmentCenter;
    textView.font = [UIFont systemFontOfSize:16];
    textView.textColor = [UIColor colorWithHexString:@"#666666"];
    [self.view addSubview:textView];
    
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

//
//  NFWebViewController.m
//  footballnews
//
//  Created by jason.cao on 2018/5/24.
//  Copyright © 2018年 niefan. All rights reserved.
//

#import "NFWebViewController.h"

@interface NFWebViewController ()
@property (nonatomic, strong) UIWebView *webView;
@end

@implementation NFWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupWebView];
}

- (void)setupWebView{
    _webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:_webUrl]];
    [_webView loadRequest:request];
    [self.view addSubview:_webView];
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

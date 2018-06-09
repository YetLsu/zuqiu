//
//  NFNetTools.m
//  footballnews
//
//  Created by jason.cao on 2018/5/11.
//  Copyright © 2018年 niefan. All rights reserved.
//

#import "NFNetTools.h"

@implementation NFNetTools
+ (void)get:(NSString *)url parameters:(NSDictionary *)parameters netBlock:(NetBlock)netBlock{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html",@"text/plain", nil];
    manager.requestSerializer.timeoutInterval = 20;
    [manager GET:url parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary *data) {
        netBlock(@"success",data);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
        netBlock(@"fail",nil);
    }];
}

+ (void)post:(NSString *)url parameters:(NSDictionary *)parameters netBlock:(NetBlock)netBlock{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html",@"text/plain", nil];
    manager.requestSerializer.timeoutInterval = 10;

    [manager POST:url parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable data) {
        netBlock(@"success",data);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        netBlock(@"fail",nil);
    }];
}

@end

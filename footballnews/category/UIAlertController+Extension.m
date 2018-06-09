//
//  UIAlertController+Extension.m
//  footballnews
//
//  Created by jason.cao on 2018/5/24.
//  Copyright © 2018年 niefan. All rights reserved.
//

#import "UIAlertController+Extension.h"

@implementation UIAlertController (Extension)
+ (instancetype)alertControllerWithMessage:(NSString *)message actionTitle:(NSString *)title{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:title style:UIAlertActionStyleDefault handler:nil];
    [alert addAction:action];
    return alert;
}

+ (instancetype)alertControllerWithMessage:(NSString *)message actionTitle:(NSString *)title actionTitle:(NSString *)otherTitle{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action1 = [UIAlertAction actionWithTitle:title style:UIAlertActionStyleDefault handler:nil];
    UIAlertAction *action2 = [UIAlertAction actionWithTitle:otherTitle style:UIAlertActionStyleDefault handler:nil];
    [alert addAction:action1];
    [alert addAction:action2];
    return alert;
}
@end

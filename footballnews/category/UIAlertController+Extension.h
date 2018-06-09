//
//  UIAlertController+Extension.h
//  footballnews
//
//  Created by jason.cao on 2018/5/24.
//  Copyright © 2018年 niefan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIAlertController (Extension)
+ (instancetype)alertControllerWithMessage:(NSString *)message actionTitle:(NSString *)title;
+ (instancetype)alertControllerWithMessage:(NSString *)message actionTitle:(NSString *)title actionTitle:(NSString *)otherTitle;

@end

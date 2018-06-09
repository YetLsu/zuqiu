//
//  UIButton+Extension.h
//  footballnews
//
//  Created by jason.cao on 2018/5/19.
//  Copyright © 2018年 niefan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (Extension)

+ (instancetype)buttonWithFrame:(CGRect)frame image:(NSString *)image target:(id)target action:(SEL)action;


+ (instancetype)buttonWithFrame:(CGRect)frame image:(NSString *)image title:(NSString *)title target:(id)target action:(SEL)action;

+ (instancetype)buttonWithFrame:(CGRect)frame image:(NSString *)image title:(NSString *)title titleColor:(UIColor *)titleColor fontSize:(CGFloat)fontSize target:(id)target action:(SEL)action;
@end

//
//  UIButton+Extension.m
//  footballnews
//
//  Created by jason.cao on 2018/5/19.
//  Copyright © 2018年 niefan. All rights reserved.
//

#import "UIButton+Extension.h"

@implementation UIButton (Extension)

+ (instancetype)buttonWithFrame:(CGRect)frame image:(NSString *)image target:(id)target action:(SEL)action{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = frame;
    [button setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    return button;
}

+ (instancetype)buttonWithFrame:(CGRect)frame image:(NSString *)image title:(NSString *)title target:(id)target action:(SEL)action{
    UIButton *button = [self buttonWithFrame:frame image:image target:target action:action];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:16];
    return button;
}

+ (instancetype)buttonWithFrame:(CGRect)frame image:(NSString *)image title:(NSString *)title titleColor:(UIColor *)titleColor fontSize:(CGFloat)fontSize target:(id)target action:(SEL)action{
    
    UIButton *button = [self buttonWithFrame:frame image:image title:title target:self action:action];
    [button setTitleColor:titleColor forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:fontSize];
    return button;
}


@end

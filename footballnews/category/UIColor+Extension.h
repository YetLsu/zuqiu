//
//  UIColor+Extension.h
//  footballnews
//
//  Created by jason.cao on 2018/5/11.
//  Copyright © 2018年 niefan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Extension)
//十六进制颜色
+ (UIColor *) colorWithHexString: (NSString *)color;
//随机色
+ (UIColor *)arndomColor;
@end

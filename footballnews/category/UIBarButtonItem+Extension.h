//
//  UIBarButtonItem+Extension.h
//  footballnews
//
//  Created by jason.cao on 2018/5/16.
//  Copyright © 2018年 niefan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Extension)
+ (UIBarButtonItem *)itemWithTarget:(id)target action:(SEL)action image:(NSString *)image highImage:(NSString *)highImage;
@end

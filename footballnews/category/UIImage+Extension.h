//
//  UIImage+Extension.h
//  footballnews
//
//  Created by jason.cao on 2018/5/31.
//  Copyright © 2018年 niefan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Extension)
//调整图片大小
+ (UIImage *)resizeImage:(UIImage *)image size:(CGSize)newSize;
+ (UIImage *)maskImage:(UIImage*)image withMask:(UIImage*)mask;
- (UIImage *)circleImage:(UIImage*) image withParam:(CGFloat)inset;
@end

//
//  UIImage+Extension.m
//  footballnews
//
//  Created by jason.cao on 2018/5/31.
//  Copyright © 2018年 niefan. All rights reserved.
//

#import "UIImage+Extension.h"

@implementation UIImage (Extension)

+ (UIImage*)maskImage:(UIImage*)image withMask:(UIImage*)mask {
    CGImageRef imgRef = [image CGImage];CGImageRef maskRef = [mask CGImage];
    CGImageRef actualMask = CGImageMaskCreate(CGImageGetWidth(maskRef),CGImageGetHeight(maskRef),
                                              CGImageGetBitsPerComponent(maskRef),CGImageGetBitsPerPixel(maskRef),
                                              CGImageGetBytesPerRow(maskRef),CGImageGetDataProvider(maskRef),
                                              NULL, false);
    CGImageRef masked = CGImageCreateWithMask(imgRef,actualMask);
    return [UIImage imageWithCGImage:masked];
}
//调整图片大小
+ (UIImage *)resizeImage:(UIImage *)image size:(CGSize)newSize {
    UIGraphicsBeginImageContext(newSize);
    [image drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();UIGraphicsEndImageContext();
    return newImage;
}

- (UIImage*)circleImage:(UIImage*) image withParam:(CGFloat)inset {
    UIGraphicsBeginImageContext(image.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 2);
    CGContextSetStrokeColorWithColor(context, [UIColor redColor].CGColor);
    CGRect rect = CGRectMake(inset, inset, image.size.width - inset * 2.0f, image.size.height - inset * 2.0f);
    CGContextAddEllipseInRect(context, rect);
    CGContextClip(context);
    [image drawInRect:rect];
    CGContextAddEllipseInRect(context, rect);
    CGContextStrokePath(context);
    UIImage *newimg = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newimg;
}

@end

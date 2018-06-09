//
//  NFCommentTool.m
//  footballnews
//
//  Created by jason.cao on 2018/5/21.
//  Copyright © 2018年 niefan. All rights reserved.
//

#import "NFCommentTool.h"

@implementation NFCommentTool
+ (CGFloat)text:(NSString *)text getHightWithWidth:(CGFloat)width fontsize:(CGFloat)fontSize textColor:(UIColor *)color{
    NSMutableDictionary *attribute = [NSMutableDictionary dictionary];
    attribute[NSFontAttributeName] = [UIFont systemFontOfSize:fontSize];
    attribute[NSForegroundColorAttributeName] = color;
    CGRect rect = [text boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:attribute context:nil];
    return rect.size.height + 10;
}
@end

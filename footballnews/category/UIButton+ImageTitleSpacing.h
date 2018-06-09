//
//  UIButton+ImageTitleSpacing.h
//  draw
//
//  Created by jason.cao on 2018/4/25.
//  Copyright © 2018年 niefan. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef enum : NSUInteger {
    MKButtonEdgeInsetsStyleTop = 0,
    MKButtonEdgeInsetsStyleLeft,
    MKButtonEdgeInsetsStyleBottom,
    MKButtonEdgeInsetsStyleRight
} MKButtonEdgeInsetsStyle;

@interface UIButton (ImageTitleSpacing)
- (void)layoutButtonWithEdgeInsetsStyle:(MKButtonEdgeInsetsStyle)style
                        imageTitleSpace:(CGFloat)space;
@end

//
//  NFPageIndecatorView.m
//  footballnews
//
//  Created by jason.cao on 2018/5/25.
//  Copyright © 2018年 niefan. All rights reserved.
//

#import "NFPageIndecatorView.h"

@interface NFPageIndecatorView ()
@property (nonatomic, assign) CGSize size;
@end

@implementation NFPageIndecatorView
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        _size = frame.size;
        
    }
    return self;
}

- (void)setupContentWithTitles:(NSArray *)titles normaleColor:(UIColor *)normaleColor selectedColor:(UIColor *)selectedColor{
    CGFloat btnW = _size.width/titles.count;
    CGFloat btnH = _size.height - 10;
    for (int i=0; i<titles.count; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setTitle:titles[i] forState:UIControlStateNormal];
        [btn setTitleColor:normaleColor forState:UIControlStateNormal];
        [btn setTitleColor:selectedColor forState:UIControlStateSelected];
        btn.frame = CGRectMake(i*btnW, 0, btnW, btnH);
        if (i==0) {
            btn.selected = YES;
        }
        [self addSubview:btn];
    
    }
    
    UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, _size.height - 10, _size.width, 10)];
    line.backgroundColor = [UIColor colorWithHexString:@"#f5f5f5"];
    [self addSubview:line];
}

@end

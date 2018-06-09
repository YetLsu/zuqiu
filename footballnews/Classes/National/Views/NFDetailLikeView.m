//
//  NFDetailLikeView.m
//  footballnews
//
//  Created by jason.cao on 2018/5/28.
//  Copyright © 2018年 niefan. All rights reserved.
//

#import "NFDetailLikeView.h"

@interface NFDetailLikeView ()<UIScrollViewDelegate>
@property (nonatomic, strong) UIScrollView *scrollView;
@end

@implementation NFDetailLikeView
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
//        NSLog(@"frame ====== %@",NSStringFromCGRect(self.frame));
        [self setupContent:frame];
    }
    return self;
}

- (void)setupContent:(CGRect)frame{
    self.translatesAutoresizingMaskIntoConstraints = NO;
    _datasource = [NSMutableArray array];
    _scrollView = [[UIScrollView alloc] initWithFrame:frame];
    _scrollView.delegate = self;
    _scrollView.showsHorizontalScrollIndicator = NO;
    [self addSubview:_scrollView];
}

- (void)setDatasource:(NSArray *)datasource{
    if (_datasource != datasource) {
        _datasource = datasource;
    }
    CGFloat btnW = (self.frame.size.width - 10*6)/5.;
    CGFloat btnH = self.frame.size.height;
    for (int i=0; i<datasource.count; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(10 + i*(btnW+10), 0, btnW, btnH);
        [btn setImage:[UIImage imageNamed:datasource[i]] forState:UIControlStateNormal];
        btn.tag = 100 + i;
        btn.layer.cornerRadius = btnH/2.;
        btn.layer.masksToBounds = YES;
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [_scrollView addSubview:btn];
    }
    if (_datasource.count >= 6) {
        _scrollView.contentSize = CGSizeMake((btnW+10) *_datasource.count , btnH);
    }else{
        _scrollView.contentSize = self.frame.size;
    }
}

- (void)btnClick:(UIButton *)button{
   
}


@end

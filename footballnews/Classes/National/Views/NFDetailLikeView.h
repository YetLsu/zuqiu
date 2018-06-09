//
//  NFDetailLikeView.h
//  footballnews
//
//  Created by jason.cao on 2018/5/28.
//  Copyright © 2018年 niefan. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ButtonBlock)(NSInteger index);

@interface NFDetailLikeView : UIView
@property (nonatomic, strong) NSArray *datasource;
@property (nonatomic, assign) ButtonBlock btnBlock;

@end

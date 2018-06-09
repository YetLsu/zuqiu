//
//  NFCommentModel.h
//  footballnews
//
//  Created by jason.cao on 2018/5/28.
//  Copyright © 2018年 niefan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NFCommentModel : NSObject
@property(nonatomic, copy) NSString *icon;
@property(nonatomic, copy) NSString *name;
@property(nonatomic, copy) NSString *time;
@property(nonatomic, copy) NSString *content;
@property(nonatomic, assign) CGFloat contentHeight;
@property(nonatomic, copy) NSString *timeFormate;

@end

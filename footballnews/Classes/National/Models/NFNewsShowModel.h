//
//  NFNewsShowModel.h
//  footballnews
//
//  Created by jason.cao on 2018/5/29.
//  Copyright © 2018年 niefan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NFNewsShowModel : NSObject
@property(nonatomic, copy) NSString *nid;
@property(nonatomic, copy) NSString *title;
@property(nonatomic, copy) NSString *banner;
@property(nonatomic, copy) NSString *from;
@property(nonatomic, copy) NSString *cnum;
@property(nonatomic, copy) NSString *viewnum;
@property(nonatomic, assign) BOOL big;
@property(nonatomic, copy) NSString *ctime;

@end

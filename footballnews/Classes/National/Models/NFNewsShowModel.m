//
//  NFNewsShowModel.m
//  footballnews
//
//  Created by jason.cao on 2018/5/29.
//  Copyright © 2018年 niefan. All rights reserved.
//

#import "NFNewsShowModel.h"

@implementation NFNewsShowModel

- (void)setCtime:(NSString *)ctime{
    if (_ctime != ctime) {
        _ctime = ctime;
    }
    NSString *time = [NSDate compareCurrentTime:ctime];
    _ctime = time;
}

@end

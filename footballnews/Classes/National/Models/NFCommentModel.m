//
//  NFCommentModel.m
//  footballnews
//
//  Created by jason.cao on 2018/5/28.
//  Copyright © 2018年 niefan. All rights reserved.
//

#import "NFCommentModel.h"

@implementation NFCommentModel
- (void)setContent:(NSString *)content{
    if (_content != content) {
        _content = content;
    }
    _contentHeight = [NFCommentTool text:_content getHightWithWidth:kScreenWidth - 40 - 20 fontsize:14 textColor: [UIColor colorWithHexString:@"#333333"]];
    
}

- (void)setTime:(NSString *)time{
    if (_time != time) {
        _time = time;
    }
    _timeFormate = [NSDate compareCurrentTime:_time];
    
}

@end

//
//  NFVideoViewCell.h
//  footballnews
//
//  Created by jason.cao on 2018/5/28.
//  Copyright © 2018年 niefan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NFVideoModel.h"
@class XLVideoPlayer,NFVideoViewCell;


@protocol NFVideoViewCellDelegate <NSObject>

- (void)videoViewCell:(NFVideoViewCell *)videoViewCell playVideo:(NFVideoModel *)model;

@end

@interface NFVideoViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *postImageView;
@property (nonatomic, strong) NFVideoModel *model;
@property (nonatomic, strong) XLVideoPlayer *player;
@property (nonatomic, assign) id<NFVideoViewCellDelegate> delegate;
@end

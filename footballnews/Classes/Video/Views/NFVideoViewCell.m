//
//  NFVideoViewCell.m
//  footballnews
//
//  Created by jason.cao on 2018/5/28.
//  Copyright © 2018年 niefan. All rights reserved.
//

#import "NFVideoViewCell.h"
#import "XLVideoPlayer.h"

@interface NFVideoViewCell ()
@property (weak, nonatomic) IBOutlet UILabel *videoTitle;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;

@property (weak, nonatomic) IBOutlet UIButton *collectionBtn;

@end
@implementation NFVideoViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (IBAction)collectClick:(UIButton *)sender {
    if (sender.selected) {
        _model.collection = @"0";
    }else{
        _model.collection = @"1";
    }
    sender.selected = !sender.selected;
}
- (IBAction)playClick:(UIButton *)sender {
//    [self showVideoPlayer];
    if ([self.delegate respondsToSelector:@selector(videoViewCell:playVideo:)]) {
        [self.delegate performSelector:@selector(videoViewCell:playVideo:) withObject:self withObject:_model];
    }
}


- (void)showVideoPlayer{
    [_player destroyPlayer];
    _player = nil;
    _player = [[XLVideoPlayer alloc] init];
    _player.videoUrl = _model.mp4_url;
    _player.frame = self.postImageView.frame;
    [self.contentView addSubview:_player];
    _player.completedPlayingBlock = ^(XLVideoPlayer *player) {
        [player destroyPlayer];
        _player = nil;
    };
}




- (void)setModel:(NFVideoModel *)model{
    if (_model != model) {
        _model = model;
    }
    _videoTitle.text = _model.title;
    [_postImageView sd_setImageWithURL:[NSURL URLWithString:_model.cover] placeholderImage:nil options:SDWebImageRetryFailed];
    if ([_model.collection boolValue]) {
        _collectionBtn.selected = YES;
    }else{
        _collectionBtn.selected = NO;
    }
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

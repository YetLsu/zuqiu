//
//  NFBaseTableViewCell.m
//  footballnews
//
//  Created by jason.cao on 2018/5/25.
//  Copyright © 2018年 niefan. All rights reserved.
//

#import "NFBaseTableViewCell.h"
@interface NFBaseTableViewCell()
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
//@property (weak, nonatomic) IBOutlet UILabel *subTitleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *postImageView;
@property (weak, nonatomic) IBOutlet UILabel *fromLabel;

@end

@implementation NFBaseTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setModel:(NFNewsShowModel *)model{
    if (_model != model) {
        _model = model;
    }
    _titleLabel.text = _model.title;
    [_postImageView sd_setImageWithURL:[NSURL URLWithString:_model.banner] placeholderImage:nil options:SDWebImageRetryFailed];
    _fromLabel.text = _model.from;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

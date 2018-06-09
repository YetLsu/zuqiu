//
//  NFDetailCommentCell.m
//  footballnews
//
//  Created by jason.cao on 2018/5/28.
//  Copyright © 2018年 niefan. All rights reserved.
//

#import "NFDetailCommentCell.h"
#import "NFCommentModel.h"

@interface NFDetailCommentCell()
@property(nonatomic, strong) UIImageView *iconImageView;
@property(nonatomic, strong) UILabel *nameLabel;
@property(nonatomic, strong) UILabel *timeLabel;
@property(nonatomic, strong) UILabel *contentLabel;
@end


@implementation NFDetailCommentCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupContent];
    }
    return self;
}

- (void)setupContent{
    _iconImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 40, 40)];
    
    [self.contentView addSubview:_iconImageView];
    
    _nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(_iconImageView.right + 10, _iconImageView.centerY - 10, 100, 20)];
    _nameLabel.textColor = [UIColor colorWithHexString:@"#333333"];
    _nameLabel.font = [UIFont systemFontOfSize:17];
    [self.contentView addSubview:_nameLabel];
    
    _timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(kScreenWidth - 100 - 10, _nameLabel.y, 100, 20)];
    _timeLabel.textColor = [UIColor colorWithHexString:@"#999999"];
    _timeLabel.font = [UIFont systemFontOfSize:13];
    _timeLabel.textAlignment = NSTextAlignmentRight;
    [self.contentView addSubview:_timeLabel];
    
    
    //缺height
    _contentLabel = [[UILabel alloc] initWithFrame:CGRectMake(_nameLabel.x, _iconImageView.bottom, kScreenWidth - 20 - 40, 0)];
    _contentLabel.textColor = [UIColor colorWithHexString:@"#333333"];
    _contentLabel.font = [UIFont systemFontOfSize:14];
    _contentLabel.numberOfLines = 0;
    [self.contentView addSubview:_contentLabel];
    
}

- (void)setModel:(NFCommentModel *)model{
    if (_model != model) {
        _model = model;
    }
    _iconImageView.image = [UIImage imageNamed:_model.icon];
    _nameLabel.text = _model.name;
    _timeLabel.text = _model.timeFormate;
    _contentLabel.text = _model.content;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    _contentLabel.height = _model.contentHeight;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    
}

@end

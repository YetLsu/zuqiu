//
//  NFCollectionCell.m
//  footballnews
//
//  Created by jason.cao on 2018/5/29.
//  Copyright © 2018年 niefan. All rights reserved.
//

#import "NFCollectionCell.h"

@interface NFCollectionCell ()
@property (weak, nonatomic) IBOutlet UIImageView *postImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;

@end
@implementation NFCollectionCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

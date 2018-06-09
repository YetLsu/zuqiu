//
//  NFBaseTableViewCell.h
//  footballnews
//
//  Created by jason.cao on 2018/5/25.
//  Copyright © 2018年 niefan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NFNewsShowModel.h"

@interface NFBaseTableViewCell : UITableViewCell
@property (nonatomic, strong) NFNewsShowModel *model;
@end

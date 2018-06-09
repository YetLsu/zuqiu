//
//  NFBaseTableViewController.h
//  footballnews
//
//  Created by jason.cao on 2018/5/25.
//  Copyright © 2018年 niefan. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    CompetitionTypeNewnational = 0,
    CompetitionTypeEngland,
    CompetitionTypeWest,
    CompetitionTypeGerman,
    CompetitionTypeItalian,
    
    CompetitionTypeNewlocal,
    CompetitionTypeSuperLeague,
    CompetitionTypeChinaFootball,
    CompetitionTypeWomenFootball,
    CompetitionTypeChinaJia
} CompetitionType;

@interface NFBaseTableViewController : UITableViewController
//@property (nonatomic, assign) CompetitionType type;
@property (nonatomic, assign) NSString *type;
@end

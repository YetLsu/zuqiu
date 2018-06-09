//
//  NFProfileViewController.h
//  footballnews
//
//  Created by jason.cao on 2018/5/25.
//  Copyright © 2018年 niefan. All rights reserved.
//

#import "BaseViewController.h"

@interface NFProfileViewController : BaseViewController
@property (nonatomic, copy) NSString *userName;
@property (nonatomic, strong) UIImage *userImage;
- (void)refresh;
@end

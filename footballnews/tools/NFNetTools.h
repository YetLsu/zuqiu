//
//  NFNetTools.h
//  footballnews
//
//  Created by jason.cao on 2018/5/11.
//  Copyright © 2018年 niefan. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AFNetworking.h"

typedef void(^NetBlock)(NSString *result, NSDictionary *data);

@interface NFNetTools : NSObject

//@property (nonatomic, assign) NetBlock netBlock;

+ (void)get:(NSString *)url parameters:(NSDictionary *)parameters netBlock:(NetBlock)netBlock;


@end

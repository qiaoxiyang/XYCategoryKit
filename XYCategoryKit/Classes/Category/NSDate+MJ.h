//
//  NSDate+MJ.h
//  团购
//
//  Created by app32 on 15/7/30.
//  Copyright (c) 2015年 sk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (MJ)
+ (NSDateComponents *)compareFrom:(NSDate *)from to:(NSDate *)to;

- (NSDateComponents *)mj_compare:(NSDate *)other;
@end

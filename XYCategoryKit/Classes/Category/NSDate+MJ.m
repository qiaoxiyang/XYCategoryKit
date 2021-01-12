//
//  NSDate+MJ.m
//  团购
//
//  Created by app32 on 15/7/30.
//  Copyright (c) 2015年 sk. All rights reserved.
//

#import "NSDate+MJ.h"

@implementation NSDate (MJ)

+ (NSDateComponents *)compareFrom:(NSDate *)from to:(NSDate *)to
{
    // 1.日历对象（标识：时区相关的标识）
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    
    // 2.合并标记
    NSUInteger flags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    
    // 3.比较
    return [calendar components:flags fromDate:from toDate:to options:0];
}

- (NSDateComponents *)mj_compare:(NSDate *)other
{
    return [NSDate compareFrom:self to:other];
}

@end

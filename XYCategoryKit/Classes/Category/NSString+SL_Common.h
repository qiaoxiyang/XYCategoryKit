//
//  NSString+SL_Common.h
//  nongjibang
//
//  Created by ShuangLong@nongji360 on 15-7-16.
//  Copyright (c) 2015年 SL. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSString (SL_Common)
- (NSString*) sha1;
/**
    判断字符串是否为空
 */
+(BOOL)isBlankString:(NSString *)string;

/// 若为空，则替换为空字符串
/// @param string string
+(NSString *)replaceEmptyString:(NSString *)string;

/**
 判断字符串是否为空,如果为空,则用B代替
 */
+(NSString * )isBlankString:(NSString*)A insteadOfB:(NSString*)B;

/**
 *  给定宽度计算字符串所占高度
 */
- (CGFloat)gf_CalculateStringHeightWithWidth:(CGFloat)Width FontSize:(CGFloat)fontSize;


/**
 *  给定高度计算字符串所占宽度
 */
- (CGFloat)gf_CalculateStringWidthWithHeight:(CGFloat)height;
-(NSString*)updateTimer;
@end

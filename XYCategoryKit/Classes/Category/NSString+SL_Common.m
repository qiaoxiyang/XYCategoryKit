//
//  NSString+SL_Common.m
//  nongjibang
//
//  Created by ShuangLong@nongji360 on 15-7-16.
//  Copyright (c) 2015年 SL. All rights reserved.
//

#import "NSString+SL_Common.h"
#import <CommonCrypto/CommonDigest.h>
#import "NSDate+MJ.h"
@implementation NSString (SL_Common)

/**
 @*判断字符串是否为空
 **/
+ (BOOL)isBlankString:(NSString *)string {
    if (string == nil || string == NULL) {
        return YES;
    }
    if ([string isKindOfClass:[NSNull class]]) {
        return YES;
    }
    if ([[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length]==0) {
        return YES;
    }
    return NO;
}

+(NSString *)replaceEmptyString:(NSString *)string{
    return [self isBlankString:string insteadOfB:@""];
}
/**
 @*  如果A为空,则用B替代
 **/

+(NSString * )isBlankString:(NSString*)A insteadOfB:(NSString*)B{
    if ([self isBlankString:A]||[A rangeOfString:@"null"].location != NSNotFound) {
        return B;
    }
    
    else{
        return A;
    }
}
- (CGFloat)gf_CalculateStringWidthWithHeight:(CGFloat)height {
    
    NSDictionary *nameDict = @{NSFontAttributeName: [UIFont systemFontOfSize:height+1]};
    CGRect nameFrame = [self boundingRectWithSize:CGSizeMake(MAXFLOAT, height) options:NSStringDrawingUsesLineFragmentOrigin attributes:nameDict context:nil];
    CGSize size = nameFrame.size;
    return size.width;

}
- (CGFloat)gf_CalculateStringHeightWithWidth:(CGFloat)Width FontSize:(CGFloat)fontSize{
    CGSize   sizeC ;
    sizeC = CGSizeMake(Width ,MAXFLOAT);
    
    CGSize   sizeFileName = [self boundingRectWithSize:sizeC
                                               options:NSStringDrawingUsesLineFragmentOrigin
                                            attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:fontSize]}
                                               context:nil].size;
    
    return sizeFileName.height;

}

- (NSString*) sha1 {
    const char *cstr = [self cStringUsingEncoding:NSUTF8StringEncoding];
    
    NSData *data = [NSData dataWithBytes:cstr length:self.length];
    //使用对应的CC_SHA1,CC_SHA256,CC_SHA384,CC_SHA512的长度分别是20,32,48,64
    uint8_t digest[CC_SHA1_DIGEST_LENGTH];
    //使用对应的CC_SHA256,CC_SHA384,CC_SHA512
    CC_SHA1(data.bytes, data.length, digest);
    
    NSMutableString* output = [NSMutableString stringWithCapacity:CC_SHA1_DIGEST_LENGTH * 2];
    
    for(int i = 0; i < CC_SHA1_DIGEST_LENGTH; i++)
        [output appendFormat:@"%02x", digest[i]];
    
    return output;
}
-(NSString *)timeStampToString:(NSString *)formatter{
    NSString *str = @"yyyy-MM-dd HH:mm:ss";
    if (formatter != nil) {
        str = formatter;
    }
    NSTimeInterval timeInterval = self.doubleValue;
    
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:timeInterval];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = str;
    
    return [dateFormatter stringFromDate:date];
}

-(NSString*)updateTimer{
    
    NSString * string = [NSString string];
    
    //比对时间
    //    NSDateFormatter *dateFormatter =[[NSDateFormatter alloc]init];
    //    dateFormatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    
    NSDate *nowDate = [[NSDate alloc] init];
    
    NSDate *oldDate = [NSDate dateWithTimeIntervalSince1970:[self integerValue]];
    
    NSDateComponents *cmps = [oldDate mj_compare:nowDate];
    
    if (cmps.day>=1) {
        
        string =[self timeStampToString:@"yyyy-MM-dd"];
    }else if (cmps.hour >= 1 && cmps.day < 1){
        string =[NSString stringWithFormat:@"%ld小时之前",(long)cmps.hour];
    }else if (cmps.minute >= 1 && cmps.hour < 1){
        string = [NSString stringWithFormat:@"%ld分钟之前",(long)cmps.minute];
        
    }else{
        string = @"刚刚";
    }
    return string;
}
@end

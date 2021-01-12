
//
//  NSString+RegularExpression.m
//  testRegular
//
//  Created by xiyang on 2017/2/20.
//  Copyright © 2017年 xiyang. All rights reserved.
//

#import "NSString+RegularExpression.h"

//电话号码正则
static NSString *telephoneRegular = @"^1[0-9]{10}";

//数字正则
static NSString *numberRegular = @"^[1-9]\\d*|0$";

//身份证号正则
static NSString *idCardRegular = @"^[1-9]\\d{5}[1-9]\\d{3}((0\\d)|(1[0-2]))(([0|1|2]\\d)|3[0-1])\\d{3}([0-9]|X)$";

//中文正则
static NSString *chineseRegular = @"[\u4e00-\u9fa5]+";

//英文正则
static NSString *englishRegular = @"[a-zA-Z]*";

//数字或英文正则
static NSString *numEnRegular = @"[a-zA-Z0-9]*";

//密码正则 6～20位
static NSString *passWordRegular = @"^(?=.*[a-zA-Z0-9].*)(?=.*[a-zA-Z\\W].*)(?=.*[0-9\\W].*).{6,20}$";

//邮政编码正则
static NSString *postalRegular = @"^[0-8]\\\\d{5}(?!\\\\d)$";

//URL正则
static NSString *urlRegular = @"http(s)?:\\/\\/([\\w-]+\\.)+[\\w-]+(\\/[\\w- .\\/?%&=]*)?";

//Email正则
static NSString *emailRegular = @"[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+\\.[a-zA-Z]{2,4}";



@implementation NSString (RegularExpression)

#pragma mark - Public
/**
 手机电话号码正则表达式
 
 */
-(BOOL)xy_regularTelephone{
    
    return [self regularExpression:telephoneRegular];
}

/**
 @*  数字正则表达式
 **/
-(BOOL)xy_regularNumber{
    
    return [self regularExpression:numberRegular];
}

/**
 @*  身份证号正则表达式
 **/
-(BOOL)xy_regularIDCard{
    
    return [self regularExpression:idCardRegular];
}

/**
 @*中文正则表达式
 */
-(BOOL)xy_regularChinese{
    
    return [self regularExpression:chineseRegular];
}

/**
 @*  英文正则表达式
 **/
-(BOOL)xy_regularEnglish{
    
    return [self regularExpression:englishRegular];
}

/**
 @*  数字或英文正则表达式
 **/
-(BOOL)xy_regularNumberAndEn{
    
    return [self regularExpression:numEnRegular];
}

/**
 @*  6～20位密码正则表达式
 **/
-(BOOL)xy_regularPassWord{
    
    return [self regularExpression:passWordRegular];
}

/**
 @*  邮政编码正则表达式
 **/
-(BOOL)xy_regularPostal{
    return [self regularExpression:postalRegular];
}

/**
 @*  URL正则表达式
 **/
-(BOOL)xy_regularURL{
    
    return [self regularExpression:urlRegular];
}

/**
 @*  Email表达式
 **/
-(BOOL)xy_regularEmail{
    return [self regularExpression:emailRegular];
}

/** 银行卡号有效性问题Luhn算法
 *  现行 16 位银联卡现行卡号开头 6 位是 622126～622925 之间的，7 到 15 位是银行自定义的，
 *  可能是发卡分行，发卡网点，发卡序号，第 16 位是校验码。
 *  16 位卡号校验位采用 Luhm 校验方法计算：
 *  1，将未带校验位的 15 位卡号从右依次编号 1 到 15，位于奇数位号上的数字乘以 2
 *  2，将奇位乘积的个十位全部相加，再加上所有偶数位上的数字
 *  3，将加法和加上校验位能被 10 整除。
 */
- (BOOL)xy_bankCardluhmCheck{
    NSString * lastNum = [[self substringFromIndex:(self.length-1)] copy];//取出最后一位
    NSString * forwardNum = [[self substringToIndex:(self.length -1)] copy];//前15或18位
    
    NSMutableArray * forwardArr = [[NSMutableArray alloc] initWithCapacity:0];
    for (int i=0; i<forwardNum.length; i++) {
        NSString * subStr = [forwardNum substringWithRange:NSMakeRange(i, 1)];
        [forwardArr addObject:subStr];
    }
    
    NSMutableArray * forwardDescArr = [[NSMutableArray alloc] initWithCapacity:0];
    for (int i = (int)(forwardArr.count-1); i> -1; i--) {//前15位或者前18位倒序存进数组
        [forwardDescArr addObject:forwardArr[i]];
    }
    
    NSMutableArray * arrOddNum = [[NSMutableArray alloc] initWithCapacity:0];//奇数位*2的积 < 9
    NSMutableArray * arrOddNum2 = [[NSMutableArray alloc] initWithCapacity:0];//奇数位*2的积 > 9
    NSMutableArray * arrEvenNum = [[NSMutableArray alloc] initWithCapacity:0];//偶数位数组
    
    for (int i=0; i< forwardDescArr.count; i++) {
        NSInteger num = [forwardDescArr[i] intValue];
        if (i%2) {//偶数位
            [arrEvenNum addObject:[NSNumber numberWithInteger:num]];
        }else{//奇数位
            if (num * 2 < 9) {
                [arrOddNum addObject:[NSNumber numberWithInteger:num * 2]];
            }else{
                NSInteger decadeNum = (num * 2) / 10;
                NSInteger unitNum = (num * 2) % 10;
                [arrOddNum2 addObject:[NSNumber numberWithInteger:unitNum]];
                [arrOddNum2 addObject:[NSNumber numberWithInteger:decadeNum]];
            }
        }
    }
    
    __block  NSInteger sumOddNumTotal = 0;
    [arrOddNum enumerateObjectsUsingBlock:^(NSNumber * obj, NSUInteger idx, BOOL *stop) {
        sumOddNumTotal += [obj integerValue];
    }];
    
    __block NSInteger sumOddNum2Total = 0;
    [arrOddNum2 enumerateObjectsUsingBlock:^(NSNumber * obj, NSUInteger idx, BOOL *stop) {
        sumOddNum2Total += [obj integerValue];
    }];
    
    __block NSInteger sumEvenNumTotal =0 ;
    [arrEvenNum enumerateObjectsUsingBlock:^(NSNumber * obj, NSUInteger idx, BOOL *stop) {
        sumEvenNumTotal += [obj integerValue];
    }];
    
    NSInteger lastNumber = [lastNum integerValue];
    
    NSInteger luhmTotal = lastNumber + sumEvenNumTotal + sumOddNum2Total + sumOddNumTotal;
    
    return (luhmTotal%10 ==0)?YES:NO;
}

-(NSString *)encodePhone {
    if (self.length>7) {
        NSString *xing = [NSMutableString string];
        for (int i = 0; i < self.length-7; i++) {
            xing = [xing stringByAppendingString:@"*"];
        }
        NSString *encryption = [self stringByReplacingCharactersInRange:NSMakeRange(3, self.length-7) withString:xing];
        return encryption;
    }else {
        return self;
    }
}

#pragma mark - Private
-(BOOL)regularExpression:(NSString *)predicateStr{
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", predicateStr];
    return [predicate evaluateWithObject:self];
}


@end

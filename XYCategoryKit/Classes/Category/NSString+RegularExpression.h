//
//  NSString+RegularExpression.h
//  testRegular
//
//  Created by xiyang on 2017/2/20.
//  Copyright © 2017年 xiyang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (RegularExpression)


/**
 @*手机电话号码正则表达式
 */
-(BOOL)xy_regularTelephone;


/**
 @*  数字正则表达式
 **/
-(BOOL)xy_regularNumber;

/**
 @*  身份证号正则表达式
 **/
-(BOOL)xy_regularIDCard;


/**
 @*中文正则表达式
 */
-(BOOL)xy_regularChinese;

/**
 @*  英文正则表达式
 **/
-(BOOL)xy_regularEnglish;

/**
 @*  数字或英文正则表达式
 **/
-(BOOL)xy_regularNumberAndEn;

/**
 @*  6～20位密码正则表达式
 **/
- (BOOL)xy_regularPassWord;

/**
 @*  邮政编码正则表达式
 **/
-(BOOL)xy_regularPostal;

/**
 @*  URL正则表达式
 **/
-(BOOL)xy_regularURL;
/**
 @*  Email表达式
 **/
-(BOOL)xy_regularEmail;
/**
 @*  银行卡正则表达式
 **/
-(BOOL)xy_bankCardluhmCheck;

/**
 加密电话
 
 @return 加密后的电话
 */
-(NSString *)encodePhone;

@end

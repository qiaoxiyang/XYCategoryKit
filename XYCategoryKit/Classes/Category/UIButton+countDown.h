//
//  UIButton+countDown.h
//  倒计时Button
//
//  Created by xiyang on 16/3/18.
//  Copyright © 2016年 xiyang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (countDown)

/**
 *  倒计时按钮
 *
 *  @param timeline 倒计时总时间
 *  @param title    还没倒计时的title
 *  @param subTitle 倒计时中的子名字 如时、分
 *  @param mColor   还没倒计时的颜色
 *  @param color    倒计时中的颜色
 */
-(void)startWithTime:(NSInteger)timeline title:(NSString *)title countDownTitle:(NSString *)subTitle mainColor:(UIColor *)mColor countColor:(UIColor *)color;

-(void)xy_startWithTime:(NSInteger)timeline title:(NSString *)title countDownTitle:(NSString *)subTitle mainTitleColor:(UIColor *)mColor countTitleColor:(UIColor *)color;
@property (nonatomic) dispatch_source_t mtimer;
@end

//
//  UIButton+countDown.m
//  倒计时Button
//
//  Created by xiyang on 16/3/18.
//  Copyright © 2016年 xiyang. All rights reserved.
//

#import "UIButton+countDown.h"
#import <objc/runtime.h>
@implementation UIButton (countDown)


-(void)startWithTime:(NSInteger)timeline title:(NSString *)title countDownTitle:(NSString *)subTitle mainColor:(UIColor *)mColor countColor:(UIColor *)color{
    
    __weak typeof(self) weakSelf = self;
    //倒计时时间
    __block NSInteger timeOut = timeline;
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    self.mtimer = timer;
    //每秒执行一次
    dispatch_source_set_timer(timer, dispatch_walltime(NULL, 0), 1.0 * NSEC_PER_SEC, 0 * NSEC_PER_SEC);
    dispatch_source_set_event_handler(timer, ^{
        //倒计时结束，关闭
        if (timeOut <=0) {
            
            dispatch_source_cancel(timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                
                //                weakSelf.backgroundColor =mColor;
                [weakSelf setTitle:title forState:UIControlStateNormal];
                [weakSelf setTitleColor:mColor forState:UIControlStateNormal];
                weakSelf.userInteractionEnabled = YES;
                
            });
        }else{
            
            int allTime = (int)timeline +1;
            
            int seconds = timeOut % allTime;
            
            NSString *timeStr = [NSString stringWithFormat:@"%.2d",seconds];
            
            dispatch_async(dispatch_get_main_queue(), ^{
                //                weakSelf.backgroundColor = color;
                [weakSelf setTitleColor:color forState:UIControlStateNormal];
                [weakSelf setTitle:[NSString stringWithFormat:@"%@%@",timeStr,subTitle] forState:UIControlStateNormal];
                weakSelf.userInteractionEnabled = NO;
            });
            timeOut--;
        }
    });
    dispatch_resume(timer);
    
}


-(void)xy_startWithTime:(NSInteger)timeline title:(NSString *)title countDownTitle:(NSString *)subTitle mainTitleColor:(UIColor *)mColor countTitleColor:(UIColor *)color{
    
    __weak typeof(self) weakSelf = self;
    //倒计时时间
    __block NSInteger timeOut = timeline;
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    self.mtimer = timer;
    //每秒执行一次
    dispatch_source_set_timer(timer, dispatch_walltime(NULL, 0), 1.0 * NSEC_PER_SEC, 0 * NSEC_PER_SEC);
    dispatch_source_set_event_handler(timer, ^{
        //倒计时结束，关闭
        if (timeOut <=0) {
            
            dispatch_source_cancel(timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                
                //                weakSelf.backgroundColor =mColor;
                [weakSelf setTitle:title forState:UIControlStateNormal];
                [weakSelf setTitleColor:mColor forState:UIControlStateNormal];
                weakSelf.userInteractionEnabled = YES;
                
            });
        }else{
            
            int allTime = (int)timeline +1;
            
            int seconds = timeOut % allTime;
            
            NSString *timeStr = [NSString stringWithFormat:@"%.2d",seconds];
            
            dispatch_async(dispatch_get_main_queue(), ^{
                //                weakSelf.backgroundColor = color;
                [weakSelf setTitleColor:color forState:UIControlStateNormal];
                [weakSelf setTitle:[NSString stringWithFormat:@"%@%@",timeStr,subTitle] forState:UIControlStateNormal];
                weakSelf.userInteractionEnabled = NO;
            });
            timeOut--;
        }
    });
    dispatch_resume(timer);
    
}

-(void)setMtimer:(dispatch_source_t)mtimer{
    objc_setAssociatedObject(self, "mtimer", mtimer, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(dispatch_source_t)mtimer{
    return objc_getAssociatedObject(self, "mtimer");
}


@end

//
//  UIImageView+RoundCorner.h
//  Subsidy_Unification
//
//  Created by qiaoxy on 2020/8/3.
//  Copyright © 2020 gaof. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImageView (RoundCorner)
-(void)xy_setImageWithURL:(NSString *)urlStr placeholderImage:(UIImage *)placeholdImage radius:(CGFloat)radius;
@end

NS_ASSUME_NONNULL_END

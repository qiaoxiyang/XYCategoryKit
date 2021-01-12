//
//  UIImage+ChangeColor.h
//  QuerySubsidy
//
//  Created by gaof on 2017/3/15.
//  Copyright © 2017年 xiyang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (ChangeColor)
- (UIImage *)xy_imageWithColor:(UIColor *)color;


+(UIImage *)xy_imageWithColor:(UIColor *)color size:(CGSize)size;

/// 给静态图片添加圆角
/// @param radius 圆角
/// @param newSize 图片大小
- (UIImage *)xy_clippedCornerRadius:(CGFloat)radius size:(CGSize)newSize;
@end

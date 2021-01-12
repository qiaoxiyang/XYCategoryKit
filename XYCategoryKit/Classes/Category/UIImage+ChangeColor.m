//
//  UIImage+ChangeColor.m
//  QuerySubsidy
//
//  Created by gaof on 2017/3/15.
//  Copyright © 2017年 xiyang. All rights reserved.
//

#import "UIImage+ChangeColor.h"
#import "UIColor+expanded.h"
@implementation UIImage (ChangeColor)
//改变图片颜色
- (UIImage *)xy_imageWithColor:(UIColor *)color{
    UIGraphicsBeginImageContextWithOptions(self.size, NO, self.scale);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextTranslateCTM(context, 0, self.size.height);
    CGContextScaleCTM(context, 1.0, -1.0);
    CGContextSetBlendMode(context, kCGBlendModeNormal);
    CGRect rect = CGRectMake(0, 0, self.size.width, self.size.height);
    CGContextClipToMask(context, rect, self.CGImage);
    [color setFill];
    CGContextFillRect(context, rect);
    UIImage*newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

+(UIImage *)xy_imageWithColor:(UIColor *)color size:(CGSize)size{
    UIGraphicsBeginImageContext(size);
    [color set];
    UIRectFill(CGRectMake(0, 0, size.width, size.height));
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}


- (UIImage *)xy_clippedCornerRadius:(CGFloat)radius size:(CGSize)newSize
{
     // 先将图片裁剪为目标比例 不拉伸压缩
       UIImage *originImage = [self xy_scaleImage:newSize];
       
       // 开始裁切圆角
       CGRect bounds = CGRectMake(0, 0, newSize.width, newSize.height);
       UIGraphicsBeginImageContextWithOptions(newSize, NO, UIScreen.mainScreen.scale);
       CGContextRef context = UIGraphicsGetCurrentContext();
       UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:bounds
                                                       cornerRadius:radius];
       CGContextAddPath(context, path.CGPath);
       CGContextClip(context);
       [originImage drawInRect:bounds];
       UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
       UIGraphicsEndImageContext();
       return image;
}


- (UIImage *)xy_scaleImage:(CGSize)newSize
{
    CGFloat width = self.size.width;
    CGFloat height = self.size.height;
    
    CGFloat scale = newSize.width / newSize.height;
    CGFloat imageScale = width / height;
    
    if (imageScale > scale) {
        // 以高为准
        width = height * scale;
    } else if (imageScale < scale) {
        // 以宽为准
        height = width / scale;
    } else {
        // 正常比例
    }
    
    // 中心放大
    CGRect frame = CGRectMake((self.size.width - width) * 0.5, (self.size.height - height) * 0.5, width, height);
    
    CGImageRef imageRef = [self CGImage];
    imageRef = CGImageCreateWithImageInRect(imageRef, frame);
    UIImage *image = [UIImage imageWithCGImage:imageRef];
    CGImageRelease(imageRef);
    
    return image;
}



@end

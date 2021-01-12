//
//  UIImageView+RoundCorner.m
//  Subsidy_Unification
//
//  Created by qiaoxy on 2020/8/3.
//  Copyright © 2020 gaof. All rights reserved.
//

#import "UIImageView+RoundCorner.h"
#import <SDWebImage/SDWebImage.h>
#import "UIImage+ChangeColor.h"
@implementation UIImageView (RoundCorner)
-(void)xy_setImageWithURL:(NSString *)urlStr placeholderImage:(UIImage *)placeholdImage radius:(CGFloat)radius {
    
    NSURL *url = [NSURL URLWithString:urlStr];

    if (radius != 0.0) {
        //头像需要手动缓存处理成圆角的图片
        NSString *cacheurlStr = [urlStr stringByAppendingString:@"radiusCache"];
        UIImage *cacheImage = [[SDImageCache sharedImageCache] imageFromDiskCacheForKey:cacheurlStr];
        if (cacheImage) {
            self.image = cacheImage;
        }
        else {
            [self sd_setImageWithURL:url placeholderImage:placeholdImage completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
                if (!error) {
                    UIImage *radiusImage = [self.image xy_clippedCornerRadius:radius size:self.frame.size];
                    self.image = radiusImage;
                    [[SDImageCache sharedImageCache] storeImage:radiusImage forKey:cacheurlStr completion:nil];
                    //清除原有非圆角图片缓存
                    [[SDImageCache sharedImageCache] removeImageForKey:urlStr withCompletion:nil];
                }
            }];
        }
    }
    else {
        [self sd_setImageWithURL:url placeholderImage:placeholdImage completed:nil];
    }
    
}
@end

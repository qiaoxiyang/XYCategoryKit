//
//  NSString+Extension.h
//  QRApply_Example
//
//  Created by gaof on 2018/11/1.
//  Copyright © 2018 gaof. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (Extension)
-(NSString *)gf_convertDateStringfromFormat:(NSString *)formFormat toFormat:(NSString *)toFormat;
-(NSString *)gf_encryptionPhone;
-(NSString *)gf_encryptionID;

/// 转变成有星星符号
-(NSAttributedString *)convertToStarTitle;
@end

NS_ASSUME_NONNULL_END

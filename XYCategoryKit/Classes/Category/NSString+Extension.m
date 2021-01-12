//
//  NSString+Extension.m
//  QRApply_Example
//
//  Created by gaof on 2018/11/1.
//  Copyright © 2018 gaof. All rights reserved.
//

#import "NSString+Extension.h"

@implementation NSString (Extension)
-(NSString *)gf_encryptionPhone {
    if (self.length>6) {
        NSString *xing = [NSMutableString string];
        for (int i = 0; i < self.length-6; i++) {
            xing = [xing stringByAppendingString:@"*"];
        }
        NSString *encryption = [self stringByReplacingCharactersInRange:NSMakeRange(3, self.length-6) withString:xing];
        return encryption;
    }else {
        return self;
    }
}
-(NSString *)gf_encryptionID {
    if (self.length == 18) {
        NSMutableString *xing = [NSMutableString stringWithString:self];
        return [xing stringByReplacingCharactersInRange:NSMakeRange(2, 14) withString:@"****************"];
    }else {
        return self;
    }
}
-(NSString *)gf_convertDateStringfromFormat:(NSString *)formFormat toFormat:(NSString *)toFormat {
    NSDateFormatter *fromFormatter = [[NSDateFormatter alloc] init];
    fromFormatter.dateFormat = formFormat;
    NSDate *date = [fromFormatter dateFromString:self];
    fromFormatter.dateFormat = toFormat;
    return [fromFormatter stringFromDate:date];
}

-(NSAttributedString *)convertToStarTitle{
    if (self.length==0) {
        return [[NSAttributedString alloc] initWithString:self];
    }
    
    NSMutableAttributedString *attTitle = [[NSMutableAttributedString alloc] initWithString:self];
    if ([[attTitle attributedSubstringFromRange:NSMakeRange(0, 1)] isEqualToAttributedString:[[NSAttributedString alloc] initWithString:@"*"]]){//有*
        [attTitle addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(0, 1)];
    }else{//无*
        NSAttributedString *attStr = [[NSAttributedString alloc] initWithString:@"*"];
        [attTitle insertAttributedString:attStr atIndex:0];
        [attTitle addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(0, 1)];
        
    }
    return attTitle;
}
@end

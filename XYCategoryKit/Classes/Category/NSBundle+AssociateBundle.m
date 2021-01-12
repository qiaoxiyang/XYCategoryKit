//
//  NSBundle+AssociateBundle.m
//  AFNetworking
//
//  Created by qiaoxy on 2020/6/30.
//

#import "NSBundle+AssociateBundle.h"

@implementation NSBundle (AssociatedBundle)
/**
 获取文件所在name，默认情况下podName和bundlename相同，传一个即可
 
 @param bundleName bundle名字，就是在resource_bundles里面的名字
 @param podName pod的名字
 @return bundle
 */
+ (NSBundle *)bundleWithBundleName:(NSString *)bundleName podName:(NSString *_Nullable)podName{
    if (bundleName == nil && podName == nil) {
        @throw @"bundleName和podName不能同时为空";
    }else if (bundleName == nil ) {
        bundleName = podName;
    }else if (podName == nil) {
        podName = bundleName;
    }
    
    if ([bundleName containsString:@".bundle"]) {
        bundleName = [bundleName componentsSeparatedByString:@".bundle"].firstObject;
    }
    //没使用framwork的情况下
    NSURL *associateBundleURL = [[NSBundle mainBundle] URLForResource:bundleName withExtension:@"bundle"];
    //使用framework形式
    if (!associateBundleURL) {
        associateBundleURL = [[NSBundle mainBundle] URLForResource:@"Frameworks" withExtension:nil];
        associateBundleURL = [associateBundleURL URLByAppendingPathComponent:podName];
        associateBundleURL = [associateBundleURL URLByAppendingPathExtension:@"framework"];
        NSBundle *associateBunle = [NSBundle bundleWithURL:associateBundleURL];
        associateBundleURL = [associateBunle URLForResource:bundleName withExtension:@"bundle"];
    }
#if DEBUG
    NSAssert(associateBundleURL, @"取不到关联bundle");
#endif
    //生产环境直接返回空
    return associateBundleURL?[NSBundle bundleWithURL:associateBundleURL]:nil;
}

+ (NSBundle *)xy_nongjiCommonImageBundle {
    NSBundle *vendorBundle = [self bundleWithBundleName:@"XYSubsidyVendor" podName:@"XYSubsidyVendor"];
    NSBundle *bundle = vendorBundle;
    NSURL *url = [vendorBundle URLForResource:@"Nongjibang" withExtension:@"bundle"];
    bundle = [NSBundle bundleWithURL:url];
    return bundle;
}
@end

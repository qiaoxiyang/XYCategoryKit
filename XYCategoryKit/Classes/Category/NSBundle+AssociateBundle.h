//
//  NSBundle+AssociateBundle.h
//  AFNetworking
//
//  Created by qiaoxy on 2020/6/30.
//


#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@interface NSBundle (AssociateBundle)
/// 获取文件所在name，默认情况下podName和bundlename相同，传一个即可
/// @param bundleName bundle名字，就是在resource_bundles里面的名字
/// @param podName pod的名字
+ (NSBundle *)bundleWithBundleName:(NSString *)bundleName podName:(NSString *_Nullable)podName;


/// 获取nongjiCommon的bundle
+ (NSBundle *)xy_nongjiCommonImageBundle;
@end

NS_ASSUME_NONNULL_END

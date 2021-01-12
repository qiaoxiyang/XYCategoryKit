//
//  UIViewController+ResetBack.m
//  QuerySubsidy
//
//  Created by gaof on 2017/5/2.
//  Copyright © 2017年 xiyang. All rights reserved.
//

#import "UIViewController+ResetBack.h"

@implementation UIViewController (ResetBack)
- (void)resetBackButtonItem {
    
    NSArray *viewControllerArray = self.navigationController.viewControllers;
    
    long previousViewControllerIndex = [viewControllerArray indexOfObject:self] - 1;
    UIViewController *previous;
    
    if (previousViewControllerIndex >= 0) {
        previous = [viewControllerArray objectAtIndex:previousViewControllerIndex];
        previous.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc]
                                                     initWithTitle:@""
                                                     style:UIBarButtonItemStylePlain
                                                     target:self
                                                     action:nil];
    }
}
@end

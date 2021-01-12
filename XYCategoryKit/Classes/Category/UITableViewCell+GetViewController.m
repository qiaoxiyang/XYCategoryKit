//
//  UITableViewCell+GetViewController.m
//  Subsidy_Unification
//
//  Created by qiaoxy on 2019/8/16.
//  Copyright © 2019 gaof. All rights reserved.
//

#import "UITableViewCell+GetViewController.h"

@implementation UITableViewCell (GetViewController)

- (UITableView *)tableView
{
    UIView *tableView = self.superview;
    while (![tableView isKindOfClass:[UITableView class]] && tableView) {
        tableView = tableView.superview;
    }
    return (UITableView *)tableView;
}

@end

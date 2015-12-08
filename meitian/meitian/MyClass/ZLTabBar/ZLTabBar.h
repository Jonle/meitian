//
//  ZLTabBar.h
//  封装bar
//
//  Created by Jonle on 15/10/4.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import <UIKit/UIKit.h>

#define SCREEN_SIZE [[UIScreen mainScreen] bounds].size

#define UIColorWithColor(_r, _g, _b, _alpha) [UIColor colorWithRed:(_r)/255.f green:(_g)/255.f blue:(_b)/255.f alpha:(_alpha)]

@interface ZLTabBar : UIView

@property (nonatomic, strong) NSArray * buttonItems;

+ (instancetype)tabBar;

- (void)tabBarWithblock:(void (^)(ZLTabBar * tabBar, NSInteger selectedIndex))block;



@end

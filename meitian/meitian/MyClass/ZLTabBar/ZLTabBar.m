//
//  ZLTabBar.m
//  封装bar
//
//  Created by qianfeng on 15/10/4.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "ZLTabBar.h"

#define SCREEN_Width [[UIScreen mainScreen] bounds].size.width

#define SCREEN_Height [[UIScreen mainScreen] bounds].size.height

@interface ZLTabBar ()

@property (nonatomic, copy) void (^block)(ZLTabBar * tabBar, NSInteger selectedIndex);

@end

@implementation ZLTabBar

+ (instancetype)tabBar {
    
    return [[self alloc] init];
}

- (void)tabBarWithblock:(void (^)(ZLTabBar * tabBar, NSInteger selectedIndex))block {
    
    self.block = block;
}

- (void)willMoveToSuperview:(UIView *)newSuperview {
    
    self.frame = newSuperview.bounds;
}

- (void)setButtonItems:(NSArray *)buttonItems {
    
    _buttonItems = buttonItems;
    
    self.backgroundColor = [UIColor whiteColor];
    
    CGFloat buttonW = SCREEN_Width / buttonItems.count;
    CGFloat buttonH = self.frame.size.height;
    
    
    for (int i = 0; i < buttonItems.count; i++) {
        
        UIButton * button = buttonItems[i];
        
        button.frame = CGRectMake(buttonW * i, 0, buttonW, buttonH);
        
        if (SCREEN_SIZE.height > 568) {
            
             button.titleLabel.font = [UIFont systemFontOfSize:10.5];
            
        }else {
            
            button.titleLabel.font = [UIFont systemFontOfSize:10];
        }
       
        
        button.tag = i;
        
        [button addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:button];
    }
    
    [self btnAction:buttonItems[0]];
}

- (void)btnAction:(UIButton *)button {
    
    if (button.selected) {
        return;
    }

    for (UIButton * btn in self.buttonItems) {
        
        btn.selected = NO;
        btn.userInteractionEnabled = YES;
    }

    button.selected = YES;
    button.userInteractionEnabled = NO;
    
    if (self.block) {
        
        self.block (self, button.tag);
    }

}

@end

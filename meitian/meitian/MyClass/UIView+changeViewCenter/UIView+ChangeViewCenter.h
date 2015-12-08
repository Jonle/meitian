//
//  UIView+ChangeViewCenter.h
//
//
//  Created by Jonle on 15/10/15.
//  Copyright (c) 2015年 Jonle. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (ChangeViewCenter)

//处于父视图的中心
- (void)changeViewCenterWithSuperView:(UIView *)superView;

//自定义视图中心位置
- (void)changeViewCenterWithCenterX:(CGFloat)x centerY:(CGFloat)y;

@end

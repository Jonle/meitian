//
//  UIView+ChangeViewCenter.m
//
//
//  Created by Jonle on 15/10/15.
//  Copyright (c) 2015年 Jonle. All rights reserved.
//

#import "UIView+ChangeViewCenter.h"

@implementation UIView (ChangeViewCenter)

- (void)changeViewCenterWithSuperView:(UIView *)superView;{
    
    CGPoint center = self.center;
    center.x = CGRectGetWidth(superView.frame)/2;
    center.y = CGRectGetHeight(superView.frame)/2;
    
    self.center = center;
}

- (void)changeViewCenterWithCenterX:(CGFloat)x centerY:(CGFloat)y{
    
    CGPoint center = self.center;
    center.x = x;
    center.y = y;
    
    self.center = center;

}

@end

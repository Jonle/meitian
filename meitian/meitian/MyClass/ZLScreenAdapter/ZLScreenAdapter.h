//
//  ZLScreenAdapter.h
//
//  Created by qianfeng on 15/10/24.
//  Copyright © 2015年 Jonle. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZLScreenAdapter : NSObject

//扩展函数适配Rect
CGRect CGRectMakeEx(CGFloat x, CGFloat y, CGFloat width, CGFloat height);
//扩展适应Size
CGSize CGSizeMakeEx(CGFloat width, CGFloat height);
//扩展点
CGPoint CGPointMakeEx(CGFloat x, CGFloat y);

//适配高度
double heightEx(double height);
//适配宽度
double widthEx(double width);

@end

//
//  UIImage+ImageColor.m
//  image
//
//  Created by qianfeng on 15/9/29.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "UIImage+ImageColor.h"

@implementation UIImage (ImageColor)

+(UIImage *) imageWithColor:(UIColor *)color
{
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
  
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
   
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return image;
}

@end

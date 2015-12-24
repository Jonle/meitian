//
//  FZImage.m
//  FZRotatingBanner
//
//  Created by Jonle on 15/12/16.
//  Copyright © 2015年 Jonle. All rights reserved.
//

#import "FZImage.h"

@implementation FZImage

+ (UIImage *)imageNamed:(NSString *)name {
    
    UIImage * image = [super imageNamed:name];
    
    if (!image) {
        
        NSString * nameJpg = [name stringByAppendingString:@".jpg"];
        
        NSData * data = UIImageJPEGRepresentation([UIImage imageNamed:nameJpg], 0.5);
        
        return [super imageWithData:data];
    }
    return image;
}

@end

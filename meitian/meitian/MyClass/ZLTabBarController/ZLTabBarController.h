//
//  ZLTabBarController.h
//  封装Controller
//
//  Created by Jonle on 15/10/4.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZLTabBarController : UITabBarController

@property (nonatomic, strong) NSArray * titles;
@property (nonatomic, strong) NSArray * images;
@property (nonatomic, strong) NSArray * selectedImages;


- (id)addViewControllerWithClass:(Class)cls;


- (void)refreshUI;

@end

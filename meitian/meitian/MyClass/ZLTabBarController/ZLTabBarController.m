//
//  ZLTabBarController.m
//  封装Controller
//
//  Created by Jonle on 15/10/4.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "ZLTabBarController.h"
#import "ZLTabBar.h"

@interface ZLTabBarController ()
{
    NSInteger _currentViewIndex;
}
@property (nonatomic, strong) ZLTabBar * myTabBar;
@property (nonatomic, weak) UIView * currentView;



@end

@implementation ZLTabBarController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        
        _titles = [[NSMutableArray alloc] init];
        _images = [[NSMutableArray alloc] init];
        _selectedImages = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
}

- (void)initWithTabBar {
    
    self.myTabBar = [ZLTabBar tabBar];
    
    self.myTabBar.frame = self.tabBar.bounds;
    
    [self.myTabBar tabBarWithblock:^(ZLTabBar *tabBar, NSInteger selectedIndex) {
        
        self.selectedIndex = selectedIndex;
        _currentViewIndex = self.selectedIndex;
        
    }];
    
    [self.tabBar addSubview:self.myTabBar];

}


- (void)initTabBarItem {
    
    NSMutableArray * buttonArr = [[NSMutableArray alloc] init];
    
    NSArray * colors = @[UIColorWithColor(255, 216, 0, 1),UIColorWithColor(11, 194, 245, 1),UIColorWithColor(248, 75, 74, 1),UIColorWithColor(0, 0, 0, 0)];
    
    for (int i = 0; i < _titles.count; i++) {
        
        UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
        
        button.backgroundColor = UIColorWithColor(11, 194, 245, 0.3);
        
        if (i != _titles.count - 1) {
            
            [button setTitle:_titles[i] forState:UIControlStateNormal];
            if (SCREEN_SIZE.height > 667){
                
                button.imageEdgeInsets = UIEdgeInsetsMake(5, 40, 20, 40);
                
            }else if (SCREEN_SIZE.height > 568) {//iPhone6/6s
                
                button.imageEdgeInsets = UIEdgeInsetsMake(5, 35, 20, 35);
                
            }else {//iPhone5/4
                
                button.imageEdgeInsets = UIEdgeInsetsMake(5, 28, 20, 28);
                
            }
            button.titleEdgeInsets = UIEdgeInsetsMake(26, -67, 0, 0);
        }
        
        [button setTitleColor:UIColorWithColor(171, 171, 171, 1) forState:UIControlStateNormal];
        
        [button setTitleColor:colors[i] forState:UIControlStateSelected];

        [button setImage:[UIImage imageNamed:_images[i]] forState:UIControlStateNormal];
        
        [button setImage:[UIImage imageNamed:_selectedImages[i]] forState:UIControlStateSelected];
        
        button.adjustsImageWhenHighlighted = NO;
        
        
        [buttonArr addObject:button];
    }
    
    self.myTabBar.buttonItems = buttonArr;
    

}

- (id)addViewControllerWithClass:(Class)cls {
    
    UIViewController * controller = [[cls alloc] init];
    
    UINavigationController * navg = [[UINavigationController alloc] initWithRootViewController:controller];
    
    navg.navigationBar.translucent = YES;
    navg.navigationBar.barStyle = UIBarStyleDefault;
    
    NSMutableArray * navgs = [[NSMutableArray alloc] initWithArray:self.viewControllers];
    
    [navgs addObject:navg];
    
    self.viewControllers = navgs;
    
    return controller;
    
    
}

- (void)refreshUI {
    
    [self initWithTabBar];
    [self initTabBarItem];
}

- (void)didReceiveMemoryWarning {
    
    if (_currentViewIndex != 0) {
        
        [[self.viewControllers[0] view] removeFromSuperview];
    }
    if (_currentViewIndex != 1) {
        
        [[self.viewControllers[1] view] removeFromSuperview];
    }
    if (_currentViewIndex != 2) {
        
        [[self.viewControllers[2] view] removeFromSuperview];
    }
    if (_currentViewIndex != 3) {
        
        [[self.viewControllers[3] view] removeFromSuperview];
    }
    
    [super didReceiveMemoryWarning];
}

@end

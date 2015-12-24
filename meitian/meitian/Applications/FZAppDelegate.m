//
//  AppDelegate.m
//  meitian
//
//  Created by Jonle on 15/12/8.
//  Copyright © 2015年 jonle. All rights reserved.
//

#import "FZAppDelegate.h"
#import "FZRootViewController.h"
#import "FZFunDayController.h"
#import "FZDiscoveryController.h"
#import "FZSpecialController.h"
#import "FZMyController.h"
#import "ZLTabBarController.h"

@interface FZAppDelegate ()

@end

@implementation FZAppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    [self initController];
    
    
    
    return YES;
}

- (void)initController {
    
    ZLTabBarController * tab = [[ZLTabBarController alloc] init];
    
    NSArray * arrayClass = @[@"FZFunDayController",@"FZDiscoveryController",@"FZSpecialController",@"FZMyController"];
    
    for (int i = 0; i < arrayClass.count; i++) {
        Class clas = NSClassFromString(arrayClass[i]);
        [tab addViewControllerWithClass:[clas class]];
    }
    
    self.window.rootViewController = tab;
    
    tab.titles = @[@"每天",@"发现",@"专栏",@"我的"];
    tab.images = @[@"homepage_normal",@"discovery_normal",@"author_normal",@"my_normal"];
    tab.selectedImages = @[@"homepage_selected",@"discovery_selected",@"author_selected",@"my_selected"];
    
    [tab refreshUI];
    
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end

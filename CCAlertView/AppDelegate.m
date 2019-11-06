//
//  AppDelegate.m
//  CCAlertView
//
//  Created by iBlocker on 2019/11/5.
//  Copyright © 2019 iBlocker. All rights reserved.
//

#import "AppDelegate.h"
#import "CCTableViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:UIScreen.mainScreen.bounds];
    self.window.backgroundColor = UIColor.whiteColor;
    [self.window makeKeyAndVisible];
    self.window.rootViewController = [[UINavigationController alloc] initWithRootViewController:CCTableViewController.new];
    return YES;
}

@end

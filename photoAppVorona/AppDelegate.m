//
//  AppDelegate.m
//  photoAppVorona
//
//  Created by Vyacheslav Vorona on 07.12.16.
//  Copyright © 2016 Vyacheslav Vorona. All rights reserved.
//

#import "AppDelegate.h"

#import "AppDependencies.h"

@interface AppDelegate ()

@property (nonatomic, strong) AppDependencies *dependencies;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.dependencies = [[AppDependencies alloc] init];
    [self.dependencies installRootViewControllerIntoWindow:self.window];
    
    return YES;
}

@end

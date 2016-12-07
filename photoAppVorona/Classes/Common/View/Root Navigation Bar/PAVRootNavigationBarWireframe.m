//
//  PAVRootNavigationBarWireframe.m
//  photoAppVorona
//
//  Created by Vyacheslav Vorona on 07.12.16.
//  Copyright © 2016 Vyacheslav Vorona. All rights reserved.
//

#import "PAVRootNavigationBarWireframe.h"
#import "PAVCollectionWireframe.h"

static NSString *NavControllerIdentifier = @"PAVRootNavController";
static NSString *NavControllerStoryboardName = @"PAVRootNavigationController";

@implementation PAVRootNavigationBarWireframe

- (void)showRootnavigationControllerInWindow:(UIWindow *)window
{
    UINavigationController *rootNavigationController = [self navigationControllerFromStoryboard];
    
    
    [window setRootViewController:rootNavigationController];
}

- (UINavigationController *)navigationControllerFromStoryboard
{
    UIStoryboard *storyboard = [self actualStoryboard];
    UINavigationController *navigationController = [storyboard instantiateViewControllerWithIdentifier:NavControllerIdentifier];
    
    return navigationController;
}

- (UIStoryboard *)actualStoryboard
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:NavControllerStoryboardName bundle:[NSBundle mainBundle]];
    
    return storyboard;
}

@end

//
//  PAVFullScreenWireframe.m
//  photoAppVorona
//
//  Created by Vyacheslav Vorona on 08.12.16.
//  Copyright © 2016 Vyacheslav Vorona. All rights reserved.
//

#import "PAVFullScreenWireframe.h"

#import "PAVFullScreenViewController.h"

static NSString *FullScreenViewControllerIdentifier = @"PAVFullScreenViewController";
static NSString *FullScreenViewControllerStoryboardName = @"PAVFullScreenView";

@interface PAVFullScreenWireframe()

@property (nonatomic, strong) PAVFullScreenViewController *viewController;

@end

@implementation PAVFullScreenWireframe

- (void)presentPhoto:(UIImage *)photo inViewController:(UIViewController *)viewController
{
    self.fullScreenPresenter.presentedPhoto = photo;
    [viewController presentViewController:[self configuredViewController] animated:YES completion:nil];
}

- (UIViewController *)configuredViewController
{
    PAVFullScreenViewController *fullScreenViewController = [self fullScreenViewControllerFromStoryboard];
    fullScreenViewController.eventHandler = self.fullScreenPresenter;
    self.fullScreenPresenter.userInterface = fullScreenViewController;
    self.viewController = fullScreenViewController;
    
    return fullScreenViewController;
}

- (PAVFullScreenViewController *)fullScreenViewControllerFromStoryboard
{
    UIStoryboard *storyboard = [self actualStoryboard];
    PAVFullScreenViewController *viewController = [storyboard instantiateViewControllerWithIdentifier:FullScreenViewControllerIdentifier];
    
    return viewController;
}

- (UIStoryboard *)actualStoryboard
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:FullScreenViewControllerStoryboardName bundle:[NSBundle mainBundle]];
    
    return storyboard;
}

@end

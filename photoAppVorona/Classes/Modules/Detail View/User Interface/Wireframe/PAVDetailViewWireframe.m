//
//  PAVDetailViewWireframe.m
//  photoAppVorona
//
//  Created by Vyacheslav Vorona on 08.12.16.
//  Copyright © 2016 Vyacheslav Vorona. All rights reserved.
//

#import "PAVDetailViewWireframe.h"
#import "PAVDetailViewViewController.h"

static NSString *DetailViewViewControllerIdentifier = @"PAVDetailViewViewController";
static NSString *DetailViewViewControllerStoryboardName = @"PAVDetailView";

@interface PAVDetailViewWireframe()

@property (nonatomic, strong) PAVDetailViewViewController *viewController;

@end

@implementation PAVDetailViewWireframe

- (void)showFullScreenPhoto:(UIImage *)photo
{
    [self.fullScreenWireframe presentPhoto:photo inViewController:self.viewController.navigationController];
}

- (void)pushDetailViewForPhotoID:(NSNumber *)photoID inPhotoItems:(NSArray *)photoItems intoNavigationController:(UINavigationController *)navigationController
{
    self.detailViewPresenter.detailedPhotoID = photoID;
    self.detailViewPresenter.photoItems = photoItems;
    
    UIViewController *viewController = [self configuredViewController];
    [navigationController pushViewController:viewController animated:YES];
}

- (UIViewController *)configuredViewController
{
    PAVDetailViewViewController *detailViewViewController = [self detailViewViewControllerFromStoryboard];
    detailViewViewController.eventHandler = self.detailViewPresenter;
    self.detailViewPresenter.userInterface = detailViewViewController;
    self.viewController = detailViewViewController;
    
    return detailViewViewController;
}

- (PAVDetailViewViewController *)detailViewViewControllerFromStoryboard
{
    UIStoryboard *storyboard = [self actualStoryboard];
    PAVDetailViewViewController *viewController = [storyboard instantiateViewControllerWithIdentifier:DetailViewViewControllerIdentifier];
    
    return viewController;
}

- (UIStoryboard *)actualStoryboard
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:DetailViewViewControllerStoryboardName bundle:[NSBundle mainBundle]];
    
    return storyboard;
}

@end

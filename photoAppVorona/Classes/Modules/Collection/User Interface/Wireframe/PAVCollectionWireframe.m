//
//  PAVCollectionWireframe.m
//  photoAppVorona
//
//  Created by Vyacheslav Vorona on 07.12.16.
//  Copyright © 2016 Vyacheslav Vorona. All rights reserved.
//

#import "PAVCollectionWireframe.h"
#import "PAVCollectionViewController.h"

static NSString *CollectionViewControllerIdentifier = @"PAVCollectionViewController";
static NSString *CollectionViewControllerStoryboardName = @"PAVCollectionView";

@interface PAVCollectionWireframe()

@property (nonatomic, strong) PAVCollectionViewController *viewController;

@end

@implementation PAVCollectionWireframe

- (void)setRootViewControllerForNavigationController:(UINavigationController *)navigationController
{
    UIViewController *viewController = [self configuredViewController];
    [navigationController setViewControllers:@[viewController]];
}

- (UIViewController *)configuredViewController
{
    PAVCollectionViewController *collectionViewController = [self collectionViewControllerFromStoryboard];
    collectionViewController.eventHandler = self.collectionPresenter;
    self.collectionPresenter.userInterface = collectionViewController;
    self.viewController = collectionViewController;
    
    return collectionViewController;
}

- (PAVCollectionViewController *)collectionViewControllerFromStoryboard
{
    UIStoryboard *storyboard = [self actualStoryboard];
    PAVCollectionViewController *viewController = [storyboard instantiateViewControllerWithIdentifier:CollectionViewControllerIdentifier];
    
    return viewController;
}

- (UIStoryboard *)actualStoryboard
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:CollectionViewControllerStoryboardName bundle:[NSBundle mainBundle]];
    
    return storyboard;
}

- (void)showDetailViewWithPhotoID:(NSNumber *)photoID inPhotoItems:(NSArray *)photoItems
{
    [self.detailViewWireframe pushDetailViewForPhotoID:photoID inPhotoItems:photoItems intoNavigationController:self.viewController.navigationController];
}

@end

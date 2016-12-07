//
//  AppDependencies.m
//  photoAppVorona
//
//  Created by Vyacheslav Vorona on 07.12.16.
//  Copyright © 2016 Vyacheslav Vorona. All rights reserved.
//

#import "AppDependencies.h"

#import "PAVRootNavigationBarWireframe.h"

#import "PAVCollectionWireframe.h"
#import "PAVCollectionPresenter.h"
#import "PAVCollectionInteractor.h"

@interface AppDependencies()

@property (nonatomic, strong) PAVRootNavigationBarWireframe *navBarWireframe;

@end

@implementation AppDependencies

- (id)init
{
    if (self = [super init])
    {
        [self configureDependencies];
    }
    
    return self;
}

- (void)installRootViewControllerIntoWindow:(UIWindow *)window
{
    [self.navBarWireframe showRootnavigationControllerInWindow:window];
}

- (void)configureDependencies
{
    // === Initialization ===
    
    //Collection classes
    PAVCollectionWireframe *collectionWireframe = [[PAVCollectionWireframe alloc] init];
    PAVCollectionPresenter *collectionPresenter = [[PAVCollectionPresenter alloc] init];
    PAVCollectionInteractor *collectionInteractor = [[PAVCollectionInteractor alloc] init];
    
    // === Dependencies ===
    
    //Collection classes
    collectionWireframe.collectionPresenter = collectionPresenter;
    collectionPresenter.collectionWireframe = collectionWireframe;
    collectionPresenter.collectionInteractor = collectionInteractor;
    collectionInteractor.output = collectionPresenter;
    
}

@end

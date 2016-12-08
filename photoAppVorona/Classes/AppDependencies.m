//
//  AppDependencies.m
//  photoAppVorona
//
//  Created by Vyacheslav Vorona on 07.12.16.
//  Copyright © 2016 Vyacheslav Vorona. All rights reserved.
//

#import "AppDependencies.h"

#import "PAVRootNavigationBarWireframe.h"

#import "PAVNetworkManager.h"

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
    [self.navBarWireframe showRootNavigationControllerInWindow:window];
}

- (void)configureDependencies
{
    // === Initialization ===
    
    //Common classes
    PAVNetworkManager *networkManager = [[PAVNetworkManager alloc] initNetworkManager];
    
    //Navigation Controller
    self.navBarWireframe = [[PAVRootNavigationBarWireframe alloc] init];
    
    //Collection classes
    PAVCollectionWireframe *collectionWireframe = [[PAVCollectionWireframe alloc] init];
    PAVCollectionPresenter *collectionPresenter = [[PAVCollectionPresenter alloc] init];
    PAVCollectionInteractor *collectionInteractor = [[PAVCollectionInteractor alloc] init];
    
    // === Dependencies ===
    
    //Navigation Controller
    self.navBarWireframe.collectionWireframe = collectionWireframe;
    
    //Collection classes
    collectionWireframe.collectionPresenter = collectionPresenter;
    collectionPresenter.collectionWireframe = collectionWireframe;
    collectionPresenter.collectionInteractor = collectionInteractor;
    collectionInteractor.output = collectionPresenter;
    collectionInteractor.networkManager = networkManager;
    
}

@end

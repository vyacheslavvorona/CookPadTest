//
//  PAVCollectionPresenter.m
//  photoAppVorona
//
//  Created by Vyacheslav Vorona on 07.12.16.
//  Copyright © 2016 Vyacheslav Vorona. All rights reserved.
//

#import "PAVCollectionPresenter.h"

@implementation PAVCollectionPresenter

- (void)loadPhotoList
{
    [self.collectionInteractor loadPhotoList];
}

- (void)noConnectionMessage
{
    [self.userInterface showNoConnectionMessage];
}

@end

//
//  PAVCollectionWireframe.h
//  photoAppVorona
//
//  Created by Vyacheslav Vorona on 07.12.16.
//  Copyright © 2016 Vyacheslav Vorona. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "PAVCollectionPresenter.h"
#import "PAVDetailViewWireframe.h"

@class PAVCollectionPresenter;

@interface PAVCollectionWireframe : NSObject

@property (nonatomic, strong) PAVCollectionPresenter *collectionPresenter;
@property (nonatomic, strong) PAVDetailViewWireframe *detailViewWireframe;

- (void)setRootViewControllerForNavigationController:(UINavigationController *)navigationController;
- (void)showDetailViewWithPhotoID:(NSNumber *)photoID inPhotoItems:(NSArray *)photoItems;

@end

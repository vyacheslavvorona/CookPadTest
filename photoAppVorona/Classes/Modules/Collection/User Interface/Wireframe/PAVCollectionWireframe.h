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

@interface PAVCollectionWireframe : NSObject

@property (nonatomic, strong) PAVCollectionPresenter *collectionPresenter;

- (void)setRootViewControllerForNavigationController:(UINavigationController *)navigationController;

@end

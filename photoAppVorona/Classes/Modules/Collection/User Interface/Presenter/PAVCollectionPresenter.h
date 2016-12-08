//
//  PAVCollectionPresenter.h
//  photoAppVorona
//
//  Created by Vyacheslav Vorona on 07.12.16.
//  Copyright © 2016 Vyacheslav Vorona. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "PAVCollectionWireframe.h"
#import "PAVCollectionInteractorIO.h"
#import "PAVCollectionModuleInterface.h"
#import "PAVCollectionViewInterface.h"

@class PAVCollectionWireframe;

@interface PAVCollectionPresenter : NSObject <PAVCollectionInteractorOutput, PAVCollectionModuleInterface>

@property (nonatomic, strong) PAVCollectionWireframe *collectionWireframe;
@property (nonatomic, strong) id<PAVCollectionInteractorInput> collectionInteractor;
@property (nonatomic, strong) UIViewController<PAVCollectionViewInterface> *userInterface;

@end

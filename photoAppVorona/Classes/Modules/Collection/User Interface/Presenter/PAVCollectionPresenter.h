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

@class PAVCollectionWireframe;

@interface PAVCollectionPresenter : NSObject <PAVCollectionInteractorOutput>

@property (nonatomic, strong) PAVCollectionWireframe *collectionWireframe;
@property (nonatomic, strong) id<PAVCollectionInteractorInput> collectionInteractor;

@end

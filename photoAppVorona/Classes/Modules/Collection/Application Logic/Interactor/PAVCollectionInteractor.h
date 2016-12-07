//
//  PAVCollectionInteractor.h
//  photoAppVorona
//
//  Created by Vyacheslav Vorona on 07.12.16.
//  Copyright © 2016 Vyacheslav Vorona. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "PAVCollectionInteractorIO.h"

@interface PAVCollectionInteractor : NSObject <PAVCollectionInteractorInput>

@property (nonatomic, strong) id<PAVCollectionInteractorOutput> output;

@end

//
//  PAVCollectionInteractor.h
//  photoAppVorona
//
//  Created by Vyacheslav Vorona on 07.12.16.
//  Copyright © 2016 Vyacheslav Vorona. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "PAVCollectionInteractorIO.h"
#import "PAVNetworkManager.h"
#import "PAVLoadingSessionDelegate.h"

@interface PAVCollectionInteractor : NSObject <PAVCollectionInteractorInput, PAVLoadinSessionDelegate>

@property (nonatomic, strong) id<PAVCollectionInteractorOutput> output;
@property (nonatomic, strong) PAVNetworkManager *networkManager;

@end

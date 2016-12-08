//
//  PAVDetailViewInteractor.h
//  photoAppVorona
//
//  Created by Vyacheslav Vorona on 08.12.16.
//  Copyright © 2016 Vyacheslav Vorona. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "PAVDetailViewInteractorIO.h"
#import "PAVNetworkManager.h"
#import "PAVLoadingSessionDelegate.h"

@interface PAVDetailViewInteractor : NSObject <PAVDetailViewInteractorInput, PAVLoadinSessionDelegate>

@property (nonatomic, strong) id<PAVDetailViewInteractorOutput> output;
@property (nonatomic, strong) PAVNetworkManager *networkManager;

@end

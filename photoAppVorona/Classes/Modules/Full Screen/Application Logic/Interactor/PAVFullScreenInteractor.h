//
//  PAVFullScreenInteractor.h
//  photoAppVorona
//
//  Created by Vyacheslav Vorona on 08.12.16.
//  Copyright © 2016 Vyacheslav Vorona. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "PAVFullScreenInteractorIO.h"

@interface PAVFullScreenInteractor : NSObject <PAVFullScreenInteractorInput>

@property (nonatomic, strong) id<PAVFullScreenInteractorOutput> output;

@end

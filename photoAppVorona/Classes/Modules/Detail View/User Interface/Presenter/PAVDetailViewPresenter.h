//
//  PAVDetailViewPresenter.h
//  photoAppVorona
//
//  Created by Vyacheslav Vorona on 08.12.16.
//  Copyright © 2016 Vyacheslav Vorona. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "PAVDetailViewWireframe.h"
#import "PAVDetailViewInteractorIO.h"
#import "PAVDetailViewModuleInterface.h"
#import "PAVDetailViewViewInterface.h"

@class PAVDetailViewWireframe;

@interface PAVDetailViewPresenter : NSObject <PAVDetailViewInteractorOutput, PAVDetailViewModuleInterface>

@property (nonatomic, strong) PAVDetailViewWireframe *detailViewWireframe;
@property (nonatomic, strong) id<PAVDetailViewInteractorInput> detailViewInteractor;
@property (nonatomic, strong) UIViewController<PAVDetailViewViewInterface> *userInterface;
@property (nonatomic, strong) NSArray *photoItems;
@property (nonatomic, strong) NSNumber *detailedPhotoID;

@end

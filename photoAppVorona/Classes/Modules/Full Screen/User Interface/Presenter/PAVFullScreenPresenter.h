//
//  PAVFullScreenPresenter.h
//  photoAppVorona
//
//  Created by Vyacheslav Vorona on 08.12.16.
//  Copyright © 2016 Vyacheslav Vorona. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "PAVFullScreenWireframe.h"
#import "PAVFullScreenInteractorIO.h"
#import "PAVFullScreenModuleInterface.h"
#import "PAVFullScreenViewInterface.h"

@class PAVFullScreenWireframe;

@interface PAVFullScreenPresenter : NSObject <PAVFullScreenInteractorOutput, PAVFullScreenModuleInterface>

@property (nonatomic, strong) UIImage *presentedPhoto;

@property (nonatomic, strong) PAVFullScreenWireframe *fullscreenWireframe;
@property (nonatomic, strong) id<PAVFullScreenInteractorInput> fullScreenInteractor;
@property (nonatomic, strong) UIViewController<PAVFullScreenViewInterface> *userInterface;

@end

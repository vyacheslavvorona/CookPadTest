//
//  PAVFullScreenWireframe.h
//  photoAppVorona
//
//  Created by Vyacheslav Vorona on 08.12.16.
//  Copyright © 2016 Vyacheslav Vorona. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "PAVFullScreenPresenter.h"

@class PAVFullScreenPresenter;

@interface PAVFullScreenWireframe : NSObject

@property (nonatomic, strong) PAVFullScreenPresenter *fullScreenPresenter;

- (void)presentPhoto:(UIImage *)photo inViewController:(UIViewController *)viewController;

@end

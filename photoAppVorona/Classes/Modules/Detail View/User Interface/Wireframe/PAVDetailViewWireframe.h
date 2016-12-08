//
//  PAVDetailViewWireframe.h
//  photoAppVorona
//
//  Created by Vyacheslav Vorona on 08.12.16.
//  Copyright © 2016 Vyacheslav Vorona. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "PAVDetailViewPresenter.h"
#import "PAVFullScreenWireframe.h"

@class PAVDetailViewPresenter;

@interface PAVDetailViewWireframe : NSObject

@property (nonatomic, strong) PAVDetailViewPresenter *detailViewPresenter;
@property (nonatomic, strong) PAVFullScreenWireframe *fullScreenWireframe;

- (void)pushDetailViewForPhotoID:(NSNumber *)photoID inPhotoItems:(NSArray *)photoItems intoNavigationController:(UINavigationController *)navigationController;
- (void)showFullScreenPhoto:(UIImage *)photo;

@end

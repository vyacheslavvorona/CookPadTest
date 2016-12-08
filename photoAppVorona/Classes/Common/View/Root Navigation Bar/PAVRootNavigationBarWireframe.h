//
//  PAVRootNavigationBarWireframe.h
//  photoAppVorona
//
//  Created by Vyacheslav Vorona on 07.12.16.
//  Copyright © 2016 Vyacheslav Vorona. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "PAVCollectionWireframe.h"

@interface PAVRootNavigationBarWireframe : NSObject

@property (nonatomic, strong) PAVCollectionWireframe *collectionWireframe;

- (void)showRootNavigationControllerInWindow:(UIWindow *)window;

@end

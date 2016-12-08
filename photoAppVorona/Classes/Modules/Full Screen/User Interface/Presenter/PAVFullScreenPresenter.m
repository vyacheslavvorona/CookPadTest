//
//  PAVFullScreenPresenter.m
//  photoAppVorona
//
//  Created by Vyacheslav Vorona on 08.12.16.
//  Copyright © 2016 Vyacheslav Vorona. All rights reserved.
//

#import "PAVFullScreenPresenter.h"

@implementation PAVFullScreenPresenter

- (void)photoWillAppear
{
    [self.userInterface setPresentedPhoto:self.presentedPhoto];
}

- (void)photoWillDisappear
{
    //for more possible actions later
}

@end

//
//  PAVDetailViewInteractor.m
//  photoAppVorona
//
//  Created by Vyacheslav Vorona on 08.12.16.
//  Copyright © 2016 Vyacheslav Vorona. All rights reserved.
//

#import "PAVDetailViewInteractor.h"

@implementation PAVDetailViewInteractor

#pragma mark - Particular photo loading

- (void)loadPhotoWithID:(NSNumber *)photoID byURL:(NSString *)photoURL
{
    [self.networkManager downloadPhotoWithID:photoID byURL:photoURL forOutput:self];
}

- (void)didLoadPhoto:(UIImage *)photo forID:(NSNumber *)photoID
{
    [self.output didLoadPhoto:photo forID:photoID];
}

@end

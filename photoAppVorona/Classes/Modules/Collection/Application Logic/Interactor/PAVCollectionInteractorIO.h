//
//  PAVCollectionInteractorIO.h
//  photoAppVorona
//
//  Created by Vyacheslav Vorona on 07.12.16.
//  Copyright © 2016 Vyacheslav Vorona. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol PAVCollectionInteractorInput <NSObject>

- (void)loadPhotoList;

@end


@protocol PAVCollectionInteractorOutput <NSObject>

- (void)noConnectionMessage;

@end

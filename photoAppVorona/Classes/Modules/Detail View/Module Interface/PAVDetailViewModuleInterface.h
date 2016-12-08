//
//  PAVDetailViewModuleInterface.h
//  photoAppVorona
//
//  Created by Vyacheslav Vorona on 08.12.16.
//  Copyright © 2016 Vyacheslav Vorona. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol PAVDetailViewModuleInterface <NSObject>

- (void)detailViewWillAppear;
- (void)photoWillAppear:(NSNumber *)photoID;
- (void)fullSizeWillAppear:(NSNumber *)photoID;
- (void)mainPhotoTap:(NSNumber *)photoID;

@end

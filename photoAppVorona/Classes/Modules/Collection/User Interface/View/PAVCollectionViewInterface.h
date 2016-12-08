//
//  PAVCollectionViewInterface.h
//  photoAppVorona
//
//  Created by Vyacheslav Vorona on 08.12.16.
//  Copyright © 2016 Vyacheslav Vorona. All rights reserved.
//

@protocol PAVCollectionViewInterface <NSObject>

- (void)showNoConnectionMessage;
- (void)setPhotoDisplayData:(NSArray *)displayData;

@end

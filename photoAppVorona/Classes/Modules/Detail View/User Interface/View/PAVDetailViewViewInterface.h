//
//  PAVDetailViewViewInterface.h
//  photoAppVorona
//
//  Created by Vyacheslav Vorona on 08.12.16.
//  Copyright © 2016 Vyacheslav Vorona. All rights reserved.
//

@protocol PAVDetailViewViewInterface <NSObject>

- (void)setPhotoDisplayData:(NSArray *)displayData;
- (void)setFullSizePhotoForID:(NSNumber *)photoID;

@end

//
//  PAVLoadingSessionDelegate.h
//  photoAppVorona
//
//  Created by Vyacheslav Vorona on 08.12.16.
//  Copyright © 2016 Vyacheslav Vorona. All rights reserved.
//

@protocol PAVLoadinSessionDelegate <NSObject>

- (void)didLoadPhoto:(UIImage *)photo forID:(NSNumber *)photoID;
- (void)failedToLoadPhotoForID:(NSNumber *)photoID;

@end

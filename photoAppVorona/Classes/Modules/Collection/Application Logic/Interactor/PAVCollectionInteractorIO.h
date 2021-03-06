//
//  PAVCollectionInteractorIO.h
//  photoAppVorona
//
//  Created by Vyacheslav Vorona on 07.12.16.
//  Copyright © 2016 Vyacheslav Vorona. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol PAVCollectionInteractorInput <NSObject>

- (void)loadPhotoList;
- (void)loadPhotoWithID:(NSNumber *)photoID byURL:(NSString *)photoURL;

@end


@protocol PAVCollectionInteractorOutput <NSObject>

- (void)noConnectionMessage;
- (void)receivedPhotoItems:(NSArray *)photoItems;
- (void)didLoadPhoto:(UIImage *)photo forID:(NSNumber *)photoID;

@optional
- (void)failedToLoadPhotoforID:(NSNumber *)photoID;

@end

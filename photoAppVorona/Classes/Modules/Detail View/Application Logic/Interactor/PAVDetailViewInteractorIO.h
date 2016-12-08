//
//  PAVDetailViewInteractorIO.h
//  photoAppVorona
//
//  Created by Vyacheslav Vorona on 08.12.16.
//  Copyright © 2016 Vyacheslav Vorona. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol PAVDetailViewInteractorInput <NSObject>

- (void)loadPhotoWithID:(NSNumber *)photoID byURL:(NSString *)photoURL;

@end


@protocol PAVDetailViewInteractorOutput <NSObject>

- (void)didLoadPhoto:(UIImage *)photo forID:(NSNumber *)photoID;

@optional
- (void)failedToLoadPhotoforID:(NSNumber *)photoID;

@end

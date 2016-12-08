//
//  PAVPhotoLoadingSession.h
//  photoAppVorona
//
//  Created by Vyacheslav Vorona on 08.12.16.
//  Copyright © 2016 Vyacheslav Vorona. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"
#import "AFImageDownloader.h"

#import "PAVLoadingSessionDelegate.h"

@interface PAVPhotoLoadingSession : NSObject

@property (nonatomic, strong) NSNumber *loadingPhotoID;
@property (nonatomic, strong) NSString *photoURL;
@property (nonatomic, strong) id<PAVLoadinSessionDelegate> delegate;

- (void)startLoading;

@end

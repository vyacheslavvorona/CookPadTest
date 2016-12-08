//
//  PAVPhotoLoadingSession.m
//  photoAppVorona
//
//  Created by Vyacheslav Vorona on 08.12.16.
//  Copyright © 2016 Vyacheslav Vorona. All rights reserved.
//

#import "PAVPhotoLoadingSession.h"

@implementation PAVPhotoLoadingSession

- (void)startLoading
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(void){
        NSURLRequest *imageRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:self.photoURL]
                                                      cachePolicy:NSURLRequestReturnCacheDataElseLoad
                                                  timeoutInterval:60];
        
        [[AFImageDownloader defaultInstance] downloadImageForURLRequest:imageRequest success:^(NSURLRequest * _Nonnull request, NSHTTPURLResponse * _Nullable response, UIImage * _Nonnull responseObject) {
            
            [self.delegate didLoadPhoto:responseObject forID:self.loadingPhotoID];
            
        } failure:^(NSURLRequest * _Nonnull request, NSHTTPURLResponse * _Nullable response, NSError * _Nonnull error) {
            
            [self.delegate failedToLoadPhotoForID:self.loadingPhotoID];
            
        }];
    });
}

@end

//
//  PAVCollectionInteractor.m
//  photoAppVorona
//
//  Created by Vyacheslav Vorona on 07.12.16.
//  Copyright © 2016 Vyacheslav Vorona. All rights reserved.
//

#import "PAVCollectionInteractor.h"

#import "PAVPhotoListJSONParser.h"

@implementation PAVCollectionInteractor

- (void)loadPhotoList
{
    //Needs delay to let AFNetworkingReachabilityManager start it's monitoring. Overwise reachability returns nil.
    [self performSelector:(@selector(startLoading)) withObject:nil afterDelay:0.3];
}

- (void)startLoading
{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setObject:[NSNumber numberWithInt:30] forKey:@"per_page"];
    
    [self.networkManager getPhotoListWithSuccessBlock:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        
        NSArray *listItems = [PAVPhotoListJSONParser parsePhotoList:responseObject];
        
    } FailBlock:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        
        NSString *connectionError = [error.userInfo objectForKey:@"connection"];
        if ([connectionError isEqualToString:@"no connection"])
        {
            [self.output noConnectionMessage];
        }
        else
        {
            NSString* errorResponse = [[NSString alloc] initWithData:(NSData *)error.userInfo[AFNetworkingOperationFailingURLResponseDataErrorKey] encoding:NSUTF8StringEncoding];
            NSLog(@"Error response: %@",errorResponse);
        }
        
    } andParameters:params];
}

@end

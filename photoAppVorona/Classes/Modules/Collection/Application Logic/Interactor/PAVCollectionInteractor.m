//
//  PAVCollectionInteractor.m
//  photoAppVorona
//
//  Created by Vyacheslav Vorona on 07.12.16.
//  Copyright © 2016 Vyacheslav Vorona. All rights reserved.
//

#import "PAVCollectionInteractor.h"

#import "PAVPhotoListJSONParser.h"

@interface PAVCollectionInteractor()

@property (nonatomic) int page;

@end

@implementation PAVCollectionInteractor

- (id)init
{
    self = [super init];
    
    self.page = 0;
    
    return self;
}

- (void)loadPhotoList
{
    //Needs delay to let AFNetworkingReachabilityManager start it's monitoring. Overwise reachability returns nil.
    [self performSelector:(@selector(startLoading)) withObject:nil afterDelay:0.3];
}

- (void)startLoading
{
    self.page++;
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setObject:[NSNumber numberWithInt:100] forKey:@"per_page"];
    [params setObject:[NSNumber numberWithInt:self.page] forKey:@"page"];
    
    [self.networkManager getPhotoListWithSuccessBlock:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        
        NSArray *listItems = [PAVPhotoListJSONParser parsePhotoList:responseObject];
        [self.output receivedPhotoItems:listItems];
        
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

#pragma mark - Particular Photo Loading

- (void)loadPhotoWithID:(NSNumber *)photoID byURL:(NSString *)photoURL
{
    [self.networkManager downloadPhotoWithID:photoID byURL:photoURL forOutput:self];
}

- (void)didLoadPhoto:(UIImage *)photo forID:(NSNumber *)photoID
{
    [self.output didLoadPhoto:photo forID:photoID];
}

- (void)failedToLoadPhotoForID:(NSNumber *)photoID
{
    [self.output failedToLoadPhotoforID:photoID];
}

@end

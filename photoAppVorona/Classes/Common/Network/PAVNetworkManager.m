//
//  PAVNetworkManager.m
//  photoAppVorona
//
//  Created by Vyacheslav Vorona on 08.12.16.
//  Copyright © 2016 Vyacheslav Vorona. All rights reserved.
//

#import "PAVNetworkManager.h"

#import "PAVConstants.h"
#import "PAVPhotoLoadingSession.h"


static NSString *apiKeyDictKey = @"key";

@implementation PAVNetworkManager

- (nonnull instancetype)initNetworkManager
{
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
    
    return [self initWithBaseURL:[NSURL URLWithString:baseApiUrl]];
}

- (void)getPhotoListWithSuccessBlock:(void (^)(NSURLSessionDataTask *task, id responseObject))successBlock
                           FailBlock:(void (^)(NSURLSessionDataTask *task, NSError *error))failBlock
                       andParameters:(NSMutableDictionary *)params
{
    [params setObject:apiKey forKey:apiKeyDictKey];
    
    if ([self connected])
    {
        [self GET:@"" parameters:params success:successBlock failure:failBlock];
    }
    else
    {
        failBlock(nil, [self noConnectionError]);
    }
}

- (void)downloadPhotoWithID:(NSNumber *)photoID
                      byURL:(NSString *)photoURL
                  forOutput:(id<PAVLoadinSessionDelegate>)output
{
    PAVPhotoLoadingSession *session = [[PAVPhotoLoadingSession alloc] init];
    session.loadingPhotoID = photoID;
    session.photoURL = photoURL;
    session.delegate = output;
    [session startLoading];
}

- (BOOL)connected
{
    return [AFNetworkReachabilityManager sharedManager].reachable;
}

- (NSError *)noConnectionError
{
    NSDictionary *userInfo = @{@"connection":@"no connection"};
    NSError *error = [NSError errorWithDomain:@"network" code:42 userInfo:userInfo];
    return error;
}

@end

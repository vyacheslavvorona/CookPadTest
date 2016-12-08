//
//  PAVNetworkManager.m
//  photoAppVorona
//
//  Created by Vyacheslav Vorona on 08.12.16.
//  Copyright © 2016 Vyacheslav Vorona. All rights reserved.
//

#import "PAVNetworkManager.h"

#import "PAVConstants.h"

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
        NSDictionary *userInfo = @{@"connection":@"no connection"};
        NSError *error = [NSError errorWithDomain:@"network" code:42 userInfo:userInfo];
        failBlock(nil, error);
    }
}

- (BOOL)connected
{
    return [AFNetworkReachabilityManager sharedManager].reachable;
}

@end

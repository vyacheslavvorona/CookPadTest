//
//  PAVNetworkManager.h
//  photoAppVorona
//
//  Created by Vyacheslav Vorona on 08.12.16.
//  Copyright © 2016 Vyacheslav Vorona. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AFNetworking.h"

@interface PAVNetworkManager : AFHTTPSessionManager

- (nonnull instancetype)initNetworkManager;

- (void)getPhotoListWithSuccessBlock:(void (^)(NSURLSessionDataTask *task, id responseObject))successBlock
                           FailBlock:(void (^)(NSURLSessionDataTask *task, NSError *error))failBlock
                       andParameters:(NSMutableDictionary *)params;

@end


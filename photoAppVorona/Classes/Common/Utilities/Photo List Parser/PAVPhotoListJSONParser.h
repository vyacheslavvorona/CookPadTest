//
//  PAVPhotoListJSONParser.h
//  photoAppVorona
//
//  Created by Vyacheslav Vorona on 08.12.16.
//  Copyright © 2016 Vyacheslav Vorona. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PAVPhotoListJSONParser : NSObject

+ (NSArray *)parsePhotoList:(NSDictionary *)json;

@end

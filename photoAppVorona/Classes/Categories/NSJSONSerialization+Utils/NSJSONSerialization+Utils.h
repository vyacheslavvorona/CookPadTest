//
//  NSJSONSerialization+Utils.h
//  mySelfMastery
//
//  Created by vorona on 19.07.16.
//  Copyright © 2016 Complex Systems. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSJSONSerialization (PAVUtils)

+ (NSString*)jsonStringByDictionary:(NSDictionary*)dictionary;
+ (BOOL)hasProperty:(NSString*)key inJson:(NSDictionary*)json;
+ (NSMutableArray*)makeNumbersArrayFromArray:(NSArray *)array;

@end

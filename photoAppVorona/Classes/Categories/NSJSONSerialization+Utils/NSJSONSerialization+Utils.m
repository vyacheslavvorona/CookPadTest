//
//  NSJSONSerialization+Utils.m
//  mySelfMastery
//
//  Created by vorona on 19.07.16.
//  Copyright © 2016 Complex Systems. All rights reserved.
//

#import "NSJSONSerialization+Utils.h"

@implementation NSJSONSerialization (PAVUtils)

+ (NSString*)jsonStringByDictionary:(NSDictionary*)dictionary
{
    NSError *error = nil;
    NSData *dataParameters = [NSJSONSerialization dataWithJSONObject:dictionary options:NSJSONWritingPrettyPrinted error:&error];
    if (error)
    {
        NSLog(@"Warning %@", error);
    }
    return  [[NSString alloc] initWithData:dataParameters encoding:NSUTF8StringEncoding];
}


+ (BOOL)hasProperty:(NSString*)key inJson:(NSDictionary*)json
{
    return ([NSJSONSerialization isValidJSONObject:json] && json[key] && ![json[key] isEqual:[NSNull null]]);
}


+ (NSMutableArray*)makeNumbersArrayFromArray:(NSArray *)array
{
    NSMutableArray *result = [NSMutableArray arrayWithCapacity:[array count]];
    for (id obj in array)
    {
        if (obj && ![obj isEqual:[NSNull null]])
        {
            [result addObject:obj];
        }
    }
    return result;
}

@end

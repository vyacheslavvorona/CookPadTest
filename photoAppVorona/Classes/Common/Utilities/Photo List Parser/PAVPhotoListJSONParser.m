//
//  PAVPhotoListJSONParser.m
//  photoAppVorona
//
//  Created by Vyacheslav Vorona on 08.12.16.
//  Copyright © 2016 Vyacheslav Vorona. All rights reserved.
//

#import "PAVPhotoListJSONParser.h"

#import "PAVPhotoItem.h"

@implementation PAVPhotoListJSONParser

+ (NSArray *)parsePhotoList:(NSDictionary *)json
{
    NSMutableArray *listItems = [NSMutableArray array];
    
    NSArray *hits = [NSJSONSerialization hasProperty:@"hits" inJson:json] ? [json objectForKey:@"hits"] : @[];
    
    for (NSDictionary *hit in hits)
    {
        PAVPhotoItem *photoItem = [[PAVPhotoItem alloc] init];
        
        photoItem.photoID = [NSJSONSerialization hasProperty:@"id" inJson:hit] ? [hit objectForKey:@"id"] : nil;
        photoItem.fullSizeURL = [NSJSONSerialization hasProperty:@"webformatURL" inJson:hit] ? [hit objectForKey:@"webformatURL"] : @"";
        photoItem.previewURL = [NSJSONSerialization hasProperty:@"previewURL" inJson:hit] ? [hit objectForKey:@"previewURL"] : @"";
        
        [listItems addObject:photoItem];
    }
    
    return [NSArray arrayWithArray:listItems];
}

@end

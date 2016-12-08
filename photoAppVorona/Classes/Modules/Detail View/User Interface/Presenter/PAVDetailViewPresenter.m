//
//  PAVDetailViewPresenter.m
//  photoAppVorona
//
//  Created by Vyacheslav Vorona on 08.12.16.
//  Copyright © 2016 Vyacheslav Vorona. All rights reserved.
//

#import "PAVDetailViewPresenter.h"

#import "PAVPhotoDisplayItem.h"
#import "PAVPhotoItem.h"

@interface PAVDetailViewPresenter()

@end

@implementation PAVDetailViewPresenter

- (void)detailViewWillAppear
{
    [self.userInterface setPhotoDisplayData:[self displayItemsWithPhotoItems:self.photoItems]];
    [self fullSizeWillAppear:self.detailedPhotoID];
}

- (void)photoWillAppear:(NSNumber *)photoID
{
    [self.detailViewInteractor loadPhotoWithID:photoID byURL:[self previewPhotoURLByID:photoID]];
}

- (void)fullSizeWillAppear:(NSNumber *)photoID
{
    self.detailedPhotoID = photoID;
    [self.detailViewInteractor loadPhotoWithID:photoID byURL:[self fullSizePhotoURLByID:photoID]];
}

- (NSArray *)displayItemsWithPhotoItems:(NSArray *)photoItems
{
    NSMutableArray *displayItems = [NSMutableArray array];
    
    for (PAVPhotoItem *item in photoItems)
    {
        PAVPhotoDisplayItem *displayItem = [[PAVPhotoDisplayItem alloc] init];
        displayItem.photoID = item.photoID;
        displayItem.photo = item.previewPhoto;
        displayItem.fullSizePhoto = item.fullSizePhoto;
        [displayItems addObject:displayItem];
    }
    
    return [NSArray arrayWithArray:displayItems];
}

- (NSString *)previewPhotoURLByID:(NSNumber *)photoID
{
    for (PAVPhotoItem *item in self.photoItems)
    {
        if (item.photoID.integerValue == photoID.integerValue)
        {
            return item.previewURL;
        }
    }
    
    return nil;
}

- (UIImage *)fullSizePhotoByID:(NSNumber *)photoID
{
    for (PAVPhotoItem *item in self.photoItems)
    {
        if (item.photoID.integerValue == photoID.integerValue)
        {
            return item.fullSizePhoto;
        }
    }
    
    return nil;
}

- (NSString *)fullSizePhotoURLByID:(NSNumber *)photoID
{
    for (PAVPhotoItem *item in self.photoItems)
    {
        if (item.photoID.integerValue == photoID.integerValue)
        {
            return item.fullSizeURL;
        }
    }
    
    return nil;
}

- (void)didLoadPhoto:(UIImage *)photo forID:(NSNumber *)photoID
{
    for (PAVPhotoItem *item in self.photoItems)
    {
        if (photoID.integerValue == item.photoID.integerValue)
        {
            if (photoID.integerValue == self.detailedPhotoID.integerValue)
            {
                item.fullSizePhoto = photo;
            }
            else
            {
                item.previewPhoto = photo;
            }
        }
    }
    
    [self receivedPhotoItems:[NSArray arrayWithArray:self.photoItems]];
    [self.userInterface setFullSizePhotoForID:self.detailedPhotoID];
}

- (void)receivedPhotoItems:(NSArray *)photoItems
{
    self.photoItems = [NSMutableArray arrayWithArray:photoItems];
    [self.userInterface setPhotoDisplayData:[self displayItemsWithPhotoItems:photoItems]];
}

- (void)mainPhotoTap:(NSNumber *)photoID
{
    [self.detailViewWireframe showFullScreenPhoto:[self fullSizePhotoByID:photoID]];
}

@end

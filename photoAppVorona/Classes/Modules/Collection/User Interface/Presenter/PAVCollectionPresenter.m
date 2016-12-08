//
//  PAVCollectionPresenter.m
//  photoAppVorona
//
//  Created by Vyacheslav Vorona on 07.12.16.
//  Copyright © 2016 Vyacheslav Vorona. All rights reserved.
//

#import "PAVCollectionPresenter.h"

#import "PAVPhotoItem.h"
#import "PAVPhotoDisplayItem.h"

@interface PAVCollectionPresenter()

@property (nonatomic, strong) NSMutableArray *photoItems;

@end

@implementation PAVCollectionPresenter

- (void)loadPhotoList
{
    [self.collectionInteractor loadPhotoList];
}

- (void)noConnectionMessage
{
    [self.userInterface showNoConnectionMessage];
}

- (void)receivedPhotoItems:(NSArray *)photoItems
{
    self.photoItems = [NSMutableArray arrayWithArray:photoItems];
    [self.userInterface setPhotoDisplayData:[self displayItemsWithPhotoItems:photoItems]];
}

- (NSArray *)displayItemsWithPhotoItems:(NSArray *)photoItems
{
    NSMutableArray *displayItems = [NSMutableArray array];
    
    for (PAVPhotoItem *item in photoItems)
    {
        PAVPhotoDisplayItem *displayItem = [[PAVPhotoDisplayItem alloc] init];
        displayItem.photoID = item.photoID;
        displayItem.photo = item.previewPhoto;
        [displayItems addObject:displayItem];
    }
    
    return [NSArray arrayWithArray:displayItems];
}

- (void)photoWillAppear:(NSNumber *)photoID
{
    [self.collectionInteractor loadPhotoWithID:photoID byURL:[self previewPhotoURLByID:photoID]];
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

- (void)didLoadPhoto:(UIImage *)photo forID:(NSNumber *)photoID
{
    for (PAVPhotoItem *item in self.photoItems)
    {
        if (item.photoID.integerValue == photoID.integerValue)
        {
            item.previewPhoto = photo;
        }
    }
    
    [self receivedPhotoItems:[NSArray arrayWithArray:self.photoItems]];
}

- (void)didSelectPhotoWithID:(NSNumber *)photoID
{
    [self.collectionWireframe showDetailViewWithPhotoID:photoID inPhotoItems:self.photoItems];
}

@end

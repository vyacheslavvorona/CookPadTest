//
//  PAVCollectionViewController.m
//  photoAppVorona
//
//  Created by Vyacheslav Vorona on 08.12.16.
//  Copyright © 2016 Vyacheslav Vorona. All rights reserved.
//

#import "PAVDeviceDetector.h"
#import "PAVCollectionViewController.h"
#import "PAVPhotoCollectionViewCell.h"

static NSString *CollectionCellIdentifier = @"photoCollectionCell";
static NSString *CollectionCellNibName = @"PAVPhotoCollectionViewCell";

@interface PAVCollectionViewController () <UICollectionViewDelegate, UICollectionViewDataSource>

@end

@implementation PAVCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.eventHandler loadPhotoList];
    
    [self configureCollectionView];
}

- (void)configureCollectionView
{
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    
    UINib *cellNib = [UINib nibWithNibName:CollectionCellNibName bundle:nil];
    [self.collectionView registerNib:cellNib forCellWithReuseIdentifier:CollectionCellIdentifier];
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    CGFloat cellSide = [self getCollectionCellWidthHeight];
    [flowLayout setItemSize:CGSizeMake(cellSide, cellSide)];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    [self.collectionView setCollectionViewLayout:flowLayout];
}

- (CGFloat)getCollectionCellWidthHeight
{
    NSString *deviceName = [PAVDeviceDetector getDeviceName];
    if ([deviceName containsString:@"iPhone5"] || [deviceName containsString:@"iPhone6"])
    {
        return 130;
    }
    else if ([deviceName isEqualToString:@"iPhone7,1"] || [deviceName isEqualToString:@"iPhone8,2"])
    {
        return 180;
    }
    else if ([deviceName isEqualToString:@"iPhone7,2"] || [deviceName containsString:@"iPhone8"])
    {
        return 160;
    }
    else if ([deviceName isEqualToString:@"iPhone9,1"] || [deviceName isEqualToString:@"iPhone9,3"])
    {
        return 160;
    }
    else if ([deviceName isEqualToString:@"iPhone9,2"] || [deviceName isEqualToString:@"iPhone9,4"])
    {
        return 180;
    }
    else
    {
        return 150;
    }
}

- (void)showNoConnectionMessage
{
    [self.noConnectionMessage setHidden:NO];
}

#pragma mark - Collection View Delegate

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 100; //TODO
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    PAVPhotoCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CollectionCellIdentifier forIndexPath:indexPath];
    
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
}

@end

//
//  PAVCollectionViewController.m
//  photoAppVorona
//
//  Created by Vyacheslav Vorona on 08.12.16.
//  Copyright © 2016 Vyacheslav Vorona. All rights reserved.
//


#import "PAVCollectionViewController.h"

#import "PAVPhotoCollectionViewCell.h"
#import "PAVDeviceDetector.h"
#import "PAVPhotoDisplayItem.h"

static NSString *CollectionCellIdentifier = @"photoCollectionCell";
static NSString *CollectionCellNibName = @"PAVPhotoCollectionViewCell";

@interface PAVCollectionViewController () <UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) NSMutableArray *displayData;

@end

@implementation PAVCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.displayData = [NSMutableArray array];
    [self.eventHandler loadPhotoList];
    [self configureCollectionView];
}

- (void)reloadView
{
    [self.collectionView reloadData];
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
    
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@" " style:UIBarButtonItemStylePlain target:nil action:nil];
    [self.navigationItem setTitle:NSLocalizedString(@"Popular", @"init navigation bar title")];
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
        return 180;
    }
}

- (void)showNoConnectionMessage
{
    [self.noConnectionMessage setHidden:NO];
}

- (void)setPhotoDisplayData:(NSArray *)displayData
{
    self.displayData = [NSMutableArray arrayWithArray:displayData];
    [self reloadView];
}

#pragma mark - Collection View Delegate

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.displayData.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    PAVPhotoCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CollectionCellIdentifier forIndexPath:indexPath];
    
    PAVPhotoDisplayItem *displayItem = [self.displayData objectAtIndex:indexPath.row];
    if (!displayItem.photo)
    {
        [self.eventHandler photoWillAppear:displayItem.photoID];
    }
    else
    {
        [cell.photoImageView setImage:displayItem.photo];
    }
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    PAVPhotoDisplayItem *selectedItem = [self.displayData objectAtIndex:indexPath.row];
    [self.eventHandler didSelectPhotoWithID:selectedItem.photoID];
}

@end

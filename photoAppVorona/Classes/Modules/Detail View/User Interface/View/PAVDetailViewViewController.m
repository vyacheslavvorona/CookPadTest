//
//  PAVDetailViewViewController.m
//  photoAppVorona
//
//  Created by Vyacheslav Vorona on 08.12.16.
//  Copyright © 2016 Vyacheslav Vorona. All rights reserved.
//

#import "PAVDetailViewViewController.h"

#import "PAVPhotoDisplayItem.h"
#import "PAVPhotoCollectionViewCell.h"

static NSString *CollectionCellIdentifier = @"photoCollectionCell";
static NSString *CollectionCellNibName = @"PAVPhotoCollectionViewCell";

@interface PAVDetailViewViewController () <UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) NSMutableArray *displayData;
@property (nonatomic, strong) NSNumber *mainPhotoID;

@end

@implementation PAVDetailViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configureView];
}

- (void)viewWillAppear:(BOOL)animated
{
    [self.eventHandler detailViewWillAppear];
}

- (void)configureView
{
    self.bottomCollectionView.delegate = self;
    self.bottomCollectionView.dataSource = self;
    
    UINib *cellNib = [UINib nibWithNibName:CollectionCellNibName bundle:nil];
    [self.bottomCollectionView registerNib:cellNib forCellWithReuseIdentifier:CollectionCellIdentifier];
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    [flowLayout setItemSize:CGSizeMake(134, 134)];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    [self.bottomCollectionView setCollectionViewLayout:flowLayout];
    
    [self.navigationItem setTitle:NSLocalizedString(@"Review", @"detailed view navigation bar title")];
    
    UITapGestureRecognizer *gestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(mainPhotoTap)];
    [self.mainImageView addGestureRecognizer:gestureRecognizer];
}

- (void)reloadView
{
    [self.bottomCollectionView reloadData];
}

- (void)setPhotoDisplayData:(NSArray *)displayData
{
    self.displayData = [NSMutableArray arrayWithArray:displayData];
    [self reloadView];
}

- (void)setFullSizePhotoForID:(NSNumber *)photoID
{
    self.mainPhotoID = photoID;
    
    for (PAVPhotoDisplayItem *item in self.displayData)
    {
        if (item.photoID.integerValue == photoID.integerValue)
        {
            UIImage *photo = item.fullSizePhoto;
            [self.mainImageView setImage:photo];
            [self.activityIndicator stopAnimating];
        }
    }
}

- (void)mainPhotoTap
{
    [self.eventHandler mainPhotoTap:self.mainPhotoID];
}

#pragma mark - Collection Controller Delegate

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
    self.mainPhotoID = selectedItem.photoID;
    
    if (!selectedItem.fullSizePhoto)
    {
        [self.activityIndicator startAnimating];
        [self.eventHandler fullSizeWillAppear:selectedItem.photoID];
    }
    else
    {
        [self.mainImageView setImage:selectedItem.fullSizePhoto];
    }
}

@end

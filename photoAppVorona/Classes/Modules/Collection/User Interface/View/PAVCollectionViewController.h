//
//  PAVCollectionViewController.h
//  photoAppVorona
//
//  Created by Vyacheslav Vorona on 08.12.16.
//  Copyright © 2016 Vyacheslav Vorona. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "PAVCollectionModuleInterface.h"
#import "PAVCollectionViewInterface.h"

@interface PAVCollectionViewController : UIViewController <PAVCollectionViewInterface>

@property (nonatomic, strong) id<PAVCollectionModuleInterface> eventHandler;

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UIView *noConnectionMessage;


@end

//
//  PAVDetailViewViewController.h
//  photoAppVorona
//
//  Created by Vyacheslav Vorona on 08.12.16.
//  Copyright © 2016 Vyacheslav Vorona. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "PAVDetailViewModuleInterface.h"
#import "PAVDetailViewViewInterface.h"

@interface PAVDetailViewViewController : UIViewController <PAVDetailViewViewInterface>

@property (nonatomic, strong) id<PAVDetailViewModuleInterface> eventHandler;

@property (weak, nonatomic) IBOutlet UIImageView *mainImageView;
@property (weak, nonatomic) IBOutlet UICollectionView *bottomCollectionView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;

@end

//
//  PAVFullScreenViewController.h
//  photoAppVorona
//
//  Created by Vyacheslav Vorona on 08.12.16.
//  Copyright © 2016 Vyacheslav Vorona. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "PAVFullScreenModuleInterface.h"
#import "PAVFullScreenViewInterface.h"

@interface PAVFullScreenViewController : UIViewController <PAVFullScreenViewInterface>

@property (nonatomic, strong) id<PAVFullScreenModuleInterface> eventHandler;

@property (weak, nonatomic) IBOutlet UIImageView *backgroundImageView;
@property (weak, nonatomic) IBOutlet UIImageView *mainImageView;

@end

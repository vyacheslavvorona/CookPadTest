//
//  PAVFullScreenViewController.m
//  photoAppVorona
//
//  Created by Vyacheslav Vorona on 08.12.16.
//  Copyright © 2016 Vyacheslav Vorona. All rights reserved.
//

#import "PAVFullScreenViewController.h"

@interface PAVFullScreenViewController ()

@end

@implementation PAVFullScreenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [self.eventHandler photoWillAppear];
    [self configureView];
}

- (void)configureView
{
    UIBlurEffect *blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
    UIVisualEffectView *blurEffectView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
    blurEffectView.frame = self.backgroundImageView.bounds;
    blurEffectView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self.backgroundImageView addSubview:blurEffectView];
    
    UITapGestureRecognizer *gestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(mainPhotoTap)];
    [self.mainImageView addGestureRecognizer:gestureRecognizer];
}

- (void)setPresentedPhoto:(UIImage *)photo
{
    if (photo.size.width > photo.size.height)
    {
        photo = [[UIImage alloc] initWithCGImage: photo.CGImage scale: 1.0 orientation: UIImageOrientationRight];
    }
    
    [self.backgroundImageView setImage:photo];
    [self.mainImageView setImage:photo];
}

- (void)mainPhotoTap
{
    [self.eventHandler photoWillDisappear];
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end

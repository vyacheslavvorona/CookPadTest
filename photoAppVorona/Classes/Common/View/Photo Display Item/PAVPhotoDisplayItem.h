//
//  PAVPhotoDisplayItem.h
//  photoAppVorona
//
//  Created by Vyacheslav Vorona on 08.12.16.
//  Copyright © 2016 Vyacheslav Vorona. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface PAVPhotoDisplayItem : NSObject

@property (nonatomic, strong) NSNumber *photoID;
@property (nonatomic, strong) UIImage *photo;
@property (nonatomic, strong) UIImage *fullSizePhoto;

@end

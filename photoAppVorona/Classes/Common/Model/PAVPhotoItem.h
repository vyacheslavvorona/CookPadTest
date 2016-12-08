//
//  PAVPhotoItem.h
//  photoAppVorona
//
//  Created by Vyacheslav Vorona on 08.12.16.
//  Copyright © 2016 Vyacheslav Vorona. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface PAVPhotoItem : NSObject

@property (nonatomic, strong) NSNumber *photoID;
@property (nonatomic, strong) NSString *fullSizeURL;
@property (nonatomic, strong) NSString *previewURL;
@property (nonatomic, strong) UIImage *previewPhoto;
@property (nonatomic, strong) UIImage *fullSizePhoto;

@end

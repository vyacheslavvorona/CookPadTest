//
//  CALayer+XibConfiguration.m
//  mySelfMastery
//
//  Created by vorona on 05.08.16.
//  Copyright © 2016 Complex Systems. All rights reserved.
//

#import "CALayer+XibConfiguration.h"

@implementation CALayer(XibConfiguration)

- (void)setBorderUIColor:(UIColor*)color
{
    self.borderColor = color.CGColor;
}

- (UIColor*)borderUIColor
{
    return [UIColor colorWithCGColor:self.borderColor];
}

@end

//
//  UIColor+ASRandom.m
//  ASNotificationCenter
//
//  Created by Aleksey Anisimov on 16.03.17.
//  Copyright © 2017 Aleksey Anisimov. All rights reserved.
//

#import "UIColor+ASRandom.h"

@implementation UIColor (ASRandom)

+(UIColor *) randomColor{
    CGFloat hue = ( arc4random() % 256 / 256.0 );
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;
    return [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
}

@end

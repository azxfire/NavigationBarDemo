//
//  UIImage+UIImageConverter.m
//  Poker
//
//  Created by 王涛 on 15/5/8.
//  Copyright (c) 2015年 wangtao. All rights reserved.
//

#import "UIImage+UIImageConverter.h"

@implementation UIImage (UIImageConverter)
+(UIImage *)resizedImageWithName:(NSString *)name
{
    UIImage *image = [self imageNamed:name];
    return [image stretchableImageWithLeftCapWidth:image.size.width * 0.5 topCapHeight:image.size.height * 0.5];
}
+ (UIImage *)stretchImageWithName:(NSString *)name
{
    UIImage *image = [self imageNamed:name];
    
    UIEdgeInsets insets = UIEdgeInsetsMake(0, 2, 2, 2);
    return [image resizableImageWithCapInsets:insets resizingMode:UIImageResizingModeStretch];;
}
+ (UIImage *)reSizedImage:(UIImage *)image toSize:(CGSize)reSize{
    UIGraphicsBeginImageContext(CGSizeMake(reSize.width, reSize.height));
    [image drawInRect:CGRectMake(0, 0, reSize.width, reSize.height)];
    UIImage *reSizeImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return reSizeImage;
}
- (UIImage *)imageWithColor:(UIColor *)color {
    
    CGFloat r, g, b, a;
    if (![color getRed:&r green:&g blue:&b alpha:&a]) {
        [color getWhite:&r alpha:&a];
        g = r;
        b = r;
    }
    
    UIGraphicsBeginImageContextWithOptions(self.size, NO, [UIScreen mainScreen].scale);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetShouldAntialias(context, YES);
    
    CGAffineTransform flipVertical = CGAffineTransformMake(
                                                           1, 0, 0, -1, 0, self.size.height
                                                           );
    
    CGContextConcatCTM(context, flipVertical);
    
    CGContextSetFillColorWithColor(context, [UIColor colorWithRed:r green:g blue:b alpha:1].CGColor);
    CGRect rect = CGRectMake(0, 0, self.size.width, self.size.height);
    CGContextClipToMask(context, rect, self.CGImage);
    CGContextFillRect(context, rect);
    
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return img;
}
@end

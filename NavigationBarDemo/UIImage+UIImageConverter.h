//
//  UIImage+UIImageConverter.h
//  Poker
//
//  Created by 王涛 on 15/5/8.
//  Copyright (c) 2015年 wangtao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (UIImageConverter)
/**
 *	@author wangtao, 15-05-08 17:05:43
 *
 *	@brief  返回一张自由拉伸的图片，直接拉伸，没有保护区域
 *
 */
+(UIImage *)resizedImageWithName:(NSString *)name;
/**
 *	@author wangtao, 15-05-08 17:05:03
 *
 *	@brief  返回一张自由拉伸的图片，只拉伸中间的一个像素
 *
 */
+ (UIImage *)stretchImageWithName:(NSString *)name;
+ (UIImage *)reSizedImage:(UIImage *)image toSize:(CGSize)reSize;
- (UIImage *)imageWithColor:(UIColor *)color;
@end

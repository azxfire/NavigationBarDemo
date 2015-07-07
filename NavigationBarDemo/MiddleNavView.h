//
//  MiddleNavView.h
//  NavigationBarDemo
//
//  Created by taowang on 15/7/6.
//  Copyright © 2015年 Plague. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MiddleNavView : UIView
@property(nonatomic, copy) void (^didTapLeftBlock)(void);
@property(nonatomic, copy) void (^didTapRightBlock)(void);
@end

//
//  LeftNotifyViewController.h
//  NavigationBarDemo
//
//  Created by taowang on 15/7/7.
//  Copyright © 2015年 Plague. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LeftNotifyViewController : UIViewController
@property(nonatomic, copy) void (^willCloseBlock)(void);
- (void)presentInViewController:(UIViewController *)viewController;
@end

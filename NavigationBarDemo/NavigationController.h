//
//  NavigationController.h
//  
//
//  Created by taowang on 15/7/6.
//
//

#import <UIKit/UIKit.h>
@class NavigationBar;
@protocol PresentableViewController <NSObject>
@optional
-(void)willPresentWithNavigationBar:(NavigationBar *)navigationBar;
@end
@interface NavigationController : UINavigationController

@end

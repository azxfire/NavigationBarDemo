//
//  NavigationBar.h
//  
//
//  Created by taowang on 15/7/6.
//
//

#import <UIKit/UIKit.h>
@class MiddleNavView,LeftNavView,RightNavView;
@interface NavigationBar : UINavigationBar
@property (nonatomic, readonly) MiddleNavView* middleNavView;
@property (nonatomic, readonly) LeftNavView  * leftNavView;
@property (nonatomic, readonly) RightNavView * rightNavView;


- (void)switchToMiddleNavView;
- (void)switchToMiddleNavViewAnimated:(BOOL)animated;

- (void)switchToLeftNavView;
- (void)switchToLeftNavViewAnimated:(BOOL)animated;

- (void)switchToRightNavView;
- (void)switchToRightNavViewAnimated:(BOOL)animated;
@end

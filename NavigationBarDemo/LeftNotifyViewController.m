//
//  LeftNotifyViewController.m
//  NavigationBarDemo
//
//  Created by taowang on 15/7/7.
//  Copyright © 2015年 Plague. All rights reserved.
//

#import "LeftNotifyViewController.h"
#import "NavigationBar.h"
#import "NavigationController.h"
#import "LeftNavView.h"
#import "Define.h"
@interface LeftNotifyViewController()<PresentableViewController>
@property (nonatomic, strong) UIView *contentView;
@end
@implementation LeftNotifyViewController
{
    UIDynamicAnimator *animator_;
    __weak NavigationBar *_navigationBar;
}
-(void)willPresentWithNavigationBar:(NavigationBar *)navigationBar
{
    _navigationBar = navigationBar;
    _navigationBar.leftNavView.didTapCloseBlock = ^{
        [self didTapClose:nil];
    };
    [_navigationBar switchToLeftNavView];
}
- (void)didTapClose:(id)sender
{
    [self fadeViewControllerAnimated:YES completion:^{
        [self closeViewController];
    }];
    
}
- (void)closeViewController {
    [self willMoveToParentViewController:nil];
    [self.view removeFromSuperview];
    [self removeFromParentViewController];
}
- (void)fadeViewControllerAnimated:(BOOL)animated completion:(void (^)(void))completion
{
    if (animator_.running == YES) {
        [animator_ removeAllBehaviors];
    }
    if (_willCloseBlock) _willCloseBlock();
    CGRect contentViewFrame = self.contentView.frame;
    contentViewFrame.origin.y = -self.view.frame.size.height;
    CGFloat duration =  animated ? 0.3f : 0.f;
    [UIView animateWithDuration:duration
                          delay:0.0f
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         self.contentView.frame = contentViewFrame;
                     } completion:^(BOOL finished) {
                         if (completion) completion();
                     }];
}
-(void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor clearColor];
    
    self.contentView = [[UIView alloc] initWithFrame:CGRectMake(0, -self.view.frame.size.height, KScreenWidth, self.view.frame.size.height)];
    self.contentView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.contentView];
    animator_ = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
}
//添加自定义的展示view的方法
- (void)presentInViewController:(UIViewController *)viewController
{
    if (viewController) {
        [viewController addChildViewController:self];
        self.view.frame = viewController.view.frame;
        [viewController.view addSubview:self.view];
        [self didMoveToParentViewController:viewController];
    }
    UIPushBehavior *push = [[UIPushBehavior alloc] initWithItems:@[self.contentView] mode:UIPushBehaviorModeContinuous];
    push.pushDirection = CGVectorMake(0, 1);
    push.magnitude = 60.0f;
    
    [animator_ addBehavior:push];
    
    UICollisionBehavior *collision = [[UICollisionBehavior alloc] initWithItems:@[self.contentView]];
    [collision addBoundaryWithIdentifier:@"wall" fromPoint:CGPointMake(0, self.view.frame.size.height + 1) toPoint:CGPointMake(320, self.view.frame.size.height + 1)];
    [animator_ addBehavior:collision];
    
    UIDynamicItemBehavior *behavior = [[UIDynamicItemBehavior alloc] initWithItems:@[self.contentView]];
    behavior.density = 0.0f;
    [animator_ addBehavior:behavior];
    
    double delayInSeconds = 0.7;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        //        [self refresh:NO];
    });
}
@end

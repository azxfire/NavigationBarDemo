//
//  NavigationController.m
//  
//
//  Created by taowang on 15/7/6.
//
//

#import "NavigationController.h"
#import "NavigationBar.h"
@interface NavigationController ()<UINavigationControllerDelegate>

@end

@implementation NavigationController

-(instancetype)init
{
    self = [super initWithNavigationBarClass:[NavigationBar class] toolbarClass:nil];
    if (self) {
        self.delegate = self;
    }
    return self;
}
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    CATransition* transition = [CATransition animation];
    
    transition.duration = .3f;
    transition.type = kCATransitionFade;
    
    [self.view.layer addAnimation:transition forKey:kCATransition];
    [super pushViewController:viewController animated:animated];
}

- (UIViewController *)popViewControllerAnimated:(BOOL)animated {
    CATransition* transition = [CATransition animation];
    
    transition.duration = animated ? 0.3f : 0.f;;
    transition.type = kCATransitionFade;
    
    [self.view.layer addAnimation:transition forKey:kCATransition];
    
    UIViewController *ret = [super popViewControllerAnimated:animated];
    
    return ret;
}
-(void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if ([viewController conformsToProtocol:@protocol(PresentableViewController)]) {
        UIViewController<PresentableViewController> *vc = (UIViewController<PresentableViewController> *)viewController;
        if ([vc respondsToSelector:@selector(willPresentWithNavigationBar:)]) {
            [vc willPresentWithNavigationBar:(NavigationBar *)self.navigationBar];
        }
    }
}


@end

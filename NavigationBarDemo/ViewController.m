//
//  ViewController.m
//  NavigationBarDemo
//
//  Created by taowang on 15/7/6.
//  Copyright (c) 2015年 Plague. All rights reserved.
//

#import "ViewController.h"
#import "NavigationBar.h"
#import "MiddleNavView.h"
#import "NavigationController.h"
#import "LeftNotifyViewController.h"
@interface ViewController ()<PresentableViewController>

@end

@implementation ViewController
{
    __weak NavigationBar *_navigationBar;
}
-(void)willPresentWithNavigationBar:(NavigationBar *)navigationBar
{
    _navigationBar = navigationBar;
    [_navigationBar switchToMiddleNavView];
    _navigationBar.middleNavView.didTapLeftBlock = ^{
        [self left:nil];
    };
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    // Do any additional setup after loading the view, typically from a nib.
}
- (void)left:(id)sender
{
    LeftNotifyViewController *notifyvc = [[LeftNotifyViewController alloc] init];
    if ([notifyvc conformsToProtocol:@protocol(PresentableViewController)]) {
        UIViewController<PresentableViewController> *vc =
        (UIViewController<PresentableViewController> *)notifyvc;
        if ([vc respondsToSelector:@selector(willPresentWithNavigationBar:)]) {
            [vc willPresentWithNavigationBar:_navigationBar];
        }
    }
    notifyvc.willCloseBlock = ^{
        [_navigationBar switchToMiddleNavView];
    };
    [notifyvc presentInViewController:self];
    
}

@end

//
//  NavigationBar.m
//  
//
//  Created by taowang on 15/7/6.
//
//

#import "NavigationBar.h"
#import "MiddleNavView.h"
#import "LeftNavView.h"
#import "RightNavView.h"
@implementation NavigationBar

{
    BOOL _laidOut;
}
-(instancetype)init
{
    return [self initWithFrame:CGRectZero];
}
-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createView];
    }
    return self;
}
-(void)createView
{
    _middleNavView = [[MiddleNavView alloc]init];
    [self addSubview:_middleNavView];
    
    _leftNavView = [[LeftNavView alloc]init];
    _leftNavView.alpha = 0.0f;
    _leftNavView.hidden = YES;
    [self addSubview:_leftNavView];
    
    _rightNavView = [[RightNavView alloc]init];
    _rightNavView.alpha = 0.0f;
    _rightNavView.hidden = YES;
    [self addSubview:_rightNavView];

}
-(void)layoutSubviews
{
    [super layoutSubviews];
    if (!_laidOut) {
        _middleNavView.frame = self.bounds;
        _leftNavView.frame = self.bounds;
        _rightNavView.frame = self.bounds;
    }
    _laidOut = YES;
}
-(void)switchToMiddleNavView
{
    [self switchToMiddleNavViewAnimated:YES];
}
-(void)switchToMiddleNavViewAnimated:(BOOL)animated
{
    [self animateMiddleNavVisible:YES animate:animated];
    [self animateLeftNavVisible:NO animate:animated];
    [self animateRightNavVisible:NO animate:animated];
}
-(void)switchToLeftNavView
{
    [self switchToLeftNavViewAnimated:YES];
}
-(void)switchToLeftNavViewAnimated:(BOOL)animated
{
    [self animateMiddleNavVisible:NO animate:animated];
    [self animateLeftNavVisible:YES animate:animated];
    [self animateRightNavVisible:NO animate:animated];
}
-(void)switchToRightNavView
{
    [self switchToRightNavViewAnimated:YES];
}
-(void)switchToRightNavViewAnimated:(BOOL)animated
{
    [self animateMiddleNavVisible:NO animate:animated];
    [self animateLeftNavVisible:NO animate:animated];
    [self animateRightNavVisible:YES animate:animated];
}
- (void)animateMiddleNavVisible:(BOOL)visible animate:(BOOL)animate {
    if (visible && _middleNavView.hidden) {
        _middleNavView.alpha = 0.f;
        _middleNavView.hidden = NO;
    }
    
    CGFloat duration = animate ? 0.3f : 0.f;
    [UIView animateWithDuration:duration delay:0.f options:UIViewAnimationOptionBeginFromCurrentState animations:^{
        if (visible) {
            _middleNavView.alpha = 1.f;
            _middleNavView.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.f, 1.f);
        } else {
            _middleNavView.alpha = 0.f;
            _middleNavView.transform = CGAffineTransformScale(CGAffineTransformIdentity, .8f, .8f);
        }
    } completion:^(BOOL finished) {
        _middleNavView.hidden = !visible;
    }];
}
- (void)animateLeftNavVisible:(BOOL)visible animate:(BOOL)animate {
    if (visible && _leftNavView.hidden) {
        _leftNavView.alpha = 0.f;
        _leftNavView.hidden = NO;
    }
    
    CGFloat duration = animate ? 0.3f : 0.f;
    [UIView animateWithDuration:duration delay:0.f options:UIViewAnimationOptionBeginFromCurrentState animations:^{
        _leftNavView.alpha = visible ? 1.f : 0.f;
    } completion:^(BOOL finished) {
        _leftNavView.hidden = !visible;
    }];
}
- (void)animateRightNavVisible:(BOOL)visible animate:(BOOL)animate {
    if (visible && _rightNavView.hidden) {
        _rightNavView.alpha = 0.f;
        _rightNavView.hidden = NO;
    }
    
    CGFloat duration = animate ? 0.3f : 0.f;
    [UIView animateWithDuration:duration delay:0.f options:UIViewAnimationOptionBeginFromCurrentState animations:^{
        _rightNavView.alpha = visible ? 1.f : 0.f;
    } completion:^(BOOL finished) {
        _rightNavView.hidden = !visible;
    }];
    
}
@end

//
//  MiddleNavView.m
//  NavigationBarDemo
//
//  Created by taowang on 15/7/6.
//  Copyright © 2015年 Plague. All rights reserved.
//

#import "MiddleNavView.h"
#import "Define.h"
#import "UIImage+UIImageConverter.h"
@implementation MiddleNavView
{
    UIButton *_leftButton;
    UIButton *_rightButton;
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
    _leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_leftButton setImage:[[UIImage imageNamed:@"avatar-poo"] imageWithColor:[UIColor blackColor]]forState:UIControlStateNormal];
    [_leftButton addTarget:self action:@selector(didTapLeft:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_leftButton];
    
    
    _rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_rightButton setImage:[[UIImage imageNamed:@"avatar-rocket"] imageWithColor:[UIColor blackColor]]forState:UIControlStateNormal];
    [_rightButton addTarget:self action:@selector(didTapRight:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_rightButton];
}
-(void)layoutSubviews
{
    _leftButton.frame = ({
        [_leftButton sizeToFit];
        CGRect frame = _leftButton.frame;
        frame.origin.x = 0;
        frame.origin.y = (self.bounds.size.height - frame.size.height) / 2.f;
        frame;
    });
    
    _rightButton.frame = ({
        [_rightButton sizeToFit];
        CGRect frame = _rightButton.frame;
        frame.origin.x = KScreenWidth-36;
        frame.origin.y = (self.bounds.size.height - frame.size.height) / 2.f;
        frame;
    });
}
-(void)didTapLeft:(id)sender
{
    if (_didTapLeftBlock) _didTapLeftBlock();
}
-(void)didTapRight:(id)sender
{
    if (_didTapRightBlock) _didTapRightBlock();
}
@end

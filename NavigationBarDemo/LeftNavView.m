//
//  LeftNavView.m
//  
//
//  Created by taowang on 15/7/6.
//
//

#import "LeftNavView.h"
#import "UIImage+UIImageConverter.h"
#import "Define.h"
@implementation LeftNavView
{
    UIButton *_closeButton;
}
- (instancetype)init {
    return [self initWithFrame:CGRectZero];
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self createView];
    }
    return self;
}
-(void)createView
{
//    [self buildNavImgBtn:IMG(icon_closew) position:CGPointMake(0.0f, self.bounds.size.height+10) target:self action:@selector(left:)];
    
    _closeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_closeButton setImage:[[UIImage imageNamed:@"icon_closeb"] imageWithColor:[UIColor blackColor]]forState:UIControlStateNormal];
    [_closeButton addTarget:self action:@selector(left:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_closeButton];
    
    UILabel* title = [[UILabel alloc] initWithFrame:CGRectMake(0.0f, 0.0f, KScreenWidth, 44.0f)];
    title.backgroundColor = [UIColor clearColor];
    title.textAlignment = NSTextAlignmentCenter;
    title.text = @"通知";
    title.textColor = [UIColor blackColor];
    title.font = [UIFont systemFontOfSize:19];
    [self addSubview:title];
    
}
-(void)layoutSubviews
{
    _closeButton.frame = ({
        [_closeButton sizeToFit];
        CGRect frame = _closeButton.frame;
        frame.origin.x = 5;
        frame.origin.y = (self.bounds.size.height - frame.size.height) / 2.f;
        frame;
    });
}
- (void) left:(UIButton*)sender
{
    if (_didTapCloseBlock) _didTapCloseBlock();
}

@end

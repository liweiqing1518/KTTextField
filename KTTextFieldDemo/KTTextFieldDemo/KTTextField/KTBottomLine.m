//
//  KTBottomLine.m
//  KTTextFieldDemo
//
//  Created by Vincent on 2017/6/8.
//  Copyright © 2017年 李维庆. All rights reserved.
//

#import "KTBottomLine.h"

@interface KTBottomLine ()
@property (strong, nonatomic) UIView *progressLine;
@end

@implementation KTBottomLine

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.progressLine];
        //默认背景 亮灰色
        self.backgroundColor = [UIColor lightGrayColor];
    }
    return self;
}
//进度条
- (UIView *)progressLine{
    if (!_progressLine) {
        _progressLine = [[UIView alloc] initWithFrame:CGRectMake(0, -1, 1, self.frame.size.height+2)];
        //默认蓝色
        _progressLine.backgroundColor = [UIColor blueColor];
    }
    return _progressLine;
}

//设置前景色
- (void)setTintColor:(UIColor *)tintColor{
    self.progressLine.backgroundColor = tintColor;
}

- (void)shortenAnimation{
    CABasicAnimation *basic = [CABasicAnimation animationWithKeyPath: @"transform.scale.x"];
    [self.progressLine.layer setAnchorPoint: CGPointMake(0, 0.5)];
    basic.duration = 0.3;
    basic.repeatCount = 1;
    basic.removedOnCompletion = NO;
    basic.fromValue = [NSNumber numberWithFloat:self.frame.size.width];
    basic.toValue = [NSNumber numberWithFloat:1];
    basic.fillMode = kCAFillModeForwards;
    basic.timingFunction = [CAMediaTimingFunction functionWithName: kCAMediaTimingFunctionEaseIn];
    [self.progressLine.layer addAnimation: basic forKey: nil];
}

- (void)elongationAnimation{
    CABasicAnimation *basic = [CABasicAnimation animationWithKeyPath: @"transform.scale.x"];
    [self.progressLine.layer setAnchorPoint: CGPointMake(0, 0.5)];
    basic.duration = 0.3;
    basic.repeatCount = 1;
    basic.removedOnCompletion = NO;
    basic.fromValue = [NSNumber numberWithFloat:1];
    basic.toValue = [NSNumber numberWithFloat:self.frame.size.width];
    basic.fillMode = kCAFillModeForwards;
    basic.timingFunction = [CAMediaTimingFunction functionWithName: kCAMediaTimingFunctionEaseIn];
    [self.progressLine.layer addAnimation: basic forKey: nil];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

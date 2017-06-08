//
//  KTTextField.m
//  KTTextFieldDemo
//
//  Created by Vincent on 2017/6/8.
//  Copyright © 2017年 李维庆. All rights reserved.
//

#import "KTTextField.h"
#import "KTBottomLine.h"
#define WS(weakSelf) __weak __typeof(&*self) weakSelf = self;

@interface KTTextField ()
//显示左边图片的imageView
@property (strong, nonatomic) UIImageView *leftImageView;
//显示右边图片的imageView
@property (strong, nonatomic) UIImageView *rightImageView;
//显示输入框占位符的label
@property (strong, nonatomic) UILabel *placeHolderLabel;
//底部的线条视图
@property (strong, nonatomic) KTBottomLine *bottomLine;
//输入是否为空
@property (assign, nonatomic) BOOL isIputNull;

@end

@implementation KTTextField

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.isIputNull = YES;//默认没有输入
        //添加控件
        [self addSubview:self.leftImageView];
        [self addSubview:self.rightImageView];
        [self addSubview:self.placeHolderLabel];
        [self addSubview:self.inputTextField];
        [self addSubview:self.bottomLine];
    }
    return self;
}

//懒加载
- (UIImageView *)leftImageView{
    if (!_leftImageView) {
        _leftImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 5, 30, 30)];
        _leftImageView.backgroundColor = [UIColor clearColor];
        [_leftImageView setContentMode:UIViewContentModeScaleAspectFit];
    }
    return _leftImageView;
}

- (UIImageView *)rightImageView{
    if (!_rightImageView) {
        _rightImageView = [[UIImageView alloc] initWithFrame:CGRectMake(self.frame.size.width - 30, 5, 30, 30)];
        _rightImageView.backgroundColor = [UIColor clearColor];
        [_rightImageView setContentMode:UIViewContentModeScaleAspectFit];
    }
    return _rightImageView;
}

- (UILabel *)placeHolderLabel{
    if (!_placeHolderLabel) {
        _placeHolderLabel = [[UILabel alloc] initWithFrame:CGRectMake(45, 5, self.frame.size.width - 90, 30)];
        _placeHolderLabel.backgroundColor = [UIColor clearColor];
        //字体默认灰色
        _placeHolderLabel.textColor = [UIColor grayColor];
        _placeHolderLabel.textAlignment = NSTextAlignmentLeft;
        //默认大小15
        _placeHolderLabel.font = [UIFont systemFontOfSize:15.0];
    }
    return _placeHolderLabel;
}

- (UITextField *)inputTextField{
    if (!_inputTextField) {
        _inputTextField = [[UITextField alloc] initWithFrame:CGRectMake(40, 5, self.frame.size.width - 80, 30)];
        _inputTextField.backgroundColor = [UIColor clearColor];
        _inputTextField.borderStyle = UITextBorderStyleNone;
        _inputTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
        [_inputTextField addTarget:self action:@selector(observeTextFieldEditBegin:) forControlEvents:UIControlEventEditingDidBegin];
        [_inputTextField addTarget:self action:@selector(observeTextFieldIsEditing:) forControlEvents:UIControlEventEditingChanged];
        [_inputTextField addTarget:self action:@selector(observeTextFieldEditEnded:) forControlEvents:UIControlEventEditingDidEnd];
    }
    return _inputTextField;
}

//监听输入框开始编辑
- (void)observeTextFieldEditBegin:(UITextField *)textField{
    [self placeHolderLabelAnimationUp];
}
//监听输入框正在边界
- (void)observeTextFieldIsEditing:(UITextField *)textField{}
//监听输入框结束编辑
- (void)observeTextFieldEditEnded:(UITextField *)textField{
    if (textField.text.length == 0) {
        self.isIputNull = YES;
        [self placeHolderLabelAnimationDown];
    }
}


- (KTBottomLine *)bottomLine{
    if (!_bottomLine) {
        _bottomLine = [[KTBottomLine alloc] initWithFrame:CGRectMake(40, 36, self.frame.size.width - 80, 1)];
    }
    return _bottomLine;
}

#pragma mark- 属性设置
- (void)setPlaceHolderStr:(NSString *)placeHolderStr{
    self.placeHolderLabel.text = placeHolderStr;
}

- (void)setLeftImage:(UIImage *)leftImage{
    self.leftImageView.image = leftImage;
}

- (void)setRightImage:(UIImage *)rightImage{
    self.rightImageView.image = rightImage;
}

- (void)setProgressTintColor:(UIColor *)progressTintColor{
    self.bottomLine.tintColor = progressTintColor;
}

- (void)setProgressBackColor:(UIColor *)progressBackColor{
    self.bottomLine.backgroundColor = progressBackColor;
}

#pragma mark- 动画效果
/**
 占位字符上滑动画
 */
- (void)placeHolderLabelAnimationUp{
    if (self.isIputNull) {
        self.isIputNull = NO;
        WS(weakSelf)
        [UIView animateWithDuration:0.3 animations:^{
            weakSelf.placeHolderLabel.frame = CGRectMake(45, -30, self.frame.size.width - 90, 30);
            weakSelf.placeHolderLabel.font = [UIFont systemFontOfSize:12.0];
        }];
        [self.bottomLine elongationAnimation];
    }
}


/**
 占位字符下滑动画
 */
- (void)placeHolderLabelAnimationDown{
    WS(weakSelf)
    [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        weakSelf.placeHolderLabel.frame = CGRectMake(45, 5, self.frame.size.width - 90, 30);
        weakSelf.placeHolderLabel.font = [UIFont systemFontOfSize:15.0];
    } completion:nil];
    [self.bottomLine shortenAnimation];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

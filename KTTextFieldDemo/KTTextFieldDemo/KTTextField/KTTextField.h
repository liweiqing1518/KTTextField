//
//  KTTextField.h
//  KTTextFieldDemo
//
//  Created by Vincent on 2017/6/8.
//  Copyright © 2017年 李维庆. All rights reserved.
//

#import <UIKit/UIKit.h>
//默认的视图高度是 40
#define KTTextFieldHeight 40

@interface KTTextField : UIView

//中间的输入框
@property (strong, nonatomic) UITextField *inputTextField;

/**
 占位字符
 */
@property (strong, nonatomic) NSString *placeHolderStr;
/**
 左边的图片
 */
@property (strong, nonatomic) UIImage *leftImage;

/**
 右边的图片
 */
@property (strong, nonatomic) UIImage *rightImage;

/**
 进入条的前景色
 */
@property (strong, nonatomic) UIColor *progressTintColor;

/**
 进度条的背景色
 */
@property (strong, nonatomic) UIColor *progressBackColor;
@end

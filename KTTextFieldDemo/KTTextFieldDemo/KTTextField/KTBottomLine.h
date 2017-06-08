//
//  KTBottomLine.h
//  KTTextFieldDemo
//
//  Created by Vincent on 2017/6/8.
//  Copyright © 2017年 李维庆. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KTBottomLine : UIView


@property (strong, nonatomic) UIColor *tintColor;

/**
 缩短动画
 */
- (void)shortenAnimation;

/**
 伸长动画
 */
- (void)elongationAnimation;
@end

//
//  HXSlideView.h
//  XMNiao_Shop
//
//  Created by huangxiong on 8/26/15.
//  Copyright (c) 2015 HuangXiong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIViewExt.h"

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]


@protocol HXSlideViewDelegate;

@interface HXSlideView : UIView

// 背景视图
@property (nonatomic, strong) UIView *backgroundView;

// 选中部分视图
@property (nonatomic, strong) UIView *selectView;

// 未选中部分
@property (nonatomic, strong) UIView *unSelectView;

@property (nonatomic, strong) UIView *indicatorView;

// 代理协议
@property (nonatomic, strong) id<HXSlideViewDelegate> delegate;

- (instancetype)initWithFrame:(CGRect)frame;

- (void) setSelectViewColor: (UIColor *)color;

- (void) setUnSelectViewColor: (UIColor *)color;

- (void) setIndicatorColor: (UIColor *)color;

- (void) setIndicatorValue: (NSInteger) value;

@end

@protocol HXSlideViewDelegate <NSObject>

@optional

// 回传百分比
- (void) slideView: (HXSlideView *) slideView slideValue: (NSInteger) value;

@end

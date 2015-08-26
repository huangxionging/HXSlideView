//
//  HXSlideView.m
//  XMNiao_Shop
//
//  Created by huangxiong on 8/26/15.
//  Copyright (c) 2015 Luo. All rights reserved.
//

#import "HXSlideView.h"



@implementation HXSlideView
{
    CGFloat _perPointValue;
    
    NSInteger _minValue;
    
    NSInteger _maxValue;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self) {
        
        _backgroundView = [[UIView alloc] initWithFrame: CGRectMake(0, self.height / 2 - 2, self.width, 4)];
        _backgroundView.layer.masksToBounds = YES;
        _backgroundView.layer.cornerRadius = 2;
        _backgroundView.layer.borderWidth = 0.1;
        _backgroundView.backgroundColor = [UIColor clearColor];
        _backgroundView.layer.borderColor = UIColorFromRGB(0x999999).CGColor;
        [self addSubview: _backgroundView];
        
        // 每点的百分值
        _perPointValue = _backgroundView.width / 100.0f;
        _minValue = 0;
        _maxValue = 100;
        
        _selectView = [[UIView alloc] initWithFrame: _backgroundView.bounds];
        _selectView.layer.masksToBounds = YES;
        _selectView.layer.cornerRadius = 2;
        _selectView.backgroundColor = [UIColor blueColor];
        [_backgroundView addSubview: _selectView];
        
        _unSelectView = [[UIView alloc] initWithFrame: _backgroundView.bounds];
        _unSelectView.backgroundColor = [UIColor grayColor];
        _unSelectView.layer.masksToBounds = YES;
        _unSelectView.layer.cornerRadius = 2;
        [_backgroundView addSubview: _unSelectView];
        
        
        _indicatorView = [[UIView alloc] initWithFrame: CGRectMake(0, _backgroundView.top, self.height, self.height)];
        _indicatorView.center = CGPointMake(0, _backgroundView.center.y);
        _indicatorView.layer.masksToBounds = YES;
        _indicatorView.layer.cornerRadius = _indicatorView.height / 2;
        _indicatorView.backgroundColor = [UIColor blueColor];
        
        [_indicatorView addGestureRecognizer: [[UIPanGestureRecognizer alloc] initWithTarget:self action: @selector(valueChanged:)]];
    
        [self addSubview: _indicatorView];
        
    }
    
    return self;
}

- (void) valueChanged: (UIPanGestureRecognizer *)gesture {
    
    CGPoint locationPoint = [gesture locationInView: self];
    CGFloat pointX = (NSInteger)(locationPoint.x / _perPointValue) * _perPointValue;
   
    if (gesture.state == UIGestureRecognizerStateChanged) {
        if (pointX >= (_minValue * _perPointValue)  && pointX <= (_maxValue * _perPointValue)) {
            
            CGFloat pointX = (NSInteger)(locationPoint.x / _perPointValue) * _perPointValue;
            gesture.view.center = CGPointMake(pointX, gesture.view.center.y);
            
            _selectView.right = pointX;
            
            _unSelectView.left = pointX;
            
            // 回传值
            if (self.delegate && [self.delegate respondsToSelector: @selector(slideView:slideValue:)]) {
                [self.delegate slideView: self slideValue: (NSInteger)(locationPoint.x / _perPointValue)];
            }
        }
    }
    
    
}

- (void) setSelectViewColor: (UIColor *)color {
    _selectView.backgroundColor = color;
}

- (void) setUnSelectViewColor: (UIColor *)color {
    _unSelectView.backgroundColor = color;
}

- (void) setIndicatorColor: (UIColor *)color {
    _indicatorView.backgroundColor = color;
}

- (void)setIndicatorValue:(NSInteger)value {
    
    // 设置初始值
    CGFloat pointX = value * _perPointValue;
    _indicatorView.center = CGPointMake(pointX, _indicatorView.center.y);
    _selectView.right = pointX;
    _unSelectView.left = pointX;
}


@end

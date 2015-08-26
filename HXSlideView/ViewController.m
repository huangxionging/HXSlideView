//
//  ViewController.m
//  HXSlideView
//
//  Created by huangxiong on 8/26/15.
//  Copyright (c) 2015 New_Life. All rights reserved.
//

#import "ViewController.h"
#import "HXSlideView.h"

@interface ViewController () <HXSlideViewDelegate>
{
    HXSlideView *_slideView;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    _slideView = [[HXSlideView alloc] initWithFrame: CGRectMake(60, 40, self.view.width - 120, 30)];
    _slideView.delegate = self;
    
    [_slideView setSelectViewColor: UIColorFromRGB(0x2DB0FB)];
    
    [_slideView setIndicatorColor: UIColorFromRGB(0x2DB0FB)];
    
    [_slideView setUnSelectViewColor: UIColorFromRGB(0xF1F1F1)];
    
    [self.view addSubview: _slideView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)slideView:(HXSlideView *)slideView slideValue:(NSInteger)value {
    NSLog(@"%ld", value);
}

@end

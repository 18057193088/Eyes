//
//  YUHomeViewController.h
//  EyesApp
//
//  Created by 叶夏云 on 15/6/22.
//  Copyright (c) 2015年 叶夏云. All rights reserved.
//

#import "YUFatherViewController.h"

@class YUGreeButton;

#import "YUGridView.h"

@interface YUHomeViewController : YUFatherViewController<YUGirdViewDeledge>

@property(strong,nonatomic) YUGridView * yGirdView;
@property (weak, nonatomic) IBOutlet UIScrollView *yScrollView;
@property (weak, nonatomic) IBOutlet UILabel *yTwetyThreeLable;


@property(strong,nonatomic) YUGreeButton * yStartButton;

@end

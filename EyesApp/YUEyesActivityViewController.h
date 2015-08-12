//
//  YUEyesActivityViewController.h
//  EyesApp
//
//  Created by 叶夏云 on 15/7/26.
//  Copyright (c) 2015年 叶夏云. All rights reserved.
//

#import "YUFatherViewController.h"
#import "YUCircleButton.h"
#import "YUButtonGroup.h"

@interface YUEyesActivityViewController : YUFatherViewController<YUCircleButtonDeledge,YUButtonGroupDeledge>
@property(strong,nonatomic) UIImageView* yEyesBallImageView;
@property(strong,nonatomic) UIImageView* yRightEyesBallImageView;
@property(strong,nonatomic) YUCircleButton * yStartButton;
@property(strong,nonatomic) UILabel * yTipLabel;
@property(strong,nonatomic) YUButtonGroup * yButtonGroup;

@property(strong,nonatomic) UIImageView * yLeftArrrow;
@property(strong,nonatomic) UIImageView * yRightArrrow;
@end

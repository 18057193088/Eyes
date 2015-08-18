//
//  YUEyesTestViewController.h
//  EyesApp
//
//  Created by yxy on 15/8/16.
//  Copyright (c) 2015年 叶夏云. All rights reserved.
//

#import "YUFatherViewController.h"
#import "YUEyeTestButton.h"

@class YUEyeTestButton;

@interface YUEyesTestViewController : YUFatherViewController<YUEyeTestButtonDeledge>
@property(strong,nonatomic) YUEyeTestButton * yCtestButton ;
@property(strong,nonatomic) YUEyeTestButton * yColorTestButton;
@property(strong,nonatomic) UILabel * tipLabel;

@end

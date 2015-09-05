//
//  YUCTestViewController.h
//  EyesApp
//
//  Created by yxy on 15/8/18.
//  Copyright (c) 2015年 叶夏云. All rights reserved.
//

#import "YUFatherViewController.h"
@class YUMiniNumButtonGroup;
@class YUCTestTipView;
typedef  NS_ENUM(NSInteger, YUDirction){
    YUDirctionUp,
    YUDirctionDown,
    YUDirctionLeft,
    YUDirctionRight,
    YUDirctionNone

};

@interface YUCTestViewController : YUFatherViewController
@property(strong,nonatomic) UIView * yCircleView;
@property(strong,nonatomic) UIImageView * yCview;
@property(strong,nonatomic) YUMiniNumButtonGroup * yMiniButtonGroup;
@property(strong,nonatomic) YUCTestTipView * yTestTipView;
@property(assign,nonatomic) YUDirction yCurDiction;

@end

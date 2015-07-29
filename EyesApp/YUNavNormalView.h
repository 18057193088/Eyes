//
//  YUNavNormalView.h
//  YUANBAOAPP
//
//  Created by yxy on 14-9-3.
//  Copyright (c) 2014年 ATAW. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "CONST_PUBLIE.h"

@interface YUNavNormalView : UIView
@property(strong,nonatomic) UIButton * backView;

@property(strong,nonatomic) UILabel * titleView ;

@property(strong,nonatomic) UIButton  * rightButton;

@property(strong,nonatomic) none_return_callback whenGouBackTouch;
@property(strong,nonatomic) none_return_callback rightButtonTouch;

-(id)initDefault;
-(void)setNavItem:(NSString *)titleName IsShowBackView:(BOOL)isShow;
-(void)addRightItem:(NSString *)titleNmae whenRightItemTouch:(none_return_callback)touch ;

@end

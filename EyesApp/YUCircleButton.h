//
//  YUCircleButton.h
//  EyesApp
//
//  Created by yxy on 15/7/29.
//  Copyright (c) 2015年 叶夏云. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol YUCircleButtonDeledge <NSObject>

-(void)whenCircleButtonTouchUpInSide;


@end
@interface YUCircleButton : UIView
@property(strong,nonatomic) UIView *yCenterView;
@property(strong,nonatomic) UIImageView * yIconView;
@property(strong,nonatomic) UILabel * yTitleLabel ;
@property(strong,nonatomic) UIButton * yOutButton;
@property(weak,nonatomic) id <YUCircleButtonDeledge> deledge ;

-(id)initWithIcon:(UIImage *)ima title:(NSString *)title width:(float)width ;
-(void)blackStyle;

-(void)setTitle:(NSString *)title;


@end

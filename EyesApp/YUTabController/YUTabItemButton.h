//
//  YUTabItemButton.h
//  YUTabController
//
//  Created by yxy on 15/1/26.
//  Copyright (c) 2015年 XIAYUN.YE. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol  YUTabItemButtonDeldge <NSObject>

@optional

-(void)ButtonTounUpInsideWithIndex:(int )index ;


@end

@interface YUTabItemButton : UIView


@property(strong,nonatomic) UIButton * fullButton;
@property(assign,nonatomic) int index ;
@property(weak,nonatomic) id <YUTabItemButtonDeldge> deledge ;

@property(strong,nonatomic) UIImageView * yIconImageView;
@property(strong,nonatomic) UILabel * yButtonTitle;
@property(assign,nonatomic) CGRect iconImageViewFrame;
@property(assign,nonatomic) CGRect yButtonTitleFrame;
@property(weak,nonatomic) UIImage * image;
@property(weak,nonatomic) UIImage * image_s;

@property(weak,nonatomic) UIColor * titleColor;
@property(weak,nonatomic) UIColor * titleColor_s;

@property(assign,nonatomic) BOOL yIsSelected;

-(void)centerSubView:(CGFloat) top;
-(void)TransSelectedStatus;

+(YUTabItemButton *) createYUTabItemButtonWith:(CGRect)frame
                                         image:(UIImage *)image
                                       image_s:(UIImage *)image_s
                                         title:(NSString *) title
                                     titleColr:(UIColor *)titleColr
                                    titleColr_s:(UIColor *)titleColr_s;
@end

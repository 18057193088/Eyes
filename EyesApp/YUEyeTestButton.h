//
//  YUEyeTestButton.h
//  EyesApp
//
//  Created by yxy on 15/8/16.
//  Copyright (c) 2015年 叶夏云. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol YUEyeTestButtonDeledge <NSObject>

-(void)whenButtonTouchUpInside:(id)sender;


@end

@interface YUEyeTestButton : UIView
@property(strong,nonatomic) UIImageView * yImageView;
@property(strong,nonatomic) UILabel * yTitleLabel ;
@property(weak,nonatomic) id<YUEyeTestButtonDeledge>deledge ;
@property(strong,nonatomic) UIButton * btn;

-(void)setImage:(UIImage*)ima title:(NSString *)title;

@end

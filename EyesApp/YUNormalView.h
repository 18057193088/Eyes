//
//  YUNormalView.h
//  EyesApp
//
//  Created by 叶夏云 on 15/6/23.
//  Copyright (c) 2015年 叶夏云. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YUNormalView : UIView
@property(strong,nonatomic)UIImageView * imageView ;
@property(strong,nonatomic) UILabel * Titlelabel ;

-(void)setImage:(UIImage *)ima title:(NSString *)title ;
-(void)viewScal:(float)scalc;

@end

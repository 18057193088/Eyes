//
//  YUCircleButton.m
//  EyesApp
//
//  Created by yxy on 15/7/29.
//  Copyright (c) 2015年 叶夏云. All rights reserved.
//

#import "YUCircleButton.h"
#import "UIView+YUStyle.h"
#import "UIColor+YUColor.h"
#import "CONST_CIRCLEBUTTON.h"
#import "function.h"
@implementation YUCircleButton
-(id)initWithIcon:(UIImage *)ima title:(NSString *)title width:(float)width{

    self = [super initWithFrame:CGRectMake(0, 0, width, 44)];
    if(self){
        /*
         初始化控件
         */
        
        //centerView 初始化
        _yCenterView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 100, [self y_Height]) ];
        
        [self addSubview:_yCenterView];
        _yIconView =[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, ima.size.width, ima.size.height)];
        
        [_yIconView setImage:ima];
        
        [_yCenterView addSubview:_yIconView];
        
        [_yIconView y_setAlign:5];
        
        [_yIconView y_setLeft:0];
        
        
        //标题
        _yTitleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, [self y_Height])];
        
        [_yTitleLabel setFont:[UIFont systemFontOfSize:FONTS_SIZE]];
        
        [_yTitleLabel  setText:title];
        
        CGSize labelSize =  [[function share]  contentSize:title fontSzie:FONTS_SIZE maxWidths:width - PADDING*2  maxHeigh:FONTS_SIZE];
        
        [_yTitleLabel setFrame:CGRectMake(0, 0, labelSize.width, [self y_Height])];
        
        [_yTitleLabel setTextAlignment:NSTextAlignmentRight];
        

        [_yCenterView addSubview:_yTitleLabel];
        
        [_yTitleLabel y_rightFromView:_yIconView distance:TITLE_MARGIN_LEFT];
        
        [_yCenterView y_setWidth:[_yTitleLabel y_RightX]];
      
        [_yCenterView y_setAlign:5];
        
        _yOutButton = [[UIButton alloc]initWithFrame:self.bounds];
        
        [self addSubview:_yOutButton];
        
        [_yOutButton addTarget:self action:@selector(whenOutButtonTouchUpInSide:) forControlEvents:UIControlEventTouchUpInside];
        
        [self setUp];
        
    
    }
    return self;
    
}

-(void)setTitle:(NSString *)title{

    [_yTitleLabel setText:title];
    
}
-(void)setUp{

  
    [self setPublicStyle];
    
}

-(void)setPublicStyle{

    self.layer.masksToBounds = YES;
    self.layer.cornerRadius= [self y_Height ]/2.0;
    self.layer.borderWidth = 0.5;
}
-(void)blackStyle{
    
    UIColor * white = [UIColor colorwithRgb:149 g:147 b:120];
    
    
    self.backgroundColor = [UIColor colorwithRgb:41 g:41 b:39 ];
    
    [_yTitleLabel setTextColor:white];
    
    self.layer.borderColor = white.CGColor;
    
    
    
}
-(void)whenOutButtonTouchUpInSide:(id)sender{

    if([_deledge respondsToSelector:@selector(whenCircleButtonTouchUpInSide)]){
    
    
        [_deledge whenCircleButtonTouchUpInSide];
        
    }
}
@end

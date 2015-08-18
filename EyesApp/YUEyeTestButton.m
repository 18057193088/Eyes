//
//  YUEyeTestButton.m
//  EyesApp
//
//  Created by yxy on 15/8/16.
//  Copyright (c) 2015年 叶夏云. All rights reserved.
//

#import "YUEyeTestButton.h"
#import "CONST_EYE_TEST_BUTTON.h"
#import "UIView+YUStyle.h"
#import "UIColor+YUColor.h"
@implementation YUEyeTestButton


-(id)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if(self){
        
        [self setUp];
        
        
        
    }
    
    return self;
}

-(void)setUp{
    self.backgroundColor = [UIColor whiteColor];
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius  = 4 ;
    self.layer.borderWidth = 1;
    self.layer.borderColor = [[UIColor colorWithRed:228/255.0 green:228/255.0  blue:228/255.0  alpha:1] CGColor];
    
    _yImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, ImageView_Width, ImageView_Width)];
    _yImageView.layer.masksToBounds = YES;
    _yImageView.layer.cornerRadius = [_yImageView y_Width] /2.0;
    
    [_yImageView setImage: [UIImage imageNamed:@"C"]];
     [self addSubview:_yImageView];
    [_yImageView y_setAlign:5];
    [_yImageView y_setLeft:PADDING_LEFT];
    
    _yTitleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 200, TITLE_FONT)];
    
    [_yTitleLabel setFont:[UIFont systemFontOfSize:TITLE_FONT]];
    
    [_yTitleLabel setText:@"C子眼测试"];
    
    [_yTitleLabel setTextColor:[UIColor chocolateColor]];
    
    [self addSubview:_yTitleLabel];
    
    [_yTitleLabel y_setAlign:5];
    
    [_yTitleLabel y_rightFromView:_yImageView distance:TITLE_LEFT];
    
    _btn = [[ UIButton alloc]initWithFrame:self.bounds];
    [self addSubview:_btn];
    [_btn addTarget:self action:@selector(btnTouchUpInside:) forControlEvents:UIControlEventTouchUpInside];
    
}

-(void)btnTouchUpInside:(id)sender{
    
    if([_deledge respondsToSelector:@selector(whenButtonTouchUpInside:)]){
        
        [_deledge whenButtonTouchUpInside:self];
        
    }
}

-(void)setImage:(UIImage*)ima title:(NSString *)title{

    [_yImageView setImage:ima];
    [_yTitleLabel setText:title];

}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

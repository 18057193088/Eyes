//
//  YUNormalView.m
//  EyesApp
//
//  Created by 叶夏云 on 15/6/23.
//  Copyright (c) 2015年 叶夏云. All rights reserved.
//

#import "YUNormalView.h"
#import "CONST_PUBLIE.h"
#import "UIView+YUStyle.h"
#define FONT 13
#define IMAGE_WIDTH 30
@implementation YUNormalView
-(id)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if(self){
        
        [self setUp];
        
        
    
    }
    
    return self;
    

}

-(void)setImage:(UIImage *)ima title:(NSString *)title {

    [_imageView setImage:ima];
    [_Titlelabel setText:title];
    
    
    

}

-(void)viewScal:(float)scalc{
    
    CGPoint center = self.center;
    
    [self y_setWidth:[self y_Width] * scalc ];
     [self y_setHeight:[self y_Height] * scalc ];
    
    self.center = center;
    

}
-(void)setUp{

    
    _imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, IMAGE_WIDTH, IMAGE_WIDTH)];
    
    [self addSubview:_imageView];
    
    [_imageView setImage:[UIImage imageNamed:@"定时"]];
    

    [self addSubview:_imageView];
    
    [_imageView y_setAlign:5];
    
    _Titlelabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, [self y_Width], FONT)];
    
    [_Titlelabel setFont:[UIFont systemFontOfSize:FONT]];
    
    [_Titlelabel setTextColor: [UIColor colorWithRed:100/255.0 green:100/255.0 blue:100/255.0 alpha:1]];
    
    _Titlelabel.textAlignment = NSTextAlignmentCenter;
    
    [_Titlelabel setText:@"定时"];
    
    [self addSubview:_Titlelabel];
    
    
    
    UIView * circleView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 60, 60)];
    
    [circleView setBackgroundColor:[UIColor colorWithRed:245/255.0 green:245/255.0 blue:245/255.0 alpha:245/255.0]];
    
    circleView.layer.masksToBounds = YES;
    
    circleView.layer.cornerRadius = [circleView y_Width] /2.0;
    
    
    [self insertSubview:circleView atIndex:0];
    
    [circleView y_setAlign:5];
    
    [_Titlelabel y_bottomFromView:circleView distance:10];
    self.layer.borderWidth = 0.5;
    self.layer.borderColor = [UIColor colorWithRed:238/255.0 green:238/255.0 blue:238/255.0 alpha:1].CGColor;
    
    
}
@end

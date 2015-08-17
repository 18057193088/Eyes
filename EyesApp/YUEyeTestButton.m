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
@implementation YUEyeTestButton


-(id)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if(self){
        
        [self setUp];
        
        
        
    }
    
    return self;
}

-(void)setUp{

    _yImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, ImageView_Width, ImageView_Width)];
    _yImageView.layer.masksToBounds = YES;
    _yImageView.layer.cornerRadius = [_yImageView y_Width] /2.0;
    
    
    
    [self addSubview:_yImageView];
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

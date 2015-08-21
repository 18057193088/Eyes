//
//  YUMiniGreenButton.m
//  EyesApp
//
//  Created by yxy on 15/8/20.
//  Copyright (c) 2015年 叶夏云. All rights reserved.
//

#import "YUMiniGreenButton.h"
#import "UIColor+YUColor.h"
#import "UIView+YUStyle.h"
#define GREEN_COLOR [UIColor colorwithRgb:77 g:169 b:81]
#define GRAY_COLOR [UIColor colorwithRgb:228 g:228 b:228]
@implementation YUMiniGreenButton

-(id)initWithFrame:(CGRect)frame{
    self =[super initWithFrame:frame];
    
    if(self){

        [self borderCirlce];
        _titleLabel = [[UILabel alloc]initWithFrame:self.bounds];
    
        [self addSubview:_titleLabel];
        
        [_titleLabel y_setAlign:5];
        
        [_titleLabel setTextAlignment:NSTextAlignmentCenter];
        
        [_titleLabel setText:@"6"];
        
        [self grayStyle];
    }
    return self;
}
-(void)borderCirlce{

    self.layer.masksToBounds = YES;
    
    self.layer.cornerRadius = [self  y_Width ]/2;
}

-(void)greenStyle{
    
    
    self.backgroundColor = GREEN_COLOR;
    [_titleLabel setTextColor:[UIColor whiteColor]];
    
    
}
-(void)grayStyle{


    self.backgroundColor = GRAY_COLOR;
    [_titleLabel setTextColor:GREEN_COLOR];
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

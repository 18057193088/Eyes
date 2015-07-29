//
//  YUNavNormalView.m
//  YUANBAOAPP
//
//  Created by yxy on 14-9-3.
//  Copyright (c) 2014年 ATAW. All rights reserved.
//

#import "YUNavNormalView.h"
#import "UIView+YUStyle.h"
#import "UIColor+YUColor.h"
#define FONT 13
#define PADDING_LEFT 20
#define PADDING_BOTTOM 15
#define Right_button_width 80
#define Right_button_heigh 40
@implementation YUNavNormalView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
-(id)initDefault{

    self = [super initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, NavBarHeight)];
    
    if(self){
        
        [self setUp];
        
    }
    
    return self;
    
}
-(void)setUp{
    
    [self setBackgroundColor:[UIColor yNavGreen]];
    
    

}
-(void)addTitle{
    _titleView = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 150, FONT+5)];
    
    [_titleView setTextColor:[UIColor whiteColor]];
    
    [_titleView setTextAlignment:NSTextAlignmentCenter];
    if(! _titleView.superview){
        
        [self addSubview:_titleView] ;
        
    }
    [_titleView y_setAlign:5];
    [_titleView y_setTop:[_titleView y_TopY] + StateBarHeight/2];
    

}
-(void)touchBack{
 
    if(_whenGouBackTouch){
        
        _whenGouBackTouch();
        
    }
}
-(void)addBackButton{
    
    UIButton * butt = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [butt setFrame:CGRectMake(0, 0, 80, 40)];
    
  
  
    
    [self addSubview:butt];
    
      [butt y_setBottom:0];

    _backView = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [self addSubview:_backView];
    
    [_backView setBackgroundImage:[UIImage imageNamed:@"back_arrow"] forState:UIControlStateNormal];
    //32 × 28
    [_backView setFrame:CGRectMake(PADDING_LEFT, 0, 16, 14)];
    
    [_backView y_setBottom:PADDING_BOTTOM];
    
    
    [butt addTarget:self action:@selector(touchBack) forControlEvents:UIControlEventTouchUpInside];
    
    [_backView  addTarget:self action:@selector(touchBack) forControlEvents:UIControlEventTouchUpInside];
    
   


}
-(void)setNavItem:(NSString *)titleName IsShowBackView:(BOOL)isShow{
    
    if(!_titleView){
        [self addTitle];
    
    }
    [_titleView setText:titleName];
    
    if(isShow){
    
        if(!_backView){
        
            [self addBackButton];
            
            
        }
    
    
    }

   
}

#pragma mark right button 
-(void)rightButtonTouchDown{
    
    if(_rightButtonTouch){
    
    
        _rightButtonTouch();
        
        
    }
}
-(void)addRightItem:(NSString *)titleNmae whenRightItemTouch:(none_return_callback)touch{
    
    if(_rightButton == nil){
    
        UILabel * desLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 40, FONT+5)];
        
        [desLabel setFont:[UIFont systemFontOfSize:FONT]];
        
        [desLabel setText:titleNmae];
        
        [desLabel setTextColor:[UIColor whiteColor]];
        
        
        [desLabel setTextAlignment:NSTextAlignmentRight];
        
        
        [self addSubview:desLabel];
        
        
        [desLabel y_setTop:[_titleView y_TopY]];
        
        
        [desLabel y_setRight:PADDING_LEFT];
        
        _rightButton  = [UIButton buttonWithType:UIButtonTypeCustom];
        
      
        
        [_rightButton addTarget:self action:@selector(rightButtonTouchDown) forControlEvents:UIControlEventTouchUpInside];
        
        
        [self addSubview:_rightButton];
        
        
        [_rightButton setFrame:CGRectMake(0, 0, Right_button_width, NavBarHeight)];
        
        [_rightButton y_setRight:0];
    
    }
    
    _rightButtonTouch = touch;
    
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end

//
//  YUTabItemButton.m
//  YUTabController
//
//  Created by yxy on 15/1/26.
//  Copyright (c) 2015年 XIAYUN.YE. All rights reserved.
//

#import "YUTabItemButton.h"
#import "const_tab.h"
#import "UIView+YUStyle.h"
#import  "UIColor+YUColor.h"
@implementation YUTabItemButton

-(id)initWithFrame:(CGRect)frame{
    self =[super initWithFrame:frame];
    if(self){
    
        [self setUp];
        
       
        
    }
    
    return self;
    

}

-(void)whenTabItemButtonTouch:(NSNotification *) noti{

    // 接受到按钮按下通知，除了自己，其他主动关闭 选中状态
    if( noti.object == self){
        // 自己接受到 不做处理
        return;
        
    }
    // 其他按钮接受到本消息
    
    if(_yIsSelected){
        
        [self TransUnSelectStatus];
        
        _yIsSelected = NO;
        
    }
    
}

-(void)centerSubView:(CGFloat ) top{

    [_yIconImageView y_setAlign:5];
    
    [_yIconImageView y_setTop:top];
    [_yButtonTitle y_setWidth:[self y_Width]];
    [_yButtonTitle y_bottomFromView:_yIconImageView distance:Button_title_top];
    
}
-(void)setUp{
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(whenTabItemButtonTouch:) name:Notifiction_Name_ItemButtonTouch object:nil];
   
    
    
    _yIsSelected =NO;
    
    _fullButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    [_fullButton addTarget:self action:@selector(fullButtonTouchUpInSide:) forControlEvents:UIControlEventTouchUpInside];
    
    _yIconImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, TAB_IMAGE_WIDH, TAB_IMAGE_HEIGH)];
    
    [self addSubview:_yIconImageView];
    
 
    
    _yButtonTitle = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, [self y_Width], Button_title_fontSize)];
    
    [_yButtonTitle setTextAlignment:NSTextAlignmentCenter];
    
    [_yButtonTitle setTextColor:[UIColor whiteColor]];
      
    [self addSubview:_yButtonTitle];
    
    [_yButtonTitle setFont:[UIFont systemFontOfSize:Button_title_fontSize]];
    

    [self centerSubView:TAB_IMAGE_TOP];
    
    
    
    [self addSubview:_fullButton];
    

}

-(void)TransSelectedStatus{

    [_yIconImageView setImage:_image_s];
    [_yButtonTitle setTextColor:_titleColor_s];
    
    
}

-(void)TransUnSelectStatus{

    [_yIconImageView setImage:_image];
    [_yButtonTitle setTextColor:_titleColor];
 
}
-(void)fullButtonTouchUpInSide:(id)sender{
    
 
    
    
    [_deledge ButtonTounUpInsideWithIndex:_index];
    
    _yIsSelected = !_yIsSelected;
    
    if(_yIsSelected ){
        [self TransSelectedStatus];
        
        
    }else{
        [self TransUnSelectStatus];
        
    }
    
       [[NSNotificationCenter defaultCenter]postNotificationName:Notifiction_Name_ItemButtonTouch object:self];

}

+(YUTabItemButton *) createYUTabItemButtonWith:(CGRect)frame
                                         image:(UIImage *)image
                                       image_s:(UIImage *)image_s
                                         title:(NSString *) title
                                     titleColr:(UIColor *)titleColr
                                   titleColr_s:(UIColor *)titleColr_s{


    YUTabItemButton * btn = [[YUTabItemButton alloc]initWithFrame:frame];
    
    btn.image = image;
    btn.image_s  = image_s;
    btn.titleColor = titleColr;
    btn.titleColor_s = titleColr_s;
    
    [btn.yButtonTitle setText:title];
    
    [btn.yIconImageView setImage:image];
    
    
  
    [btn.yButtonTitle setTextColor:btn.titleColor];
    
    
    
    
    
      
    
    return btn;
    
}

-(void)dealloc{

    [[NSNotificationCenter defaultCenter]removeObserver:self];
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

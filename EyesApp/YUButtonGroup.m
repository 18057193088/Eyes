//
//  YUButtonGroup.m
//  EyesApp
//
//  Created by yxy on 15/8/12.
//  Copyright (c) 2015年 叶夏云. All rights reserved.
//

#import "YUButtonGroup.h"
#import "function.h"
#import "UIView+YUStyle.h"
#define big_fontsize 16
#define small_fontsize 13
#define LEFT 10
@implementation YUButtonGroup


-(id)initWithFrame:(CGRect)frame titles:(NSArray *)arr{

    self = [super initWithFrame:frame];
    if(self){
        _buttons = [[NSMutableArray alloc]init];
        int i = 0 ;
        for(NSString * title in arr){
        
            UIButton * btn =[UIButton buttonWithType:UIButtonTypeCustom];
            [btn setTitle:title forState:UIControlStateNormal];
            
            float eleW = (frame.size.width - LEFT * (arr.count-1)) / (float)arr.count;
            [btn setTag:i];
            
            
            [btn setFrame:CGRectMake(0, 0, eleW,frame.size.height)];
            [self selectedStatus:btn];
            
            [btn addTarget:self action:@selector(buttonTouchUpInSide:) forControlEvents:UIControlEventTouchUpInside];
            
            [_buttons addObject:btn];
            
            i++;
            
            
        }
        
        [self setUp];
        
    }
    return self;
}
-(void)setUp{
    int i = 0 ;
    UIButton * lastBtn = nil ;
    for(UIButton * btn in _buttons){
    
        [self addSubview:btn];
        if(i>0){
        
            [btn y_rightFromView:lastBtn distance:LEFT];
            [self unSelectStatus:btn];
        }
        lastBtn = btn;
        
        i++;
        
    }
    
}
-(void)buttonTouchUpInSide:(id)sender{

    for(UIButton * btn in _buttons){
    
        [self unSelectStatus:btn];
        
    }
    
    [self selectedStatus:sender];
    
    UIButton * thisBtn = sender;
    
    if([_deledge respondsToSelector:@selector(whenGroupButtonTouchUpInSide:)]){
        
        [_deledge whenGroupButtonTouchUpInSide:(int)thisBtn.tag];
        
        
    }

}
-(void)selectedStatus:(UIButton *)button{

    [button.titleLabel setFont:[UIFont systemFontOfSize:big_fontsize]];
    [button setAlpha:1];
    
    
}
-(void)unSelectStatus:(UIButton *)button{
    [button.titleLabel setFont:[UIFont systemFontOfSize:small_fontsize]];
    [button setAlpha:0.5];
}
@end

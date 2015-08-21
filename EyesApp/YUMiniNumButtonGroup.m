//
//  YUMiniNumButtonGroup.m
//  EyesApp
//
//  Created by yxy on 15/8/20.
//  Copyright (c) 2015年 叶夏云. All rights reserved.
//

#import "YUMiniNumButtonGroup.h"
#import "YUMiniGreenButton.h"
@implementation YUMiniNumButtonGroup

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(id)initWithFrame:(CGRect)frame{

    self = [super initWithFrame:frame];
    
    if(self){
        
        [self setUp];
        
    }
    
    
    return self;
    
}
-(void)setMaxNum:(int)num{

    _MaxNum = num;
    
    for(int i = 0 ; i < num; i ++){
    
        YUMiniGreenButton * btn = [[YUMiniGreenButton alloc]initWithFrame:CGRectMake(0, 0, 40, 40)];
        [_yScrollerView addSubview:btn];
        [_yMiniButtonArr addObject:btn];
        
    }
}
-(void)setUp{
    _yMiniButtonArr = [[NSMutableArray alloc]init];
    _yScrollerView = [[UIScrollView alloc]initWithFrame:self.bounds];
    
    
    [self addSubview:_yScrollerView];
    
}
@end

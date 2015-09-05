//
//  YUMiniNumButtonGroup.m
//  EyesApp
//
//  Created by yxy on 15/8/20.
//  Copyright (c) 2015年 叶夏云. All rights reserved.
//

#import "YUMiniNumButtonGroup.h"
#import "YUMiniGreenButton.h"
#import "UIView+YUStyle.h"
#define marign_left 10
#define btn_width 40

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
    YUMiniGreenButton * lastBtn = nil;
    for(int i = 0 ; i < num; i ++){
    
        YUMiniGreenButton * btn = [[YUMiniGreenButton alloc]initWithFrame:CGRectMake((btn_width+marign_left) *i, 0, btn_width    , btn_width)];
        [_yScrollerView addSubview:btn];
        [_yMiniButtonArr addObject:btn];
        [btn setTag:i];
        
        lastBtn = btn;
        
    }
    
    _yScrollerView.contentSize = CGSizeMake([lastBtn y_RightX], [self y_Height]) ;
    
    
}

-(void)buttonSelected:(int)index lastButtonStyle:(SEL)sel{

    if(index>= _MaxNum){
        return;
        
    }
    

    
    YUMiniGreenButton * thisBtn = _yMiniButtonArr[index];
    
    [thisBtn greenStyle];
 
    
    float centerX = [self y_Width]/2.0 ;
    
    float offX = thisBtn.center.x - centerX;

    if(index-1>=0){
        
        YUMiniGreenButton * lastBtn = _yMiniButtonArr[index-1];
        if([lastBtn respondsToSelector:sel]){
            
            [lastBtn performSelector:sel withObject:nil];
        
        }
        
    }
    
     [_yScrollerView setContentOffset:CGPointMake(offX, 0)  animated:YES];
}

-(void)selectFirstButton{
    
    [self buttonSelected: 0 lastButtonStyle:@selector(grayStyle)];

}

-(void)selectNextButtonWithLastStyle:(SEL) sel{

    _curIndex++;
    [self  buttonSelected:_curIndex lastButtonStyle:sel];
    
}
-(void)numSortByDesc{
    int i  = _MaxNum;
    
    while (i--) {
        YUMiniGreenButton * thisBtn =     [_yMiniButtonArr objectAtIndex:i];
        [thisBtn.titleLabel setText:[NSString stringWithFormat:@"%d", _MaxNum-i]];
    }
}
-(void)numSortByAsc{

    
    int i  = _MaxNum;
    
    while (i--) {
        YUMiniGreenButton * thisBtn =     [_yMiniButtonArr objectAtIndex:i];
        [thisBtn.titleLabel setText:[NSString stringWithFormat:@"%d",i+1]];
    }
}

-(void)setUp{
    _yMiniButtonArr = [[NSMutableArray alloc]init];
    _yScrollerView = [[UIScrollView alloc]initWithFrame:self.bounds];
    _yScrollerView.showsHorizontalScrollIndicator = NO;
    _curIndex = 0 ;
    [self addSubview:_yScrollerView];
    
}
@end

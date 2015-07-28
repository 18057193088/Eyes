//
//  YUGridView.m
//  EyesApp
//
//  Created by 叶夏云 on 15/6/22.
//  Copyright (c) 2015年 叶夏云. All rights reserved.
//

#import "YUGridView.h"
#import "UIView+YUStyle.h"
#import "YUNormalView.h"
#import "CONST_PUBLIE.h"
#import "YUGirdItem.h"
#define ROW_COUNT 3
#define MAX_ITEM_COUNT 6
#define eW ([self y_Width]/3)
#define eH ([self y_Height]/2)
@implementation YUGridView
{

    NSInteger _curSelectViewIndex;
    NSInteger _willBecomViewIndex;
    
    BOOL lock;
    
}
@synthesize yGirdItems =_yGirdItems;

-(id)initWithFrame:(CGRect)frame{

    self = [super initWithFrame:frame];
    if(self){
    
        [self setUp];
        
    }
    
    return self;
    
}


-(void)whenLongPress:(UIGestureRecognizer *) ges{
    
    
    CGPoint touchPoint = [ges locationInView:self];

    
    _yFatherScrollerView.scrollEnabled = NO;
    
    if(lock == NO){
        /*第一次感应到长按*/
        _curSelectViewIndex =  [self posInArryByPoint:touchPoint];;
        
        YUNormalView * view = [_yGirdElementArrary objectAtIndex:_curSelectViewIndex];
        
        [view viewScal:1.12];
        
        view.center = touchPoint;
        
        
        [self addSubview:view];
        
        lock = YES;
        
        _yFatherScrollerView.scrollEnabled = NO;
        
        /*
         
         锁上之后，就不会再选择其他的按钮 作为移动对象
         */
        
    }else{
    
        /*
         第一次点击阶段已经过了，现在时移动状态
         
         */
        CGPoint touchPoint = [ges locationInView:self];
        
        
        YUNormalView * view = [_yGirdElementArrary objectAtIndex:_curSelectViewIndex];
        
        
        view.center = touchPoint;
    
    }
    if(ges.state == UIGestureRecognizerStateEnded){
    /*
     点击状态已经过了，现在是离开状态
     
     */
        _willBecomViewIndex = [self posInArryByPoint:touchPoint];
        
        if(_willBecomViewIndex >=0 && _willBecomViewIndex < MAX_ITEM_COUNT){
            NSLog(@"%ld",_willBecomViewIndex);
            
            YUNormalView * view = [_yGirdElementArrary objectAtIndex:_curSelectViewIndex];
            
            [_yGirdElementArrary removeObject:view];
            
            [_yGirdElementArrary insertObject:view atIndex:_willBecomViewIndex];
        }
        
        [self rechangeView];
    
        _yFatherScrollerView.scrollEnabled = YES;
        
        lock = NO;
    
    }
}


#pragma mark resolve UITableView and UIPageViewController panGesture Conflict
-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    
    return YES;
    
}

-(void)rechangeView{

    
    for(int i = 0 ; i<  MAX_ITEM_COUNT; i++){
    
        
    [UIView animateWithDuration:0.3 animations:^{
          YUNormalView * view = [_yGirdElementArrary objectAtIndex:i];
        [view removeFromSuperview];
        [self addSubview:view];
        
        view.frame = [self indexViewFrame:i];
        
    }];
        
    }
    
}


-(NSInteger)posInArryByPoint:(CGPoint)point{

    
    int col =   (int)point.x / (int)eW;
    
    int row = (int) point.y/  (int)eH ;
    
    NSLog(@"%f,%f",point.x,point.y);
    
    
    NSLog(@"%f /%f = %d ",point.x,eW,col);
    
    
    return  row*ROW_COUNT+col;
    
    
}
-(CGRect)indexViewFrame:(NSInteger)i{
    

    
    return CGRectMake( (i %3)*eW, (i/3) * eH, eW, eH);
    

}
-(void)setUp{

    lock =NO;
    
    self.clipsToBounds = YES;
    
    _yGirdElementArrary = [[NSMutableArray alloc]init];
    

    
    for(int i = 0 ; i< 6 ;i++){
        
        YUNormalView * v = [[YUNormalView alloc]initWithFrame:CGRectMake((i %3)*eW, (i/3) * eH, eW, eH)];
        
        
        [_yGirdElementArrary addObject:v];
        
        [self addSubview:v];
        
    
    }
    
    UILongPressGestureRecognizer * longpre  = [[UILongPressGestureRecognizer alloc ]initWithTarget:self action:@selector(whenLongPress:)];
    longpre.minimumPressDuration = 0.7;
   
    UITapGestureRecognizer * ges = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(touchUp:) ];
    
    [self addGestureRecognizer:ges];
    
    
    [self addGestureRecognizer:longpre];
    

    
    

}

-(void)touchUp:(UIGestureRecognizer *) ges {

    
    if(ges.state == UIGestureRecognizerStateEnded){
    
        CGPoint touchPoint  = [ges locationInView:self];
        
        int btnIndex =  (int)[self posInArryByPoint:touchPoint];
        
        if(_deledge){
            
            [_deledge whenGirdItemTouchUpInSide:btnIndex];
            
        
        }
        
        
    }
    
}
#pragma mark setter

-(void)setYGirdItems:(NSMutableArray *)yGirdItems{

    _yGirdItems = yGirdItems;
    
    for(int i = 0 ;i < MAX_ITEM_COUNT ; i++){
        
        YUGirdItem * item = _yGirdItems [i];
        YUNormalView * itemView = _yGirdElementArrary[i];
        
        [itemView setImage:[UIImage imageNamed:item.yImageName] title:item.yTitle];
        
        
    
    }

}
/*
 
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

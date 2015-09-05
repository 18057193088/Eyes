//
//  YUCTestViewController.m
//  EyesApp
//
//  Created by yxy on 15/8/18.
//  Copyright (c) 2015年 叶夏云. All rights reserved.
//

#import "YUCTestViewController.h"
#import "UIColor+YUColor.h"
#import "UIView+YUStyle.h"
#import "YUMiniNumButtonGroup.h"
#import "YUMiniGreenButton.h"
#import "CONST_CTEST.h"
#import "CONST_PUBLIE.h"
#import "YULayer.h"
#import "YUCTestTipView.h"
@interface YUCTestViewController ()
{

    CGPoint _beganPoint ;
    BOOL _isTipViewShow ;
    
}
@end

@implementation YUCTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUp];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)setUp{
    
    [self initNav];
    
    [self initView];
    
}
-(void)initView{
    self.view.backgroundColor = [UIColor GRAY_240_240_240];
    
    _yCircleView =[[UIView alloc]initWithFrame:CGRectMake(0, 0, 2*r , 2*r)];
    
    _yCircleView.backgroundColor = [UIColor GRAY_240_240_240];
    
    _yCircleView.layer.masksToBounds = YES;
    
    _yMiniButtonGroup = [[YUMiniNumButtonGroup alloc]initWithFrame:CGRectMake(0, NavBarHeight+btn_group_top, SCREEN_WIDTH - PADDING_LEFT *2, 40)];
  
    [_yMiniButtonGroup setMaxNum:20];
    [self.view addSubview:_yMiniButtonGroup];
    [_yMiniButtonGroup y_setLeft:PADDING_LEFT];
    _yCircleView.layer.cornerRadius = [_yCircleView y_Width]/2.0;
    _yCircleView.layer.borderColor = [UIColor blackColor].CGColor;
    _yCircleView.layer.borderWidth = 0.5 ;
    
    [self.view addSubview:_yCircleView];
    
    _yCview =[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, C_VIEW_WIDTH, C_VIEW_WIDTH)];
    
    [_yCview setImage:[UIImage imageNamed:@"C"]];
    
    [self.view addSubview:_yCview];
    
    [_yCview y_setAlign:5];
    [_yCircleView y_setAlign:5];
    
    [_yMiniButtonGroup selectFirstButton];
    
    [_yMiniButtonGroup numSortByDesc];
    
    YULayer * lay = [[YULayer alloc]initFrame:CGRectMake(0,[_yMiniButtonGroup y_BottomY]+btn_group_top, SCREEN_WIDTH, 1)];
    [self.view.layer addSublayer:lay];
    
    //提示View
    _yTestTipView = [[YUCTestTipView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - NavBarHeight)];
    
    UITapGestureRecognizer * tapGes = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(testViewTouchUpInSide:)];
    tapGes.numberOfTapsRequired= 1;
    
    [ _yTestTipView addGestureRecognizer:tapGes];
    
    [self.view addSubview:_yTestTipView];
    
    [self hideTipView];
    
    [self initModel];
}


-(void)initModel{

    _isTipViewShow = NO;;
    _yCurDiction = YUDirctionRight;
    
}

-(void)testViewTouchUpInSide:(id)sender{


    if(_isTipViewShow == NO){
        
        [self showTipView];
        
    }else{
    
        [self hideTipView];
        
    }

}
#pragma mark 显示提示view
-(void)showTipView{

    [UIView animateWithDuration:0.7 animations:^{
        [_yTestTipView y_setTop:NavBarHeight +TIP_SHOW_PY];
        
    } completion:^(BOOL finished) {
        if(finished){
        
            _isTipViewShow = YES;
            
        }
    }];
    
}



#pragma mark 隐藏提示View

-(void)hideTipView{

    
    [UIView animateWithDuration:0.7 animations:^{
         [_yTestTipView y_setTop:SCREEN_HEIGHT - NavBarHeight];
    } completion:^(BOOL finished) {
        if(finished){
        
            _isTipViewShow =NO;
            
        
        }
    }];
    

}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{


    UITouch * touch  =  [touches anyObject];
    CGPoint thisPoint = [touch locationInView:self.view];
    _beganPoint = thisPoint;
    

}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{

    [super touchesBegan:touches withEvent:event];
    
    UITouch * touch  =  [touches anyObject];
    CGPoint thisPoint = [touch locationInView:self.view];
    CGPoint circleCenter = _yCircleView.center;
    // 两点直线距离
    float dist = fabs(   sqrt( pow( (thisPoint.x-circleCenter.x) , 2) +pow( (thisPoint.y - circleCenter.y) , 2)      ));
    
    float beganPointToCenterDist =fabs( sqrt( pow( (_beganPoint.x-circleCenter.x) , 2) +pow( (_beganPoint.y - circleCenter.y) , 2)      ));
    if(beganPointToCenterDist >r ){
        return;
        
    }

    _yCview.center = thisPoint;
    //y-y1=[(y2-y1)/(x2-x1)](x-x1)
    //y = kx+b b =y-kx
    // y -b =kx ,x = (y-b)/k
    float k = 0;
    if((thisPoint.x - circleCenter.x)!=0){
      k =    (thisPoint.y-circleCenter.y) / (thisPoint.x - circleCenter.x);
    }
    float b = thisPoint.y - k * thisPoint.x;
    float x1,y1 ;
    if(fabs(thisPoint.x - circleCenter.x) > fabs(thisPoint.y - circleCenter.y)){
    
        if(thisPoint.x < circleCenter.x){
            
            x1 =thisPoint.x +dist *zl;
            
        }else{
            
            x1 = thisPoint.x - dist * zl ;
        }
         y1 = k *x1 +b ;
        
    }else{
        if(thisPoint.y < circleCenter.y){
            
            y1 = thisPoint.y + dist *zl ;
            
        }else {
        
            y1 = thisPoint.y - dist * zl ;
            
        }
        
        x1 = (y1 - b)/k;
    }
    
    _yCview.center = CGPointMake(x1, y1);
 
    
}
-(YUDirction)dirctionByBeganPoint:(CGPoint) bPoint endPoint:(CGPoint)ePoint {

    
    float absy = fabs(ePoint.y - bPoint.y);
    float absX = fabs(ePoint.x - bPoint.x);
    
    if(absy <=MIN_ABS_Y_OR_X && absX <= MIN_ABS_Y_OR_X){
        return YUDirctionNone ;
        
    }
    
    
    if(absy >absX){
    
        if(ePoint.y > bPoint.y){
            return YUDirctionDown;
            
        }else{
        
            return YUDirctionUp;
        }
        
    
    }else if(absy < absX){
    
        if(ePoint.x > bPoint.x){
        
            return YUDirctionRight;
            
        }else{
            
            return YUDirctionLeft;
        
        }
    }

    return YUDirctionNone;
    
    
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{

    [super touchesEnded:touches withEvent:event];
    
    UITouch * touch  =  [touches anyObject];
    CGPoint thisPoint = [touch locationInView:self.view];
    
    YUDirction diction = [self dirctionByBeganPoint:_beganPoint endPoint:thisPoint ];

    [UIView animateWithDuration:0.6 animations:^{
        
        [_yCview setCenter:_yCircleView.center];
        
    } completion:^(BOOL finished) {
        
        if(diction != YUDirctionNone){
            
            SEL sel = nil;
            
            
            if([self judgeDirction:diction]){
                
                sel = @selector(grayStyle);
                
            }else{
                
                sel = @selector(errorStyle);
                
                
            }
            
            [_yMiniButtonGroup selectNextButtonWithLastStyle:sel];
            
            [self randomCdirction];
        }
       
    }];
    
    
}
-(BOOL)judgeDirction:(YUDirction)dirction{

    return dirction== _yCurDiction;

}
-(void)randomCdirction{

    float angles[4] = {0,90.0,180.0,270.0};
    
    int rIndex  =  rand() % 4;
    
    float finalAngle = angles[rIndex];
   
    _yCurDiction  = [ self angleToYUDirction:finalAngle];
    
    _yCview.transform = CGAffineTransformMakeRotation(finalAngle * (M_PI / 180.0f));
    
    
}

-(void)CviewBecomeSmallerSize{
    
    

}
-(YUDirction )angleToYUDirction:(float)angle{
    if(angle == 0){
        return YUDirctionRight;
    }
    if(angle == 90.0){
        return YUDirctionDown;
    }
    if(angle == 180.0){
        return YUDirctionLeft;
    }
    if(angle == 270){
    
        return YUDirctionUp;
        
    }
    return YUDirctionNone;
}
-(void)initNav{

    [self setNavTitle:@"眼测试" isShowBack:YES];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

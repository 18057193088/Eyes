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

#import "CONST_PUBLIE.h"
#define r 75
#define zl 0.3
#define PADDING_LEFT 10
@interface YUCTestViewController ()

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
    
    _yMiniButtonGroup = [[YUMiniNumButtonGroup alloc]initWithFrame:CGRectMake(0, NavBarHeight, SCREEN_WIDTH - PADDING_LEFT *2, 80)];
    _yMiniButtonGroup.backgroundColor = [UIColor redColor];
    
    [_yMiniButtonGroup setMaxNum:10];
    [self.view addSubview:_yMiniButtonGroup];
    [_yMiniButtonGroup y_setLeft:PADDING_LEFT];
    _yCircleView.layer.cornerRadius = [_yCircleView y_Width]/2.0;
    _yCircleView.layer.borderColor = [UIColor blackColor].CGColor;
    _yCircleView.layer.borderWidth = 0.5 ;
    
    [self.view addSubview:_yCircleView];
    
    _yCview =[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 50, 50)];
    
    [_yCview setImage:[UIImage imageNamed:@"C"]];
    
    [self.view addSubview:_yCview];
    
    [_yCview y_setAlign:5];
    [_yCircleView y_setAlign:5];
}
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{

    UITouch * touch  =  [touches anyObject];
    CGPoint thisPoint = [touch locationInView:self.view];
    CGPoint circleCenter = _yCircleView.center;
    // 两点直线距离
    float dist = fabs(   sqrt( pow( (thisPoint.x-circleCenter.x) , 2) +pow( (thisPoint.y - circleCenter.y) , 2)      ));
    
    if(dist>r){
    
        _yCircleView.layer.borderColor = [UIColor redColor].CGColor;
        
    }else{
        _yCircleView.layer.borderColor = [UIColor blackColor].CGColor;
        
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
    NSLog(@"%f",dist);
    
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{

    [super touchesEnded:touches withEvent:event];
    
    [UIView animateWithDuration:0.6 animations:^{
       
        [_yCview setCenter:_yCircleView.center];
        
    }];
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

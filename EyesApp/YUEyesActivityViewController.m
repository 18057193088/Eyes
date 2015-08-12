//
//  YUEyesActivityViewController.m
//  EyesApp
//
//  Created by 叶夏云 on 15/7/26.
//  Copyright (c) 2015年 叶夏云. All rights reserved.
//

#import "YUEyesActivityViewController.h"
#import "UIView+YUStyle.h"
#import "CONST_EYESActivity.h"
#import "CONST_PUBLIE.h"
#import "UIView+YUAnimation.h"
#import "UIColor+YUColor.h"
#import "function.h"
#import "YUNavNormalView.h"
#define TIME_NUM 5
@interface YUEyesActivityViewController ()
{
    float angle;
    float rightAngle;
    
    BOOL _isStrartEyesActivity;
    
    NSTimer * _timer ;
    int _timeNum;
    float _Ddegree;
    
}
@end

@implementation YUEyesActivityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUp];
    
    // Do any additional setup after loading the view.
}

-(void)setUp{

    
    
    [self initNav];
    angle= 0;
    rightAngle = 0 ;
    _timeNum = TIME_NUM;
    _Ddegree= 90;
    
    [self initView];
}

-(void)initView{
    self.view.backgroundColor =[UIColor colorWithRed:31/255.0 green:31/255.0 blue:31/255.0 alpha:1];
    _yEyesBallImageView = [self makeBallView];

    _yRightEyesBallImageView =[self makeBallView];
    
    _yLeftArrrow = [self makeArrowView];
    
    _yRightArrrow = [self makeArrowView];
    
    
    [self.view addSubview:_yLeftArrrow];
    
    [self.view addSubview:_yRightArrrow];
    
    [self.view addSubview:_yEyesBallImageView];
    
    [self.view addSubview:_yRightEyesBallImageView];
    
    [_yRightEyesBallImageView y_setRight:EYE_RIGHT];
    
    [_yRightArrrow y_setLeft:[_yRightEyesBallImageView y_LeftX]];
    
    
    [_yRightEyesBallImageView y_bottomFromView:_yLeftArrrow distance:EYE_TOP];
    
    [_yEyesBallImageView y_bottomFromView:_yLeftArrrow distance:EYE_TOP];
    
    //开始按钮
    
    float startWidth =  SCREEN_WIDTH - START_BUTTON_MARGIN_LEFT*2 ;
    
    _yStartButton = [[YUCircleButton alloc] initWithIcon:[UIImage imageNamed:@"震动"] title:before_title width: startWidth ];
    
    [_yStartButton  blackStyle];
    
    [self.view addSubview:_yStartButton];
    [_yStartButton y_setAlign:5];
    
    [_yStartButton y_setBottom:START_BUTTON_BOTTOM];
    
    _yStartButton.deledge =self;
    
    // 提示Label
    NSString * tipStr = @"指导:\n摘下眼镜,凝视左方,双眼跟着眼球转到正上方,再转至右方,再转至正下方。逆时针和顺时针方向各坚持一分钟";
    
    _yTipLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
    
    _yTipLabel.lineBreakMode = NSLineBreakByCharWrapping;
    _yTipLabel.numberOfLines = 0 ;
    
    
    [_yTipLabel setFont:[UIFont systemFontOfSize:TIP_FONT_SIZE]];
     UIColor * white = [UIColor colorwithRgb:149 g:147 b:120];
    [_yTipLabel setTextColor:white];
    
    
    CGSize tipSize = [[function share]contentSize:tipStr fontSzie:TIP_FONT_SIZE maxWidths:SCREEN_WIDTH - PADDING*2 maxHeigh:500];
    
    [_yTipLabel setFrame:CGRectMake(PADDING, 200, tipSize.width, tipSize.height)];
    
    [_yTipLabel setText:tipStr];
    
    [_yTipLabel y_bottomFromView:_yEyesBallImageView distance:TIP_TOP];
    
    [self.view addSubview:_yTipLabel];
    
    _yButtonGroup = [[YUButtonGroup alloc]initWithFrame:CGRectMake(0, 0, 120, 44) titles:@[@"顺时针",@"逆时针"]];
  
    
    [self.y_NavView addSubview:_yButtonGroup];
    
    [_yButtonGroup y_setAlign:5];
    
    [_yButtonGroup y_setBottom:0];
    
    [_yButtonGroup setHidden:YES];
    _yButtonGroup.deledge =self;
    
    
    
}

-(void)IF_FirstTimeStartEyesProtectButton_then_do_FirstThing{

   [_yTipLabel dissMiss];
    
    [self.y_NavView.titleView setHidden:YES];
    

    [_yButtonGroup setHidden:NO];
    
}
-(void)whenCircleButtonTouchUpInSide{

    if(!_isStrartEyesActivity){
        /*第一次按下后该做的事情*/
        [self IF_FirstTimeStartEyesProtectButton_then_do_FirstThing];
        //还没有开始做眼保健操状态---即-- 准备状态
   
        
        [self circleButtonActivitingState];
        
        [self startEyesBallAnimation]; //开始眼球运动

        
        
        
    }

}

-(void)whenGroupButtonTouchUpInSide:(int)buttonIndex{
    
    if(buttonIndex ==0 ){
        _Ddegree = 90;
    }else{
        _Ddegree  = - 90;
        
    }

}

-(void)circleButtonReadStartState{
    
    _isStrartEyesActivity = NO;
    [_yStartButton setTitle:before_title];
   
    
    
}
-(void)circleButtonActivitingState{
    
    [_yStartButton setTitle:@"还有50秒"];
    _isStrartEyesActivity = YES;
    _timeNum= TIME_NUM;
    _timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(updateCircleButtonTitle) userInfo:nil repeats:YES];
    
 
    
}
-(void)updateCircleButtonTitle{

    if(_timeNum ==0){
    
        [_timer invalidate];
     
        [self circleButtonReadStartState];
        
        return;
        
        
    }
    [_yStartButton setTitle:[NSString stringWithFormat:@"还有%d秒",_timeNum] ];
    _timeNum -- ;
    
    
}
-(UIImageView *)makeBallView{

    UIImageView * ballView = [[UIImageView alloc]initWithFrame:CGRectMake(EYE_LEFT, 200, EYE_BALL_WIDTH, EYE_BALL_WIDTH)];
    
    [ballView setImage:[UIImage imageNamed:@"眼球"]];
    
    ballView.backgroundColor =[UIColor whiteColor];
    
    ballView.layer.cornerRadius = 90/2.0;
    ballView.layer.masksToBounds = YES;

    return ballView ;
    
}

-(UIImageView *)makeArrowView{
    
    UIImageView * imageView = [[UIImageView alloc]initWithFrame:CGRectMake(PADDING, NavBarHeight + ARROW_TOP, ARROW_WIDTH, ARROW_HEIGHT)];
    
    [imageView setImage:[UIImage imageNamed:@"旋转提示"]];
    
    return imageView;
    

}

-(void)initNav{

    [self setNavTitle:@"眼保健操" isShowBack:YES];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)startEyesBallAnimation{
    _isStrartEyesActivity= YES;
    
    [ self startAnimation];
    [self startRightAnimation];
    
}
-(void) startAnimation
{
    if(!_isStrartEyesActivity){
        angle -= _Ddegree;
        
        return;
        
    }
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.7];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(endAnimation)];
    _yEyesBallImageView.transform = CGAffineTransformMakeRotation(angle * (M_PI / 180.0f));
    [UIView commitAnimations];
}

-(void)endAnimation
{
    
    angle += _Ddegree;
    
    [self startAnimation];

}

-(void)startRightAnimation
{
    if(!_isStrartEyesActivity){
        rightAngle-=_Ddegree;
        
        return;
        
    }
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.7];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(endRightAnimation)];
    _yRightEyesBallImageView.transform = CGAffineTransformMakeRotation(rightAngle * (M_PI / 180.0f));
    [UIView commitAnimations];
}

-(void)endRightAnimation
{
    
    rightAngle += _Ddegree;
    
    [self startRightAnimation];
    
    // 360x = 90
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

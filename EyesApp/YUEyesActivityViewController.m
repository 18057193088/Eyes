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
@interface YUEyesActivityViewController ()
{
    float angle;
    float rightAngle;
    
    BOOL _isStrartEyesActivity;
    
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
    
    _yStartButton = [[YUCircleButton alloc] initWithIcon:[UIImage imageNamed:@"震动"] title:@"顺时针,准备计时" width: startWidth ];
    
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
    
    
}
-(void)whenCircleButtonTouchUpInSide{

    if(!_isStrartEyesActivity){
        //还没有开始做眼保健操状态---即-- 准备状态
        [self circleButtonActivitingState];
        

        [self startEyesBallAnimation];
        
        
    }

}

-(void)circleButtonReadStartState{
    
    
}
-(void)circleButtonActivitingState{
    
    [_yStartButton setTitle:@"还剩50秒"];
    
    [_yTipLabel dissMiss];
    
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
    
    angle += 90;
    
    [self startAnimation];

}

-(void)startRightAnimation
{
    if(!_isStrartEyesActivity){
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
    
    rightAngle += 90;
    
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

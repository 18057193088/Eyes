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
@interface YUEyesActivityViewController ()
{
    float angle;
    float rightAngle;
    
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
    
    [self startAnimation];
    [self startRightAnimation];
                                                                                                                 
    
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
-(void) startAnimation
{
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

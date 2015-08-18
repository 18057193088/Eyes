//
//  YUEyesTestViewController.m
//  EyesApp
//
//  Created by yxy on 15/8/16.
//  Copyright (c) 2015年 叶夏云. All rights reserved.
//

#import "YUEyesTestViewController.h"

#import "CONST_COLOR.h"
#import "CONST_PUBLIE.h"
#import "UIColor+YUColor.h"
#import "UIView+YUStyle.h"
#import  "YUCTestViewController.h"
#import "function.h"
@interface YUEyesTestViewController ()

@end

@implementation YUEyesTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUp];
    
    // Do any additional setup after loading the view.
}

-(void)setUp{
    
    [self initNav];
    [self initView];
    
}
-(void)initView{
    self.view.backgroundColor = [UIColor GRAY_240_240_240];
    _yCtestButton =[[YUEyeTestButton alloc]initWithFrame:CGRectMake( PADDING, PADDING_TOP+NavBarHeight ,SCREEN_WIDTH - PADDING *2 , BUTTON_Height)];
    [_yCtestButton setImage:[UIImage imageNamed:@"C"] title:@"C字视力测试"];
    _yCtestButton.deledge = self;
    
    //色盲测试
    _yColorTestButton =[[YUEyeTestButton alloc]initWithFrame:CGRectMake(PADDING, 0, SCREEN_WIDTH - PADDING *2, BUTTON_Height)];
    [_yColorTestButton setImage:[UIImage imageNamed:@"colorTestIcon"] title:@"色盲、色弱测试图"];
    
    _yColorTestButton.deledge =self;
    
    [self.view addSubview:_yColorTestButton];
    
    [_yColorTestButton y_bottomFromView:_yCtestButton distance:Color_Top];
    
    [self.view addSubview:_yCtestButton];
 
    //提示Label
    
    _tipLabel = [[UILabel alloc]initWithFrame:CGRectMake(PADDING, 0, 100, 100)];
    
    [self.view addSubview:_tipLabel];
    
    _tipLabel.lineBreakMode = NSLineBreakByCharWrapping;
    _tipLabel.numberOfLines = 0 ;
    [_tipLabel setFont:[UIFont systemFontOfSize:TIP_FONT]];
    
    NSString * tipStr = @"提醒:\n眼睛保护是一项重要的生命工程，它贯穿于我们的工作生活，让我们从现在做起，保护我们的心灵之窗，让它们永远清透明亮";
    
    CGSize labelSize = [[function share ]contentSize:tipStr fontSzie:TIP_FONT maxWidths:SCREEN_WIDTH - PADDING*2 maxHeigh:500];
    
    [_tipLabel setFrame:CGRectMake(PADDING, 0, labelSize.width, labelSize.height)];
    
    [_tipLabel setTextColor:[UIColor chocolateColor]];
    
    [_tipLabel y_setAlign:5];
    
    [_tipLabel setText:tipStr];
    
}
-(void)initNav{
    
    [self setNavTitle:@"眼测试" isShowBack:YES];
    
}

-(void)whenButtonTouchUpInside:(id)sender{

    if(sender == _yColorTestButton){

       
        
    }
    
    if(sender == _yCtestButton){
        
        YUCTestViewController * cTestViewController = [[YUCTestViewController alloc]init];
        [self.navigationController pushViewController:cTestViewController animated:YES];
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

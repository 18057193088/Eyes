//
//  YUHomeViewController.m
//  EyesApp
//
//  Created by 叶夏云 on 15/6/22.
//  Copyright (c) 2015年 叶夏云. All rights reserved.
//

#import "YUHomeViewController.h"
#import "CONST_PUBLIE.h"

#import "UIView+YUStyle.h"
#import "YUGirdItem.h"
#import "UIColor+YUColor.h"
#import "YUGreeButton.h"
#import "CONST_PUBLIE.h"
#import "const_tab.h"
#import "YUEyesActivityViewController.h"
#define start_top 15
#define gird_top 20
#define start_width 150

@interface YUHomeViewController ()

@end

@implementation YUHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUp];
    
    
    // Do any additional setup after loading the view from its nib.
}
-(void)setUp{
     [self.view addSubview:_yScrollView];
    
    
    
      [_yScrollView setFrame:CGRectMake(0, -20, SCREEN_WIDTH, ScreenHeight - TAB_BAR_HEIGH+15)];
    NSLog(@"%f,%f",ScreenHeight,ScreenHeight - TAB_BAR_HEIGH );
    
    _yStartButton = [[YUGreeButton alloc]initWithFrame:CGRectMake(0, 0, start_width, 44)];
    
     [_yScrollView addSubview:_yStartButton];
    
    [_yStartButton setTitle:@"开始,眼保健操" forState:UIControlStateNormal];
    
    [_yStartButton y_setAlign:5];
    
    _yStartButton.center = CGPointMake(SCREEN_WIDTH/2.0, 0);
    
    [_yStartButton y_bottomFromView:_yTwetyThreeLable distance:start_top];
    
    CGFloat girdViewY = [_yStartButton y_BottomY] +  gird_top;
    
    _yGirdView = [[YUGridView alloc]initWithFrame:CGRectMake(0, girdViewY, SCREEN_WIDTH,250)];

    _yGirdView.yFatherScrollerView = _yScrollView;

    _yGirdView.deledge =self;
    
    
    NSLog(@"%lf",[_yScrollView y_Height] - girdViewY);
    
    
     [_yScrollView addSubview:_yGirdView];
    
    NSArray *  itemarr = @[@"定时",@"眼保健操",@"眼测试",@"护眼食材",@"眼镜店",@"意见建议"];
    
    NSMutableArray * mutabArr =[[NSMutableArray alloc]init];
    ;
    for(int i = 0 ; i < itemarr.count; i++){
        
        YUGirdItem * item = [[YUGirdItem alloc]initGirdItemWithTitle:itemarr[i] imageName:itemarr[i]];
        
        [mutabArr addObject:item];
        
        
        
    }

    [_yGirdView setYGirdItems:mutabArr];
  
    
    self.view.backgroundColor =[UIColor colorwithRgb:246 g:246 b:246];

    _yScrollView.contentSize  = CGSizeMake(SCREEN_WIDTH, [ _yGirdView y_BottomY]);
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark 格子按下
-(void)whenGirdItemTouchUpInSide:(NSInteger)index{

  YUEyesActivityViewController * controller =   [[YUEyesActivityViewController alloc]init];
    [self.navigationController pushViewController:controller animated:YES];
    
    
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

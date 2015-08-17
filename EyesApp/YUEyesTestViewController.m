//
//  YUEyesTestViewController.m
//  EyesApp
//
//  Created by yxy on 15/8/16.
//  Copyright (c) 2015年 叶夏云. All rights reserved.
//

#import "YUEyesTestViewController.h"

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
    
}

-(void)initNav{
    
    [self setNavTitle:@"眼测试" isShowBack:YES];
    
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

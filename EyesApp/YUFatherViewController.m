//
//  YUFatherViewController.m
//  EyesApp
//
//  Created by 叶夏云 on 15/6/22.
//  Copyright (c) 2015年 叶夏云. All rights reserved.
//

#import "YUFatherViewController.h"
#import "YUEyesTabController.h"
#import "YUNavNormalView.h"
@interface YUFatherViewController ()

@end

@implementation YUFatherViewController

-(void)viewDidLoad{
    
    [super viewDidLoad];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    
}

-(void)viewWillDisappear:(BOOL)animated{
    
    [super viewWillDisappear:animated];
    

    
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    if(self.navigationController.viewControllers.count >1){
        
        [[YUEyesTabController share ]hideTab];
        
    }else{
        
        [[YUEyesTabController share ]showTab];
        
    }
    
    
}

-(void)setNavTitle:(NSString *) title isShowBack:(BOOL) isShowBack{
    
    if(_y_NavView == nil){
        _y_NavView = [[YUNavNormalView alloc]initDefault];
        
        __weak typeof (self) weakSelf = self;
        
        _y_NavView.whenGouBackTouch = ^(){
            
            [weakSelf.navigationController popViewControllerAnimated:YES];
            
        };
        
    }
    [_y_NavView setNavItem:title IsShowBackView:isShowBack];
    
    [self.view addSubview:_y_NavView];
    
    
    
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

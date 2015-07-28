//
//  YUEyesTabController.m
//  EyesApp
//
//  Created by 叶夏云 on 15/7/2.
//  Copyright (c) 2015年 叶夏云. All rights reserved.
//

#import "YUEyesTabController.h"
#import "UIView+YUStyle.h"
#import "const_tab.h"
#import "UIColor+YUColor.h"
#import "YUHomeViewController.h"
#import "YULoveEyesViewController.h"
#import "YUMineViewController.h"
#import "YUSubControllerItem.h"
#define NormarlBtnTop 20
#define CricleBtnTop 10
@implementation YUEyesTabController
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    // Do any additional setup after loading the view.
}

#pragma mark  override 初始化内存
-(void)setUp{
    [super setUp];
    
    
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark 单例
+(YUEyesTabController *)share{
    
    static YUEyesTabController *tabController = nil;
    
    if(tabController ==nil){
        
        tabController = [[YUEyesTabController alloc]init];
        
        
    }
    
    return  tabController;
    
}
#pragma mark 必须继承
-(NSMutableArray *)tabControllerItems{
    
    NSMutableArray * mut = [[NSMutableArray alloc]init];
    

    NSArray * titles =@[@"首页",@"爱眼百科",@"我的",@"秒杀"];
    
    //初始化各个大页面
    
    YUHomeViewController * home = [[YUHomeViewController alloc]init];
    YULoveEyesViewController * loveBike =[[YULoveEyesViewController alloc]init];
    YUMineViewController * mine =[[YUMineViewController alloc]init];
    
    NSArray * navRoots = @[home,loveBike,mine];
    
    for(int i =0;i<3;i++){
        
        YUSubControllerItem * item = [[YUSubControllerItem alloc]init];
        
        
        item.image =[UIImage imageNamed:titles [i ]];
        
        item.imgae_touched = [UIImage imageNamed:[NSString stringWithFormat:@"%@h", [titles objectAtIndex:i]  ]];
        
        item.titleColor = [UIColor yFontGrayColor];
        
        item.titleColor_s = [UIColor colorwithRgb:82 g:177 b:89];
        
        UINavigationController * nav = [[UINavigationController alloc]initWithRootViewController:navRoots[i ]];
        
        nav.navigationBarHidden = YES;
        
        
      
        
        
        item.viewController = nav;
        
        item.title  = titles[i];
        
        [mut addObject:item];
        
    }
    
    
    return mut;
    
    
    return nil;
    
}

-(CGSize)sizeOfItemButton{
    
    return CGSizeMake(55, 55);
    
}

@end

//
//  YUTabController.m
//  YUTabController
//
//  Created by yxy on 15/1/26.
//  Copyright (c) 2015年 XIAYUN.YE. All rights reserved.
//

#import "YUTabController.h"
#import "YUSubControllerItem.h"
#import "const_tab.h"
#import "UIView+YUStyle.h"
#import "YUTabBarView.h"
@interface YUTabController ()

@end

@implementation YUTabController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
  
    [self setUp];
}


// 初始化内存
-(void)setUp{
    
 
    
    _yIsShowTabBar = YES;
    
    _subControllerItems = [[NSMutableArray alloc ]init];
    
    _yTabBarView = [[YUTabBarView alloc]initWithFrame:CGRectMake(0, ScreenHeight - TAB_BAR_HEIGH, SCREEN_WIDTH , TAB_BAR_HEIGH)];
    
    _yTabBarView.deldge =self;
    
    [_yTabBarView setBackgroundImage:[UIImage imageNamed:@"tabbg"]];
    
    _yTabBarView.yFatherTabController =self;
    
    _yButtonSize = [self sizeOfItemButton]; // 获取重载后的按钮高度
    
    _subControllerItems = [self tabControllerItems]; // 获取重载后的TabItems;
    
    [_yTabBarView setUp];
    
    for(YUSubControllerItem * item in _subControllerItems){
    
        [self addChildViewController:item.viewController];
        
    }
    
    YUSubControllerItem * firstItem = [_subControllerItems objectAtIndex:0];;
    
       _yCurrentViewController =firstItem.viewController;
    [self.view  addSubview:firstItem.viewController.view];
    
    [self.view addSubview:_yTabBarView];
    
    [firstItem.viewController.view y_setHeight:ScreenHeight];
    
    YUTabItemButton * btn =_yTabBarView.TabButtons[0];
    
    [btn TransSelectedStatus];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark 单例
+(YUTabController *)share{
    
    static YUTabController *tabController = nil;
    
    if(tabController ==nil){
        
        tabController = [[YUTabController alloc]init];
        
    }
    
    return  tabController;
    
}




#pragma mark 必须继承 ，构造
-(NSMutableArray *)tabControllerItems{
    
    NSMutableArray * mut = [[NSMutableArray alloc]init];
    
    NSArray * colors =@[[UIColor greenColor],[UIColor blackColor],[UIColor blueColor],[UIColor redColor]];
    
    
    for(int i =0;i<3;i++){
        YUSubControllerItem * item = [[YUSubControllerItem alloc]init];
        item.image =[UIImage imageNamed:@"HUD_YES"];
        UINavigationController * nav = [[UINavigationController alloc]init];
        
        UIView * view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 40, 40)];
        
    
        
        
        [nav.navigationBar addSubview:view];
        
        nav.view.backgroundColor = colors[i];
        
        item.viewController = nav;
        
        item.title  = @"我的";
        
        [mut addObject:item];
        
    }
    
    return mut;
    
    
    
    return nil;
    
}
#pragma mark 必须继承
-(CGSize )sizeOfItemButton{
    
    
    return CGSizeMake(0, 0);
    
}

#pragma mark 隐藏TAB
-(void)hideTab{
    
    if(_yIsShowTabBar ==NO){
        return;
        
    }
    
    [_yTabBarView y_setBottom:0 ];
    
    [UIView animateWithDuration:0.3 animations:^{
        
        _yTabBarView.frame = CGRectMake(0, ScreenHeight, [_yTabBarView y_Width], [_yTabBarView y_Height]);
            } completion:^(BOOL finished) {
        
        _yIsShowTabBar = NO;
        
    }];
    

}
#pragma mark 显示TAB

-(void)showTab{
   
    if(_yIsShowTabBar){
        return;
        
    }
    [_yTabBarView y_setBottom:-[_yTabBarView y_Height] ];

    
    [UIView animateWithDuration:0.3 animations:^{
        _yTabBarView.frame = CGRectMake(0, ScreenHeight-[_yTabBarView y_Height] , [_yTabBarView y_Width], [_yTabBarView y_Height]);
        
   
        
        
    } completion:^(BOOL finished) {
        
        _yIsShowTabBar = YES;
        
    }];
    

}

#pragma mark TAB 按钮按下
-(void)TabBarTouchUpInside:(int)index{
    
    
   
    
    YUSubControllerItem * willItem = [_subControllerItems objectAtIndex:index];
    
    UIViewController * willTransViewController =willItem.viewController ;
    
    UINavigationController * navController = (UINavigationController *) willTransViewController;
   
    if(willTransViewController == _yCurrentViewController){
        
        return;

    }
    
    [_yCurrentViewController.view removeFromSuperview];
    
    [self.view insertSubview:willItem.viewController.view atIndex:0];
    
    _yCurrentViewController = willItem.viewController;
    
    
    


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

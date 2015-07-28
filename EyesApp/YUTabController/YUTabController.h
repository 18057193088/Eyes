//
//  YUTabController.h
//  YUTabController
//
//  Created by yxy on 15/1/26.
//  Copyright (c) 2015年 XIAYUN.YE. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YUTabBarView.h"

@class YUSubControllerItem;
@class YUTabBarView;
@interface YUTabController : UIViewController<YUTaBarViewDeledge>

@property(strong,nonatomic) NSMutableArray  * subControllerItems;

@property(strong,nonatomic) YUTabBarView * yTabBarView;

@property(assign,nonatomic) CGSize yButtonSize;

@property(weak,nonatomic) UIViewController * yCurrentViewController;



@property(assign,nonatomic) BOOL yIsShowTabBar;



+(YUTabController *)share;

#pragma mark 必须继承
-(NSMutableArray *)tabControllerItems;

#pragma mark 必须继承

-(CGSize )sizeOfItemButton;

#pragma mark 显示Tab
-(void)showTab;
#pragma mark 隐藏TAB
-(void)hideTab;
#pragma mark 初始化内存
-(void)setUp;

-(void)initSettingWithSubControllerItems:(NSMutableArray *)arr TabButtonSize:(CGSize) buttonSize;

@end

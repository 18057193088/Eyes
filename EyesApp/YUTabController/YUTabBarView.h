//
//  YUTabBarView.h
//  YUTabController
//
//  Created by yxy on 15/1/26.
//  Copyright (c) 2015年 XIAYUN.YE. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "const_tab.h"
#import "YUTabItemButton.h"
@class YUTabController;

@protocol YUTaBarViewDeledge <NSObject>

@optional

-(void)TabBarTouchUpInside:(int)index ;


@end

@interface YUTabBarView : UIView<YUTabItemButtonDeldge>

@property(weak,nonatomic) YUTabController * yFatherTabController;

//TAB 按钮
@property(strong,nonatomic) NSMutableArray  * TabButtons;

@property(weak,nonatomic) id<YUTaBarViewDeledge> deldge;

-(void)setBackgroundImage:(UIImage *)image;


-(void)setUp;

@end

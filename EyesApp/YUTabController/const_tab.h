//
//  const_tab.h
//  YUTabController
//
//  Created by yxy on 15/1/26.
//  Copyright (c) 2015年 XIAYUN.YE. All rights reserved.
//


#define IS_IOS_7 ([[[UIDevice currentDevice] systemVersion] doubleValue]>=7.0)?YES:NO

#define ScreenHeight ((IS_IOS_7)?([UIScreen mainScreen].bounds.size.height):([UIScreen mainScreen].bounds.size.height - 20))
#define SCREEN_WIDTH (int)[UIScreen mainScreen].bounds.size.width

#define TAB_BUTTON_WIDTH 55
#define TAB_BAR_HEIGH 50

#define TAB_IMAGE_TOP 5
#define TAB_IMAGE_WIDH 21
#define TAB_IMAGE_HEIGH 21

#define Notifiction_Name_ItemButtonTouch @"Notifiction_Name_ItemButtonTouch"

#define Button_title_fontSize 13
#define Button_title_top 5

#define GRAY_VIEW_HEIGH 50
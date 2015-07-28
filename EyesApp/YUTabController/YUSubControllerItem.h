//
//  YUSubControllerItem.h
//  YUTabController
//
//  Created by yxy on 15/1/26.
//  Copyright (c) 2015年 XIAYUN.YE. All rights reserved.
//

#import <Foundation/Foundation.h>
@class UIViewController;
@class UIImage;
@class UIColor;


@interface YUSubControllerItem : NSObject

@property(strong,nonatomic) UIViewController * viewController;

@property(strong,nonatomic) UIImage * image;

@property(strong,nonatomic) UIImage * imgae_touched;

@property(strong,nonatomic) UIColor * titleColor ;

@property(strong,nonatomic) UIColor * titleColor_s ;

@property(copy,nonatomic) NSString * title;

@end

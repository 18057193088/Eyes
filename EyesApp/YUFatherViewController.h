//
//  YUFatherViewController.h
//  EyesApp
//
//  Created by 叶夏云 on 15/6/22.
//  Copyright (c) 2015年 叶夏云. All rights reserved.
//

#import <UIKit/UIKit.h>
@class YUNavNormalView;
@interface YUFatherViewController : UIViewController
@property(strong,nonatomic) YUNavNormalView * y_NavView;
-(void)setNavTitle:(NSString *) title isShowBack:(BOOL) isShowBack;
-(void)hideTitle;

@end
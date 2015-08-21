//
//  YUMiniNumButtonGroup.h
//  EyesApp
//
//  Created by yxy on 15/8/20.
//  Copyright (c) 2015年 叶夏云. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YUMiniNumButtonGroup : UIView
@property(strong,nonatomic) UIScrollView * yScrollerView;
@property(strong,nonatomic) NSMutableArray * yMiniButtonArr;
@property(assign,nonatomic) int MaxNum ;

-(void)setMaxNum:(int)num;
@end

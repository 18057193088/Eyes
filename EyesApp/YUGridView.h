//
//  YUGridView.h
//  EyesApp
//
//  Created by 叶夏云 on 15/6/22.
//  Copyright (c) 2015年 叶夏云. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol YUGirdViewDeledge <NSObject>

-(void)whenGirdItemTouchUpInSide:(NSInteger)index ;


@end
@interface YUGridView : UIView
@property(strong,nonatomic) NSMutableArray * yGirdElementArrary;
@property(strong,nonatomic) NSMutableArray * yGirdItems;
@property(weak,nonatomic) UIScrollView * yFatherScrollerView;
@property(weak,nonatomic) id<YUGirdViewDeledge> deledge ;

@end

//
//  YUButtonGroup.h
//  EyesApp
//
//  Created by yxy on 15/8/12.
//  Copyright (c) 2015年 叶夏云. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol YUButtonGroupDeledge <NSObject>

-(void)whenGroupButtonTouchUpInSide:(int)buttonIndex;


@end

@interface YUButtonGroup : UIView
-(id)initWithFrame:(CGRect)frame titles:(NSArray *)arr;
@property(strong,nonatomic) NSMutableArray * buttons ;
@property(weak,nonatomic) id<YUButtonGroupDeledge>deledge ;

@end

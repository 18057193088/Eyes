//
//  UIView+YUAnimation.m
//  EyesApp
//
//  Created by yxy on 15/7/30.
//  Copyright (c) 2015年 叶夏云. All rights reserved.
//

#import "UIView+YUAnimation.h"
#import "UIView+YUStyle.h"
#import "CONST_PUBLIE.h"
@implementation UIView (YUAnimation)

-(void)dissMiss{


    [UIView animateWithDuration:0.5 animations:^{
    
     
        self.alpha = 0 ;
        
    }];
    
}
@end

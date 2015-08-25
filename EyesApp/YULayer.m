//
//  YULayer.m
//  EyesApp
//
//  Created by yxy on 15/8/25.
//  Copyright (c) 2015年 叶夏云. All rights reserved.
//

#import "YULayer.h"
#import "CONST_PUBLIE.h"
#import "UIColor+YUColor.h"
@implementation YULayer

-(id)initFrame:(CGRect)rect{
    
    self = [super init];
    if(self){
    
        self.frame =rect;
        self.frame= CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, 0.7);
        self.backgroundColor = [UIColor borderGrayColor].CGColor;
        
    }
    return self;
    

}
@end

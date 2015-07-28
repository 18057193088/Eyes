//
//  YUGreeButton.m
//  EyesApp
//
//  Created by 叶夏云 on 15/7/2.
//  Copyright (c) 2015年 叶夏云. All rights reserved.
//

#import "YUGreeButton.h"
#import "UIColor+YUColor.h"
@implementation YUGreeButton


-(id)initWithFrame:(CGRect)frame{

    self = [super initWithFrame:frame];
    
    
    if(self){
    
        [self setUp];
        
    }
    
    return self;
    
}

-(void)setUp{
    self.layer.masksToBounds =YES;
    
    self.layer.cornerRadius = self.frame.size.height / 2.0;
    
    self.layer.borderColor = [UIColor colorwithRgb:163 g:205 b:166 ].CGColor;
    self.layer.borderWidth=0.5;
    
    
    
    [self.titleLabel setFont:[UIFont systemFontOfSize:13]];
    
    
    [self setTitleColor:[UIColor colorwithRgb:121 g:186 b:100] forState:UIControlStateNormal];
    
    

}/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

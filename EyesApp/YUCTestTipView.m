//
//  YUCTestTipView.m
//  EyesApp
//
//  Created by yxy on 15/8/25.
//  Copyright (c) 2015年 叶夏云. All rights reserved.
//

#import "YUCTestTipView.h"
#import "function.h"
#import "CONST_PUBLIE.h"
#import "UIView+YUStyle.h"
#define PADDING 50
#define FONT_SZIE 16
@implementation YUCTestTipView

-(id)initWithFrame:(CGRect)frame{

    self = [super initWithFrame:frame];
    
    if(self){
        
        [self setUp];
        
    }
    
    
    
    return self;
}


-(void)setUp{
    
    self.backgroundColor = [UIColor whiteColor];
    
    
    float tipWidth = SCREEN_WIDTH - PADDING *2;
    
    NSString * tipString =@"把 ‘C’ 从园内，以 'C' 的缺口方向(上, 下, 左, 右), 把它从园内拖出....";
    
  CGSize size =   [[function share]contentSize:tipString fontSzie:FONT_SZIE maxWidths:tipWidth maxHeigh:200];
    
    
    _tipLabel = [[ UILabel alloc]initWithFrame:CGRectMake(PADDING, PADDING, SCREEN_WIDTH - PADDING *2 , 80)];
    _tipLabel.numberOfLines = 0 ;
    _tipLabel.lineBreakMode = NSLineBreakByCharWrapping;
    [_tipLabel setFont:[UIFont systemFontOfSize:FONT_SZIE]];
    
    [_tipLabel y_setWidth:size.width];
    [_tipLabel y_setTop:size.height];
    
     [_tipLabel setText:tipString];
    [self addSubview:_tipLabel];
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

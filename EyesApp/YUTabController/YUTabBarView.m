//
//  YUTabBarView.m
//  YUTabController
//
//  Created by yxy on 15/1/26.
//  Copyright (c) 2015年 XIAYUN.YE. All rights reserved.
//

#import "YUTabBarView.h"
#import "YUSubControllerItem.h"
#import "YUTabController.h"
#import "UIColor+YUColor.h"
@implementation YUTabBarView

-(id)initWithFrame:(CGRect)frame{

    self = [super initWithFrame:frame];
    
    
    return self;
    
}

#pragma mark 初始化
-(void)setUp{

    self.backgroundColor = [UIColor whiteColor];
    
    self.layer.borderColor= [UIColor GRAY_240_240_240].CGColor;
    self.layer.borderWidth =0.5;
    
    _TabButtons  = [[NSMutableArray alloc]init];
    
    NSMutableArray *  subControlllerItems =_yFatherTabController.subControllerItems ;
    if(subControlllerItems == nil){
        
        return;
    }
    
    int point = 0;
    
    for(YUSubControllerItem * c_item in subControlllerItems){
    
        YUTabItemButton * btn = [YUTabItemButton
                                 createYUTabItemButtonWith:CGRectMake(0, 0, TAB_BUTTON_WIDTH, TAB_BAR_HEIGH)
                                                                     image:c_item.image
                                 image_s:c_item.imgae_touched
                                 title:c_item.title
                                 titleColr:c_item.titleColor titleColr_s:c_item.titleColor_s
                                 ];
        btn.index = point++;
        
        btn.deledge =self;
    
        [_TabButtons addObject:btn];
        
        [self addSubview:btn];
        
        
    }
    // 分配 各个按钮的位置
    float everyPartScal=  1 /  (float)_yFatherTabController.subControllerItems.count;
    //(t+l)/2
    for(int i = 0 ; i < _TabButtons.count ;i++){
        
        float everyPartWidth = everyPartScal * SCREEN_WIDTH;
        
        float thisPartStartX= i * everyPartWidth;
        
        float thisPartCenterX = thisPartStartX + everyPartWidth/2;
        
       YUTabItemButton * itemBtn = [_TabButtons objectAtIndex:i];
        
       itemBtn.center = CGPointMake(thisPartCenterX, itemBtn.center.y);
        
    }
    
  
    
    
}


#pragma mark 设置背景图片
-(void)setBackgroundImage:(UIImage *)image{

   
    self.contentMode = UIViewContentModeScaleAspectFit;
    
    self.layer.contents = (id) image.CGImage;
    self.backgroundColor = [UIColor clearColor];
    
}

-(void)ButtonTounUpInsideWithIndex:(int)index{
    
    [_deldge TabBarTouchUpInside:index];

}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

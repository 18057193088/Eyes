//
//  YUGirdItem.m
//  EyesApp
//
//  Created by 叶夏云 on 15/7/1.
//  Copyright (c) 2015年 叶夏云. All rights reserved.
//

#import "YUGirdItem.h"

@implementation YUGirdItem

-(id)initGirdItemWithTitle:(NSString *)title imageName:(NSString *)imaName{

    
    self = [super init];
    
    if(self){
        _yImageName = imaName;
        _yTitle = title;
        
    }
    
    return self;
    
    

}
@end

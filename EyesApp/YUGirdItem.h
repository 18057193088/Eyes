//
//  YUGirdItem.h
//  EyesApp
//
//  Created by 叶夏云 on 15/7/1.
//  Copyright (c) 2015年 叶夏云. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YUGirdItem : NSObject
@property(copy,nonatomic) NSString * yTitle;
@property(copy,nonatomic) NSString *yImageName;

-(id)initGirdItemWithTitle:(NSString *)title imageName:(NSString *)imaName;

@end

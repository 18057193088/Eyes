//
//  function.h
//  EyesApp
//
//  Created by yxy on 15/7/30.
//  Copyright (c) 2015年 叶夏云. All rights reserved.
//


#import <UIKit/UIKit.h>
@interface function : NSObject
+(function *)share;
-(CGSize)contentSize:(NSString *) str fontSzie:(int)fontSize maxWidths:(float)maxWidths maxHeigh:(float)maxHeigh;

@end

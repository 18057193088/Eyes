//
//  function.m
//  EyesApp
//
//  Created by yxy on 15/7/30.
//  Copyright (c) 2015年 叶夏云. All rights reserved.
//

#import "function.h"

@implementation function
-(CGSize)contentSize:(NSString *) str fontSzie:(int)fontSize maxWidths:(float)maxWidths maxHeigh:(float)maxHeigh {
    
    float maxWidth =maxWidths;
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc]init];
    
    paragraphStyle.lineBreakMode = NSLineBreakByCharWrapping;
    
    NSDictionary *attributes = @{NSFontAttributeName:[UIFont systemFontOfSize:fontSize], NSParagraphStyleAttributeName:paragraphStyle.copy};
    
    
    
    
    CGSize   labelSize = [str boundingRectWithSize:CGSizeMake(maxWidth, maxHeigh) options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:attributes context:nil].size;
    
    return labelSize;
    
}
+(function *)share{

    static function * f = nil;
    if(f == nil){
    
        f = [[function alloc]init];
        
    }
    
    return f;
    
}
@end

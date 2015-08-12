//
//  UIColor+YUColor.m
//  YUANBAOAPP
//
//  Created by yxy on 14-8-14.
//  Copyright (c) 2014年 ATAW. All rights reserved.
//

#import "UIColor+YUColor.h"

@implementation UIColor (YUColor)

+(UIColor * )borderGrayColor{
    
    return [UIColor colorWithRed:228/255.0 green:228/255.0 blue:228/255.0 alpha:1];
}
+(UIColor *) MainViewbackGroundColor{
    
    return [UIColor colorWithRed:239 /255.0 green:239/255.0 blue:239/255.0 alpha:1];
}
+(UIColor*)lowGrayColor{

    return [UIColor colorWithRed:149 /255.0 green:149/255.0 blue:149/255.0 alpha:1];
}
+(UIColor *)yDeepBlueColor{
    
    return [UIColor colorWithRed:0 /255.0 green:140/255.0 blue:206/255.0 alpha:1];
  

}
+(UIColor *)yYbOrangeColor{


    return [UIColor colorWithRed:224 /255.0 green:77/255.0 blue:62/255.0 alpha:1];
}
+(UIColor *)yDeepGrayColor{
    
    return [UIColor colorWithRed:181 /255.0 green:181/255.0 blue:181/255.0 alpha:1];

}

+(UIColor *)yDarkBlackColor{

return [UIColor colorWithRed:74 /255.0 green:74/255.0 blue:74/255.0 alpha:1];

    }

+(UIColor *)yFontGrayColor{

    return [UIColor colorWithRed:147/255.0 green:147/255.0 blue:147/255.0 alpha:1];

}

+(UIColor *)yFontBlue{
    
    return [UIColor colorWithRed:50/255.0 green:187/255.0 blue:180/255.0 alpha:1];
    
}
+(UIColor *)rgb_49_187_179_green{

    return [UIColor colorWithRed:51/255.0 green:193/255.0 blue:186/255.0 alpha:0.99];
    

}
+(UIColor *) gray_rgb_230_230_230{

    return [UIColor colorWithRed:230/255.0 green:230/255.0 blue:230/255.0 alpha:1];
    
}

+(UIColor *)GRAY_240_240_240{
    return [UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1];


}
+(UIColor *) yPriceRed {
    
    return [UIColor colorWithRed:185/255.0 green:40/255.0 blue:40/255.0 alpha:1];
    
    
}
+(UIColor * )pink_rgb_253_235_235{

    return [UIColor colorWithRed:253/255.0 green:235/255.0 blue:235/255.0 alpha:1];
    
}


+(UIColor *)colorwithRgb:(CGFloat )r g:(CGFloat) g b:(CGFloat)  b {

    return [UIColor colorWithRed:r / 255.0 green:g /255.0  blue:b / 255.0  alpha:1];
    
}

+(UIColor *)yDeepRedColor{

    return [UIColor colorwithRgb:102 g:0 b:35];
    
}
+(UIColor *) yNavGreen{

    return [UIColor colorwithRgb:60 g:141 b:62];
    
}

@end

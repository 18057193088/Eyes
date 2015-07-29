//
//  CONST_PUBLIE.h
//  EyesApp
//
//  Created by 叶夏云 on 15/6/23.
//  Copyright (c) 2015年 叶夏云. All rights reserved.
//

#define SCREEN_WIDTH (int)[UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT (int)[UIScreen mainScreen].bounds.size.height
#define NavBarHeight 65
#define StateBarHeight 20
#define IMPOSSIBLE -26545

typedef void (^none_return_callback)(void);

typedef void(^pageChange)(int );

typedef void(^pageChange)(int );

typedef void(^_int_block)(int );
typedef void(^_int_int_block)(int,int );
typedef void(^_int_int_int_block)(int,int ,int  );

typedef void (^backBlock)(NSDictionary* ,NSDictionary *);

typedef void (^webApi_DataArray_infoArray_resulutCode)(NSArray * ,NSArray *, int  );

typedef void (^webApi_DataArray_infoArray)(NSArray *,NSArray *  );

typedef void (^webApi_DataArray) (NSArray *  );

typedef void (^webapi_BodyDict_InfoDict_RsultCode)(NSDictionary*,NSDictionary*,int);

typedef void (^webApi_resuluCode)(int);
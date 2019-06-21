//
//  FXW_Define.h
//  Laboratory
//
//  Created by mac on 2019/6/21.
//  Copyright © 2019 mac. All rights reserved.
//

#ifndef FXW_Define_h
#define FXW_Define_h

//获取手机屏幕的宽、高
#define screenWidth  [[UIScreen mainScreen] bounds].size.width
#define screenHeight [[UIScreen mainScreen] bounds].size.height

//RGB 取色
#define FXW_RGBColor(r,g,b) ([UIColor colorWithRed:(r * 1.0 /255) green:g * 1.0/255 blue:b * 1.0/255 alpha:1.0])

#endif /* FXW_Define_h */

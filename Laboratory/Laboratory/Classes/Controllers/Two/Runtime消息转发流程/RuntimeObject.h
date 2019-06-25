//
//  RuntimeObject.h
//  RuntimeTest
//
//  Created by yangyang38 on 2018/2/25.
//  Copyright © 2018年 yangyang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RuntimeObject : NSObject

//测试消息转发流程
- (void)test;

//方法交换
- (void)testFuncOne;
- (void)testFuncTwo;

//动态添加方法实现
- (void)meiyouwo;

@end

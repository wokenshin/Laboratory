//
//  RuntimeObject.m
//  RuntimeTest
//
//  Created by yangyang38 on 2018/2/25.
//  Copyright © 2018年 yangyang. All rights reserved.
//

#import "RuntimeObject.h"
#import <objc/runtime.h>
@implementation RuntimeObject

//MethodSwizzling⬇️⬇️⬇️

+ (void)load{
    
    //获取方法
    Method one = class_getInstanceMethod(self, @selector(testFuncOne));
    Method two = class_getInstanceMethod(self, @selector(testFuncTwo));
    
    //交换两个方法的实现
    method_exchangeImplementations(one, two);
    
}

- (void)testFuncOne{
    NSLog(@"testFuncOne");
}

- (void)testFuncTwo{
    [self testFuncTwo];//由于上面load中已经做了方法替换，这里实际上调用的是 testFUncOne 并不会产生死递归
    NSLog(@"testFuncTwo");
}

//MethodSwizzling⬆️⬆️⬆️⬆️



//注意 这是一个函数
void meiyouwoImp (void)
{
    NSLog(@"meiyouwo invoke");
}


+ (BOOL)resolveInstanceMethod:(SEL)sel
{
    
    if (sel == @selector(meiyouwo)) {
        // 动态添加meiyouwo方法的实现
        class_addMethod(self, @selector(meiyouwo), meiyouwoImp, "v@:");
        NSLog(@"resolveInstanceMethod:");
        return YES;
    }
    // 如果是test方法 打印日志
    if (sel == @selector(test)) {
        NSLog(@"resolveInstanceMethod:");
        return NO;
    }
    else{
        // 返回父类的默认调用
        return [super resolveInstanceMethod:sel];
    }
}

- (id)forwardingTargetForSelector:(SEL)aSelector
{
    NSLog(@"forwardingTargetForSelector:");
    return nil;
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector
{
    if (aSelector == @selector(test)) {
        NSLog(@"methodSignatureForSelector:");
        // v 代表返回值是void类型的  @代表第一个参数类型时id，即self
        // : 代表第二个参数是SEL类型的  即@selector(test)
        return [NSMethodSignature signatureWithObjCTypes:"v@:"];
    }
    else{
        return [super methodSignatureForSelector:aSelector];
    }
}

- (void)forwardInvocation:(NSInvocation *)anInvocation
{
    NSLog(@"forwardInvocation:");
}

@end

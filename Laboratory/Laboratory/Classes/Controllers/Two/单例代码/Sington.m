//
//  Sington.m
//  Laboratory
//
//  Created by kenshin van on 2019/7/13.
//  Copyright © 2019 mac. All rights reserved.
//

#import "Sington.h"
//参考：https://juejin.im/post/5cde874c51882525f77dc17b
@interface Sington()

@end;

@implementation Sington

////断言
//+ (instancetype)alloc {
//    NSCAssert(!_instance, @"OneTimeClass类只能初始化一次");
//    return [super alloc];
//}

+ (instancetype)shareSington{
    return [[self alloc] init];//---> alloc 的时候会--->会走 allocWithZone
}

// 创建静态对象 防止外部访问
static Sington *_instance = nil;

//调用 alloc 或者 new 都会来到这个方法 所以在这里实现单例初始化的操作
+ (instancetype)allocWithZone:(struct _NSZone *)zone{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (_instance == nil) {
            _instance = [super allocWithZone:zone];
        }
    });
    return _instance;
}

- (instancetype)copyWithZone:(NSZone *)zone{
    return _instance;
}

- (instancetype)mutableCopyWithZone:(NSZone *)zone{
    return _instance;
}

- (void)test{
    //通过代码验证，在将我们的单例置为nil之后，再重新获取单例，依然能拿到原先的单例，说明将单例置为nil是无法释放单例的
    //那么单例应该如何释放呢？或许这是一个伪命题 单例就是无法释放的对象 有时间的时候再去研究下
    FXWLog(@"我是单例 我的首地址:%p self：%p", _instance, self);
}

- (void)removeSelf{
    /*
     如果在这里将静态变量置为nil的话 那么就无法获取先前的指针地址了，
     而且由于 dispatch_once 只会执行一次的关系
     所以_instance不会在此被创建
     */
    FXWLog(@"打印单例静态变量的【地址 全局区域指针的内存地址】：%p", &_instance);
    FXWLog(@"打印单例静态变量的【内容 堆内存中单例对象的首地址】：%p", _instance);
    _instance = nil;
    FXWLog(@"打印单例静态变量的【地址 全局区域指针的内存地址】：%p", &_instance);
    FXWLog(@"打印单例静态变量的【内容 堆内存中单例对象的首地址】：%p", _instance);
}

- (void)dealloc
{
    FXWLog(@"我是单例 TM 我释放了！！！");
    FXWLog(@"打印单例静态变量的【地址 全局区域指针的内存地址】：%p", &_instance);
    FXWLog(@"打印单例静态变量的【内容 堆内存中单例对象的首地址】：%p", _instance);
}
@end

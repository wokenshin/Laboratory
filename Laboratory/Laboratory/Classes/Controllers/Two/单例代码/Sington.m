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

+ (instancetype)shareSington{
    return [[self alloc] init];
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
    FXWLog(@"你将为置为nil，我还在内存当中，获取单例还能找到我 我的内存地址:%p", _instance);
}
@end

//
//  NSTimer+FXW.m
//  Laboratory
//
//  Created by kenshin van on 2019/6/26.
//  Copyright © 2019 mac. All rights reserved.
//

#import "NSTimer+FXW.h"

//定义的【中间对象】 用于销毁timer 破除循环引用
@interface TimerWeakObject : NSObject
@property (nonatomic, weak) id target;
@property (nonatomic, assign) SEL selector;
@property (nonatomic, weak) NSTimer *timer;

- (void)fire:(NSTimer *)timer;
@end

@implementation TimerWeakObject
- (void)fire:(NSTimer *)timer{
    if (self.target) {//在周期调用的方法里面判断 是否触发的方法关联的对象已被释放
        if ([self.target respondsToSelector:self.selector]) {
            [self.target performSelector:self.selector withObject:timer.userInfo];
        }
    }
    else{//触发方法关联的对象已被释放
        [self.timer invalidate];
    }
}
@end

@implementation NSTimer (FXW)


/**
 通过使用分类创建的timer来解决 循环引用的问题，
 通过使用【中间对象】TimerWeakObject，在每次出发timer调用的方法时做一个判断，如果调用的方法关联的对象已经释放了，就invalidate
 */
+ (NSTimer *)category_scheduledTimerWithTimeInterval:(NSTimeInterval)interval
                                            target:(id)target
                                          selector:(SEL)selector
                                          userInfo:(id)userInfo
                                           repeats:(BOOL)repeats{
    //首先创建中间对象
    TimerWeakObject *obj = [[TimerWeakObject alloc] init];
    obj.target = target;
    obj.selector = selector;
    obj.timer = [NSTimer scheduledTimerWithTimeInterval:interval
                                                 target:obj
                                               selector:@selector(fire:)
                                               userInfo:userInfo
                                                repeats:repeats];
    return obj.timer;
}

@end

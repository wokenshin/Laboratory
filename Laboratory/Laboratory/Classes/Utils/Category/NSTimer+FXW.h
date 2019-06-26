//
//  NSTimer+FXW.h
//  Laboratory
//
//  Created by kenshin van on 2019/6/26.
//  Copyright © 2019 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSTimer (FXW)


/**
 使用分类创建的Timer 不需要关心循环引用的问题，内部使用 中间对象破除循环引用
 用分类的方式来解决Timer 循环引用的问题 的确优雅了很多，核心是用到了一个 【中间对象】
 */
+ (NSTimer *)category_scheduledTimerWithTimeInterval:(NSTimeInterval)interval
                                              target:(id)target
                                            selector:(SEL)selector
                                            userInfo:(id)userInfo
                                            repeats:(BOOL)repeats;

@end

NS_ASSUME_NONNULL_END

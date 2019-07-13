//
//  Sington.h
//  Laboratory
//
//  Created by kenshin van on 2019/7/13.
//  Copyright © 2019 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Sington : NSObject

/*
 实现单例的另外一种方法【个人觉得不可取】
 通过禁用 下面的方法 让调用者 只能调用允许的接口
 但是个人觉得这个方法不可取，因为头文件中被禁用的部分 调用者完全可以删除掉。。。
 我试着将这里的代码放到.m文件里，就没有效果了。。。
*/

//+ (instancetype)alloc __attribute__((unavailable("call sharedInstance instead")));
//+ (instancetype)new __attribute__((unavailable("call sharedInstance instead")));
//- (instancetype)copy __attribute__((unavailable("call sharedInstance instead")));
//- (instancetype)mutableCopy __attribute__((unavailable("call sharedInstance instead")));

+ (instancetype)shareSington;
- (void)test;

@end

NS_ASSUME_NONNULL_END

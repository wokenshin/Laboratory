//
//  LOADFather.h
//  Laboratory
//
//  Created by kenshin van on 2019/7/3.
//  Copyright © 2019 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/*
 说明：在build Phase 的 compile source 中可试着修改当前目录下的几个类的顺序，查看一下load方法的调用顺序的变化
 这是在【左邻】遇到的一个面试题
 
 当类对象被引入项目时，runtime会向每一个类对象发送load消息
 load方法会在每一个类甚至分类被引入时仅调用一次，调用的顺序：父类优先于子类，子类优先于分类，分类的调用顺序是根据compile source中添加的顺序来决定的
 
 换句话说，compile source中 父类 和子类的顺序 怎么修改都不会影响load的调用顺序，只有分类会收到影响，谁先添加进去谁就先调用
 */
@interface LOADFather : NSObject

@end

NS_ASSUME_NONNULL_END

//
//  MRCDemo.m
//  Laboratory
//
//  Created by kenshin van on 2019/7/2.
//  Copyright © 2019 mac. All rights reserved.
//

#import "MRCDemo.h"
//设置指定类 支持ARC 或者MRC https://www.jianshu.com/p/b8cccbbd03f3


//当前类 处于 MRC 环境
@implementation MRCDemo

- (void)testOoe{
    
    NSDictionary *dic = [NSDictionary dictionaryWithObject:@"obj" forKey:@"key"];
    NSLog(@"%@", [dic objectForKey:@"key"]);
    [dic release];//由于使用 便利构造器的原因 这里会崩溃。。。。
    
}
@end

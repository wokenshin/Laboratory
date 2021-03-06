//
//  MObject.m
//  KVO_TEST
//
//  Created by yangyang38 on 2018/3/3.
//  Copyright © 2018年 yangyang. All rights reserved.
//

#import "MObject.h"

@implementation MObject

- (id)init
{
    self = [super init];
    if (self) {
        _value = 0;
    }
    return self;
}

- (void)setValue:(int)value{
    FXWLog(@"在 MObject 中 setValue被调用 %d", value);
}

- (void)increase
{
    //直接为成员变量赋值
    [self willChangeValueForKey:@"value"];
    _value += 1;
    [self didChangeValueForKey:@"value"];
}

@end

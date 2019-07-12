//
//  MyEventView.m
//  Laboratory
//
//  Created by kenshin van on 2019/7/6.
//  Copyright © 2019 mac. All rights reserved.
//

#import "MyEventView.h"

@implementation MyEventView

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
    FXWLog(@"hitTest %@", _name);
    return [super hitTest:point withEvent:event];
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event{
    BOOL isOK = [super pointInside:point withEvent:event];
    
//    点击 黄色View和绿色View交集部分，如果想让事件传递到绿色view，就需要将对应的view的pointInside返回NO，如下
//    if ([_name isEqualToString:@"黄色View1"] || [_name isEqualToString:@"灰色View"]) {
//        isOK = NO;
//    }
    
    NSString *ifRes = isOK?@"YES":@"NO";
    FXWLog(@"pointInside %@:是否响应%@", _name, ifRes);
    return isOK;
}

@end

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
    return [super hitTest:point withEvent:event];
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event{
    BOOL isOK = [super pointInside:point withEvent:event];
    NSString *ifRes = isOK?@"YES":@"NO";
    FXWLog(@"%@:是否响应%@", _name, ifRes);
    return isOK;
}

@end

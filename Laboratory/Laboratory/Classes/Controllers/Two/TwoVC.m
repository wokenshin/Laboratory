//
//  TwoVC.m
//  Laboratory
//
//  Created by kenshin van on 2019/6/23.
//  Copyright © 2019 mac. All rights reserved.
//

#import "TwoVC.h"
#import "IndexedBarVC.h"
#import "KVODemoVC.h"
#import "RuntimeObject.h"
#import "TimerCircleVC.h"

@interface TwoVC()
@property (nonatomic, copy) NSMutableArray *mArr;

@end

@implementation TwoVC

- (void)viewDidLoad{
    [super viewDidLoad];
    self.title = @"面试";
    [self loadTwoVCData];
    [self baseTableVC_reloadMyTableView];
}

- (void)loadTwoVCData{
    [self baseTableVC_addDataWithTitle:@"UITableView重用" andDetail:@"2019.6.23"];
    [self baseTableVC_addDataWithTitle:@"KVO的实现" andDetail:@"2019.6.24"];
    [self baseTableVC_addDataWithTitle:@"copy1" andDetail:@"self.mArr 会崩溃"];
    [self baseTableVC_addDataWithTitle:@"copy2" andDetail:@"_mArr 不会崩溃"];
    [self baseTableVC_addDataWithTitle:@"runtime 消息转发流程" andDetail:@"2019.6.25"];
    [self baseTableVC_addDataWithTitle:@"runtime Method Swizzling" andDetail:@"2019.6.25"];
    [self baseTableVC_addDataWithTitle:@"runtime 动态添加方法" andDetail:@"2019.6.25"];
    [self baseTableVC_addDataWithTitle:@"循环引用之Timer" andDetail:@"2019.6.26"];
}

- (void)baseTableVC_clickCellWithTitle:(NSString *)title{
    if ([title isEqualToString:@"UITableView重用"]) {
        IndexedBarVC *vc = [[IndexedBarVC alloc] init];
        [self base_pushVC:vc];
        return;
    }
    if ([title isEqualToString:@"KVO的实现"]) {
        KVODemoVC *vc = [[KVODemoVC alloc] init];
        [self base_pushVC:vc];
        return;
    }
    if ([title isEqualToString:@"copy1"]) {
        self.mArr = [[NSMutableArray alloc] init];
        [self.mArr addObject:@"看看会不会崩溃"];
        //是因为属性修饰符copy 会在getter方法返回不可变对象，后续的可变操作就崩溃了
        return;
    }
    if ([title isEqualToString:@"copy2"]) {
        _mArr = [[NSMutableArray alloc] init];
        [_mArr addObject:@"看看会不会崩溃"];
        return;
    }
    if ([title isEqualToString:@"runtime 消息转发流程"]) {
        RuntimeObject *obj = [[RuntimeObject alloc] init];
        [obj test];//这里调用了一个只有声明 没有实现的方法，之后runtime会走消息转发流程中的各个方法，都在RuntimeObject.m文件中实现了
        //会打印出相关调用方法日志
        return;
    }
    if ([title isEqualToString:@"runtime Method Swizzling"]) {
        RuntimeObject *obj = [[RuntimeObject alloc] init];
        [obj testFuncOne];//实际上调用的是testFuncTwo
        return;
    }
    if ([title isEqualToString:@"runtime 动态添加方法"]) {
        RuntimeObject *obj = [[RuntimeObject alloc] init];
        [obj meiyouwo];//.m文件中没有此方法的实现，使用动态添加方法的方式，为此方法的实现指定了新的方法
        return;
    }
    if ([title isEqualToString:@"循环引用之Timer"]) {
        TimerCircleVC *vc = [[TimerCircleVC alloc] init];
        [self base_pushVC:vc];
        return;
    }
    FXWLog(@"没有找到对应选项！！！");
    
}


@end

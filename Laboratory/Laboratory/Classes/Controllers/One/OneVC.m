//
//  OneVC.m
//  Laboratory
//
//  Created by mac on 2019/6/21.
//  Copyright © 2019 mac. All rights reserved.
//

#import "OneVC.h"
#import "UISwitchVC.h"
#import "InjectionIIIVC.h"
#import "MasonryVC.h"
#import "UITableViewDemoVC.h"

@interface OneVC ()

@end

@implementation OneVC

- (void)viewDidLoad{
    [super viewDidLoad];
    self.title = @"实验";
    [self loadData];
    [self base_reloadMyTableView];
}

- (void)loadData{
    [self base_addDataWithTitle:@"UISwitch" andDetail:@"2019.6.21"];
    [self base_addDataWithTitle:@"InjectionIII" andDetail:@"2019.6.21"];
    [self base_addDataWithTitle:@"Masonry 常用代码" andDetail:@"2019.6.21"];
    [self base_addDataWithTitle:@"UITableView 常规操作" andDetail:@""];
}

- (void)base_clickCellWithTitle:(NSString *)title{
    if ([title isEqualToString:@"InjectionIII"]) {
        InjectionIIIVC *vc = [[InjectionIIIVC alloc] init];
        [self base_pushVC:vc];
        return;
    }
    if ([title isEqualToString:@"UISwitch"]) {
        UISwitchVC *vc = [[UISwitchVC alloc] init];
        [self base_pushVC:vc];
        return;
    }
    if ([title isEqualToString:@"Masonry 常用代码"]) {
        MasonryVC *vc = [[MasonryVC alloc] init];
        //故意不隐藏底部TabBar 目的是为了看Masonry处理的效果
        [self.navigationController pushViewController:vc animated:YES];
    }
    if ([title isEqualToString:@"UITableView 常规操作"]) {
        UITableViewDemoVC *vc = [[UITableViewDemoVC alloc] init];
        [self base_pushVC:vc];
    }
   
    NSLog(@"%@ 没有这个cell !!!", [self class]);
    
}


@end

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
#import "CLanguageBaseContentVC.h"


@interface OneVC ()

@end

@implementation OneVC

- (void)viewDidLoad{
    [super viewDidLoad];
    self.title = @"实验";
    [self loadData];
    [self baseTableVC_reloadMyTableView];
}

- (void)loadData{
    
    [self baseTableVC_addDataWithTitle:@"InjectionIII" andDetail:@"2019.6.21"];
    [self baseTableVC_addDataWithTitle:@"Masonry 常用代码" andDetail:@"2019.6.21"];
    [self baseTableVC_addDataWithTitle:@"UISwitch" andDetail:@"2019.6.21"];
    [self baseTableVC_addDataWithTitle:@"C语言基础部分 为了学习Runtime" andDetail:@"2019.6.22"];
    
    [self baseTableVC_addDataWithTitle:@"SDWebImage 常用代码" andDetail:@""];
    [self baseTableVC_addDataWithTitle:@"模型字典转换" andDetail:@""];
    [self baseTableVC_addDataWithTitle:@"根据字典生成模型文件" andDetail:@""];
    [self baseTableVC_addDataWithTitle:@"UITableView 常规操作" andDetail:@""];
}

- (void)baseTableVC_clickCellWithTitle:(NSString *)title{
    if ([title isEqualToString:@"C语言基础部分 为了学习Runtime"]) {
        CLanguageBaseContentVC *vc =[[CLanguageBaseContentVC alloc] init];
        [self base_pushVC:vc];
    }
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
        return;
    }
    if ([title isEqualToString:@"UITableView 常规操作"]) {
        UITableViewDemoVC *vc = [[UITableViewDemoVC alloc] init];
        [self base_pushVC:vc];
        return;
    }
   
    
    NSLog(@"%@ 没有这个cell !!!", [self class]);
    
}


@end

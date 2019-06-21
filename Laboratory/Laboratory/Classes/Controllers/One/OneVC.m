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

@interface OneVC ()

@end

@implementation OneVC

- (void)viewDidLoad{
    [super viewDidLoad];
    [self initFiveVCUI];
    [self loadData];
}

- (void)initFiveVCUI{
    self.title = @"实验";
    [self.view addSubview:self.tableView];
}

- (void)loadData{
    
    [self addDataWithTitle:@"UISwitch" andDetail:@"2019.6.21"];
    [self addDataWithTitle:@"InjectionIII" andDetail:@"2019.6.21"];
    [self addDataWithTitle:@"Masonry 常用代码" andDetail:@""];
    
}

- (void)clickCellWithTitle:(NSString *)title{
    if ([title isEqualToString:@"InjectionIII"]) {
        InjectionIIIVC *vc = [[InjectionIIIVC alloc] init];
        [self fxw_pushVC:vc];
        return;
    }
    if ([title isEqualToString:@"UISwitch"]) {
        UISwitchVC *vc = [[UISwitchVC alloc] init];
        [self fxw_pushVC:vc];
        return;
    }
   
    NSLog(@"%@ 没有这个cell !!!", [self class]);
    
}


@end

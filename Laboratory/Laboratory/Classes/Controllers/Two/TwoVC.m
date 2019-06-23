//
//  TwoVC.m
//  Laboratory
//
//  Created by kenshin van on 2019/6/23.
//  Copyright © 2019 mac. All rights reserved.
//

#import "TwoVC.h"
#import "IndexedBarVC.h"

@implementation TwoVC

- (void)viewDidLoad{
    [super viewDidLoad];
    self.title = @"面试";
    [self loadTwoVCData];
    [self baseTableVC_reloadMyTableView];
}

- (void)loadTwoVCData{
    [self baseTableVC_addDataWithTitle:@"UITableView重用" andDetail:@"from 慕课网"];
    
    
}

- (void)baseTableVC_clickCellWithTitle:(NSString *)title{
    if ([title isEqualToString:@"UITableView重用"]) {
        IndexedBarVC *vc = [[IndexedBarVC alloc] init];
        [self base_pushVC:vc];
        return;
    }
    
}

@end

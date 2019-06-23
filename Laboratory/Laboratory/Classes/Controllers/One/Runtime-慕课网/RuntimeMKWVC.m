//
//  RuntimeMKWVC.m
//  Laboratory
//
//  Created by kenshin van on 2019/6/23.
//  Copyright © 2019 mac. All rights reserved.
//

#import "RuntimeMKWVC.h"



@implementation RuntimeMKWVC

- (void)viewDidLoad{
    [super viewDidLoad];
    self.title = @"Runtime机制";
    [self loadRuntimeMKWVCData];
    [self baseTableVC_reloadMyTableView];
}

- (void)loadRuntimeMKWVCData{
    [self baseTableVC_addDataWithTitle:@"Target Point" andDetail:@"2019.6.23"];
    //[self baseTableVC_addDataWithTitle:@"" andDetail:@""];
    
    
}

- (void)baseTableVC_clickCellWithTitle:(NSString *)title{
    if ([title isEqualToString:@"Target Point"]) {
        NSNumber *num1 = @7;
        NSNumber *num2 = @11;
        NSNumber *num3 = @555;
        //target point 指针
        FXWLog(@"num1 == %p", num1);
        FXWLog(@"num2 == %p", num2);
        FXWLog(@"num3 == %p", num3);
        
        //普通的指针
        NSNumber *num4 = @(0xffffffffffffffff);
        FXWLog(@"num4 == %p", num4);
        return;
    }
    NSLog(@"没有找到对应的选项！！！");
}

@end

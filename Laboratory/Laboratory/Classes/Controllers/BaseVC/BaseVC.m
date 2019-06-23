//
//  BaseVC.m
//  Laboratory
//
//  Created by mac on 2019/6/21.
//  Copyright © 2019 mac. All rights reserved.
//

#import "BaseVC.h"

@interface BaseVC ()

@end

@implementation BaseVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    FXWLog(@"-------->>>当前控制器是:%@ ", NSStringFromClass([self class]));
}

- (void)dealloc
{
    FXWLog(@"-------->>>释放了:%@ ", NSStringFromClass([self class]));
}


- (void)base_pushVC:(UIViewController *)pushVC{
    pushVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:pushVC animated:YES];
}
@end

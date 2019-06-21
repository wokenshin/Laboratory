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
    NSLog(@"-------->>>当前控制器是:%@ ", NSStringFromClass([self class]));
}


- (void)dealloc
{
    NSLog(@"-------->>>释放了:%@ ", NSStringFromClass([self class]));
}
@end

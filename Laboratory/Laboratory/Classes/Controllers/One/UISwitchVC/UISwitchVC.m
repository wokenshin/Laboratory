//
//  UISwitchVC.m
//  Laboratory
//
//  Created by mac on 2019/6/21.
//  Copyright © 2019 mac. All rights reserved.
//

#import "UISwitchVC.h"

@interface UISwitchVC ()
@property (nonatomic,strong)UISwitch *switchBtn1;
@end

@implementation UISwitchVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"UISwitch";
    
    _switchBtn1 = [[UISwitch alloc] init];
    // 修改控件的大小，不能设置frame，只能用缩放比例
    _switchBtn1.transform = CGAffineTransformMakeScale(2, 2);
    
    [self.view addSubview:_switchBtn1];
    [_switchBtn1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(200);
        make.centerX.mas_equalTo(0);
        
        //这里设置size 是不会生效的
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(50);
        
    }];
    
}



@end

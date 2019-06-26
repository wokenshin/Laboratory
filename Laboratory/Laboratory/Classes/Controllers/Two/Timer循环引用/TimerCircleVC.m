//
//  TimerCircleVC.m
//  Laboratory
//
//  Created by kenshin van on 2019/6/26.
//  Copyright © 2019 mac. All rights reserved.
//

#import "TimerCircleVC.h"
#import "NSTimer+FXW.h"

@interface TimerCircleVC()

@property (nonatomic, strong) UIButton *btnBad;
@property (nonatomic, strong) UIButton *btnGood;

@property (nonatomic, strong) NSTimer *badTimer;
@property (nonatomic, strong) NSTimer *goodTimer;

@end

@implementation TimerCircleVC

-(void)viewDidLoad{
    
    _btnBad = [[UIButton alloc] init];
    [_btnBad setTitle:@"会产生循环引用的定时器" forState:UIControlStateNormal];
    _btnBad.backgroundColor = [UIColor greenColor];
    [_btnBad addTarget:self action:@selector(clickBadBtn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_btnBad];
    [_btnBad mas_makeConstraints:^(MASConstraintMaker *make) {
       make.top.equalTo(self.mas_topLayoutGuide).offset(20);//iOS7之后才支持
       make.centerX.mas_equalTo(0);
       make.height.mas_equalTo(36);
    }];
    
    
    _btnGood = [[UIButton alloc] init];
    [_btnGood setTitle:@"不会产生循环引用的定时器" forState:UIControlStateNormal];
    _btnGood.backgroundColor = [UIColor redColor];
    [_btnGood addTarget:self action:@selector(clickGoodBtn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_btnGood];
    [_btnGood mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->_btnBad.mas_bottom).offset(20);
        make.centerX.mas_equalTo(0);
        make.height.mas_equalTo(36);
    }];
    
}

- (void)clickBadBtn{
    if (_badTimer == nil) {
        _badTimer = [NSTimer scheduledTimerWithTimeInterval:1
                                                     target:self
                                                   selector:@selector(badTimerFunc)
                                                   userInfo:nil
                                                    repeats:YES];
    }
    NSLog(@"开启 badTimer！");
}

- (void)badTimerFunc{
    NSLog(@"badTimerFunc 如果我一直在，就是循环引用产生了！");
}

- (void)clickGoodBtn{
    if (_goodTimer == nil) {
        _goodTimer = [NSTimer category_scheduledTimerWithTimeInterval:1
                                                               target:self
                                                             selector:@selector(goodTimerFunc)
                                                             userInfo:nil
                                                              repeats:YES];
    }
    NSLog(@"开启 badTimer！");
}

- (void)goodTimerFunc{
    NSLog(@"goodTimerFunc 如果我一直在，就是循环引用产生了！");
}

@end

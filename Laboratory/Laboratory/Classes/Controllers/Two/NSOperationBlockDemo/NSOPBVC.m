//
//  NSOPBVC.m
//  Laboratory
//
//  Created by kenshin van on 2019/7/8.
//  Copyright © 2019 mac. All rights reserved.
//

#import "NSOPBVC.h"

//本demo是一个面试题 来自2019.7.8.pm 15:00 深圳华润置地大厦E座 某公司
@interface NSOPBVC ()
@property (nonatomic, strong) UILabel *lab;
@end

@implementation NSOPBVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"NSOperation lab";
    _lab = [[UILabel alloc] init];
    _lab.text = @"等4s后我会变";
    [self.view addSubview:_lab];
    [_lab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_topLayoutGuide).offset(20);//iOS7之后才支持
        make.centerX.mas_equalTo(0);
    }];
    
    //用 NSPoerationBlock 在默认的队列中执行 block中 NSThread 睡4s 然后 给 lab赋新值
    //看看程序会怎样？
}


@end

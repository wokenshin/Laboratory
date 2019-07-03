//
//  KVODemoVC.m
//  Laboratory
//
//  Created by kenshin van on 2019/6/24.
//  Copyright © 2019 mac. All rights reserved.
//

#import "KVODemoVC.h"
#import "MObserver.h"
#import "MObject.h"

@interface KVODemoVC()
@property (nonatomic, strong) UIButton *btn;
@property (nonatomic, strong) MObserver *mobserver;
@property (nonatomic, strong) MObject *mobj;
@end

@implementation KVODemoVC

- (void)viewDidLoad{
    [super viewDidLoad];
    self.title = @"KVO";
    
    _btn = [[UIButton alloc] init];
    [_btn setTitle:@"add" forState:UIControlStateNormal];
    _btn.backgroundColor = [UIColor blueColor];
    [_btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [_btn addTarget:self action:@selector(clickBtn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_btn];
    [_btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(0);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(36);
    }];
    
    
    _mobserver = [[MObserver alloc] init];
    _mobj = [[MObject alloc] init];
    
    //调用kvo方法进行监听mobj的value属性的变化
    [_mobj addObserver:_mobserver
            forKeyPath:@"value"
               options:NSKeyValueObservingOptionNew//监听value的新值
               context:NULL];
    
    _mobj.value = 1;//这里会走 setter方法
    
    //kvc赋值 也会走对应的 setter方法
    [_mobj setValue:@2 forKey:@"value"];
    
    
}

- (void)clickBtn{
    [_mobj increase];
}
    
@end

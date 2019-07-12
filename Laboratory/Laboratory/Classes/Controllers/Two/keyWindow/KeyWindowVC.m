//
//  KeyWindowVC.m
//  Laboratory
//
//  Created by kenshin van on 2019/7/3.
//  Copyright © 2019 mac. All rights reserved.
//

#import "KeyWindowVC.h"

//参考 https://www.jianshu.com/p/b6964951a6be
@interface KeyWindowVC ()
@property (nonatomic, strong) UIButton *btnBad;
@property (nonatomic, strong) UIButton *btnGood;
@property (nonatomic, strong) UIButton *btnBest;


@end

@implementation KeyWindowVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"弹窗的设计";
    
    _btnBad = [[UIButton alloc] init];
    [_btnBad setTitle:@"坏的" forState:UIControlStateNormal];
    _btnBad.backgroundColor = [UIColor blackColor];
    [_btnBad addTarget:self action:@selector(clickBtnBad) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_btnBad];
    [_btnBad mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_topLayoutGuide).offset(20);//iOS7之后才支持
        make.left.mas_equalTo(20);
        make.height.mas_equalTo(36);
        make.width.mas_equalTo(100);
    }];
    
    _btnGood = [[UIButton alloc] init];
    [_btnGood setTitle:@"好的" forState:UIControlStateNormal];
    _btnGood.backgroundColor = [UIColor blackColor];
    [_btnGood addTarget:self action:@selector(clickBtnGood) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_btnGood];
    [_btnGood mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_topLayoutGuide).offset(20);//iOS7之后才支持
        make.right.mas_equalTo(-20);
        make.height.mas_equalTo(36);
        make.width.mas_equalTo(100);
    }];
    
    _btnBest = [[UIButton alloc] init];
    [_btnBest setTitle:@"最佳方案" forState:UIControlStateNormal];
    _btnBest.backgroundColor = [UIColor blackColor];
    [_btnBest addTarget:self action:@selector(clickBtnBest) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_btnBest];
    [_btnBest mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.btnGood.mas_bottom).offset(20);//iOS7之后才支持
        make.centerX.mas_equalTo(0);
        make.height.mas_equalTo(36);
        make.width.mas_equalTo(200);
    }];
    [self printKeyWindowAndDelegateWindow];
}

- (void)printKeyWindowAndDelegateWindow{
    UIWindow *w1 = [[[UIApplication sharedApplication] delegate] window];
    UIWindow *w2 = [UIApplication sharedApplication].keyWindow;
    FXWLog(@"%p : delegate window", w1);
    FXWLog(@"%p : keyWindow", w2);
    //这里有个疑问 为什么w1和w2都是同一个window，但是自定义弹窗却一定要放在w1上呢？
    /*
     实际上 默认情况下 这俩是同一个对象，但是当有弹窗出现的时候，就不是同一个对象了。
     // 参考为的文章：https://blog.csdn.net/wokenshin/article/details/94983913
     
     下面内容来自：https://ios.nobady.cn/ UIKit部分
     delegate.window 程序启动时设置的window对象。
     keyWindow 这个属性保存了[windows]数组中的[UIWindow]对象，该对象最近被发送了[makeKeyAndVisible]消息
     
     一般情况下 delegate.window 和 keyWindow 是同一个对象，
     但不能保证keyWindow就是delegate.window，
     因为keyWindow会因为makeKeyAndVisible而变化，
     例如，程序中添加了一个悬浮窗口，这个时候keywindow就会变化。
     */
}

- (void)clickBtnBad{
    // 创建一个alertView
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"错误事例" message:@"在系统弹窗出现【之后】，添加到keyWindow上的视图【会】随着弹窗的消失而消失" delegate:self cancelButtonTitle:@"取消" otherButtonTitles: nil];
    [alertView show];
    
    // 在keyWindow上add一个红色view
    UIView *redView = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 90, 90)];
    redView.backgroundColor = [UIColor redColor];
    [[UIApplication sharedApplication].keyWindow addSubview:redView];
    
    [self printKeyWindowAndDelegateWindow];
    
}

- (void)clickBtnGood{
    // 在keyWindow上add一个红色view
    UIView *redView = [[UIView alloc] initWithFrame:CGRectMake(90, 90, 90, 90)];
    redView.backgroundColor = [UIColor redColor];
    [[UIApplication sharedApplication].keyWindow addSubview:redView];
    
    // 创建一个alertView
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"巧合OK" message:@"在系统弹窗出现【之前】，添加到keyWindow上的视图就【不会】随着弹窗的消失而消失" delegate:self cancelButtonTitle:@"取消" otherButtonTitles: nil];
    [alertView show];
    
    [self printKeyWindowAndDelegateWindow];
}

- (void)clickBtnBest{
    // 创建一个alertView
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"最佳方案" message:@"将弹窗添加在 [UIApplication sharedApplication] delegate] window]上就OK了" delegate:self cancelButtonTitle:@"取消" otherButtonTitles: nil];
    [alertView show];
    
    // 在keyWindow上add一个红色view
    UIView *redView = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 90, 90)];
    redView.backgroundColor = [UIColor redColor];
    [[[[UIApplication sharedApplication] delegate] window] addSubview:redView];
    
    [self printKeyWindowAndDelegateWindow];
}

@end

//
//  MyEventVC.m
//  Laboratory
//
//  Created by kenshin van on 2019/7/6.
//  Copyright © 2019 mac. All rights reserved.
//

#import "MyEventVC.h"
#import "MyEventView.h"

//这里有一个疑问：为什么点击 MyEventView 视图后，在控制台可以看到 “两次t一模一样的输出结果呢？”难道不是应该只有“一次”吗？
//我已在此处提问：https://segmentfault.com/q/1010000019686475
//我在想是不是重写的方法本身有问题？？？ 2019.7.19

@interface MyEventVC ()
@property (nonatomic, strong) MyEventView *viewA;//父视图
@property (nonatomic, strong) MyEventView *viewA1;//子视图
@property (nonatomic, strong) MyEventView *viewA2;//子视图

@property (nonatomic, strong) MyEventView *viewB;//父视图
@property (nonatomic, strong) MyEventView *viewB1;//子视图
@property (nonatomic, strong) MyEventView *viewB2;//子视图

@property (nonatomic, strong) MyEventView *viewC;//父视图
@property (nonatomic, strong) MyEventView *viewC1;//子视图
@property (nonatomic, strong) MyEventView *viewC2;//子视图

@end

@implementation MyEventVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"响应者链";
    
    CGFloat width = screenWidth*0.6;
    CGFloat height = 200;
    CGFloat margin = 5;
    
    CGFloat heightSub = height*0.4;
    
#pragma mark - ViewA
    _viewA = [[MyEventView alloc] init];
    _viewA.name = @"蓝色View";
    _viewA.backgroundColor = [UIColor blueColor];
    [self.view addSubview:_viewA];
    [_viewA mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_topLayoutGuide).offset(margin);//iOS7之后才支持
        make.left.mas_equalTo(margin);
        make.width.mas_equalTo(width);
        make.height.mas_equalTo(height);
    }];
    
//    _viewA1 = [[MyEventView alloc] init];
//    _viewA1.name = @"绿色View1";
//    _viewA1.backgroundColor = [UIColor greenColor];
//    [_viewA addSubview:_viewA1];
//    [_viewA1 mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.mas_equalTo(margin);
//        make.left.mas_equalTo(margin);
//        make.right.mas_equalTo(-margin);
//        make.height.mas_equalTo(heightSub);
//    }];
//
//    UILabel *lab1 = [[UILabel alloc] init];
//    lab1.text = @"最下层视图";
//    lab1.textColor = [UIColor whiteColor];
//    [_viewA addSubview:lab1];
//    [lab1 mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.center.mas_equalTo(0);
//    }];
//
//    _viewA2 = [[MyEventView alloc] init];
//    _viewA2.name = @"绿色View2";
//    _viewA2.backgroundColor = [UIColor greenColor];
//    [_viewA addSubview:_viewA2];
//    [_viewA2 mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.bottom.mas_equalTo(-margin);
//        make.left.mas_equalTo(margin);
//        make.right.mas_equalTo(-margin);
//        make.height.mas_equalTo(heightSub);
//    }];
//
//#pragma mark - ViewB
//
//    _viewB = [[MyEventView alloc] init];
//    _viewB.name = @"灰色View";
//    _viewB.alpha = 0.6;
//    _viewB.backgroundColor = [UIColor grayColor];
//    [self.view addSubview:_viewB];
//    [_viewB mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.mas_equalTo(self.viewA.mas_bottom).offset(-90);
//        make.right.mas_equalTo(-margin);
//        make.width.mas_equalTo(width);
//        make.height.mas_equalTo(height);
//    }];
//
//    _viewB1 = [[MyEventView alloc] init];
//    _viewB1.name = @"黄色View1";
//    _viewB1.backgroundColor = [UIColor yellowColor];
//    [_viewB addSubview:_viewB1];
//    [_viewB1 mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.mas_equalTo(margin);
//        make.left.mas_equalTo(margin);
//        make.right.mas_equalTo(-margin);
//        make.height.mas_equalTo(heightSub);
//    }];
//
//    UILabel *lab2 = [[UILabel alloc] init];
//    lab2.text = @"中间层视图";
//    lab2.textColor = [UIColor whiteColor];
//    [_viewB addSubview:lab2];
//    [lab2 mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.center.mas_equalTo(0);
//    }];
//
//    _viewB2 = [[MyEventView alloc] init];
//    _viewB2.name = @"黄色View2";
//    _viewB2.backgroundColor = [UIColor yellowColor];
//    [_viewB addSubview:_viewB2];
//    [_viewB2 mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.bottom.mas_equalTo(-margin);
//        make.left.mas_equalTo(margin);
//        make.right.mas_equalTo(-margin);
//        make.height.mas_equalTo(heightSub);
//    }];
//
//#pragma mark - ViewC
//    _viewC = [[MyEventView alloc] init];
//    _viewC.name = @"黑色View";
//    _viewC.backgroundColor = [UIColor blackColor];
//    [self.view addSubview:_viewC];
//    [_viewC mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.mas_equalTo(self.viewB.mas_bottom).offset(margin);
//        make.centerX.mas_equalTo(0);
//        make.width.mas_equalTo(width);
//        make.height.mas_equalTo(height);
//    }];
//
//    _viewC1 = [[MyEventView alloc] init];
//    _viewC1.name = @"红色View1";
//    _viewC1.backgroundColor = [UIColor redColor];
//    [_viewC addSubview:_viewC1];
//    [_viewC1 mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.mas_equalTo(margin);
//        make.left.mas_equalTo(margin);
//        make.right.mas_equalTo(-margin);
//        make.height.mas_equalTo(heightSub);
//    }];
//
//    UILabel *lab3 = [[UILabel alloc] init];
//    lab3.text = @"最上层视图";
//    lab3.textColor = [UIColor whiteColor];
//    [_viewC addSubview:lab3];
//    [lab3 mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.center.mas_equalTo(0);
//    }];
//
//    _viewC2 = [[MyEventView alloc] init];
//    _viewC2.name = @"红色View2";
//    _viewC2.backgroundColor = [UIColor redColor];
//    [_viewC addSubview:_viewC2];
//    [_viewC2 mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.bottom.mas_equalTo(-margin);
//        make.left.mas_equalTo(margin);
//        make.right.mas_equalTo(-margin);
//        make.height.mas_equalTo(heightSub);
//    }];
//
//    FXWLog(@"UIView userInteractionEnabled属性默认是:%d", _viewC2.userInteractionEnabled);
    
}



@end

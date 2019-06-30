//
//  MasonryPriorityVC.m
//  Laboratory
//
//  Created by kenshin van on 2019/6/28.
//  Copyright © 2019 mac. All rights reserved.
//

#import "MasonryPriorityVC.h"

//参考：https://www.cnblogs.com/siasyl/p/6775055.html
@interface MasonryPriorityVC()
@property (nonatomic, strong) UIButton *btnRemoveCenterView;
@property (nonatomic, strong) UIButton *btnRemoveRightView;

@property (nonatomic, strong) UIView *viewLeft;
@property (nonatomic, strong) UIView *viewCenter;
@property (nonatomic, strong) UIView *viewRight;

@end

@implementation MasonryPriorityVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"优先级";
    
    CGFloat margin = 20;
    CGFloat size = 100;
    _viewLeft = [[UIView alloc] init];
    _viewLeft.backgroundColor = [UIColor redColor];
    [self.view addSubview:_viewLeft];
    [_viewLeft mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_topLayoutGuide).offset(margin);//iOS7之后才支持
        make.left.mas_equalTo(margin);
        make.width.mas_equalTo(size);
        make.height.mas_equalTo(size);
    }];
    
    _viewCenter = [[UIView alloc] init];
    _viewCenter.backgroundColor = [UIColor greenColor];
    [self.view addSubview:_viewCenter];
    [_viewCenter mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_topLayoutGuide).offset(margin);//iOS7之后才支持
        make.left.mas_equalTo(self.viewLeft.mas_right).offset(margin);
        make.width.mas_equalTo(size);
        make.height.mas_equalTo(size);
        //当左边的View消失后,中间的View缺少左边约束，所以给其加一个优先级更低的左边约束。当第一个左边约束失效后，这个约束就起作用了
        make.left.equalTo(self.view.mas_left).offset(margin).priority(300);

    }];
    
    _viewRight = [[UIView alloc] init];
    _viewRight.backgroundColor = [UIColor blueColor];
    [self.view addSubview:_viewRight];
    [_viewRight mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_topLayoutGuide).offset(margin);//iOS7之后才支持
        make.left.mas_equalTo(self.viewCenter.mas_right).offset(margin);
        make.width.mas_equalTo(size);
        make.height.mas_equalTo(size);
        //同理右边的低级约束得设置两个，因为可能删除中间的view，也可能删除中间和左边的view
        make.left.equalTo(self.viewLeft.mas_right).offset(margin).priority(300);
        make.left.equalTo(self.view.mas_left).offset(margin).priority(200);
    }];
    
    CGFloat hBtn = 36;
    CGFloat wBtn = screenWidth/2;
    
    _btnRemoveCenterView = [[UIButton alloc] init];
    _btnRemoveCenterView.backgroundColor = [UIColor greenColor];
    [_btnRemoveCenterView setTitle:@"删除centerView" forState:UIControlStateNormal];
    [_btnRemoveCenterView setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_btnRemoveCenterView addTarget:self action:@selector(clickRemoveCenterView) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_btnRemoveCenterView];
    [_btnRemoveCenterView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);//iOS7之后才支持
        make.left.mas_equalTo(0);
        make.width.mas_equalTo(wBtn);
        make.height.mas_equalTo(hBtn);
    }];
    
    _btnRemoveRightView = [[UIButton alloc] init];
    _btnRemoveRightView.backgroundColor = [UIColor blueColor];
    [_btnRemoveRightView setTitle:@"删除leftView" forState:UIControlStateNormal];
    [_btnRemoveRightView setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_btnRemoveRightView addTarget:self action:@selector(clickRemoveLeftView) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_btnRemoveRightView];
    [_btnRemoveRightView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);//iOS7之后才支持
        make.right.mas_equalTo(0);
        make.width.mas_equalTo(wBtn);
        make.height.mas_equalTo(hBtn);
    }];
    
    
}

- (void)clickRemoveCenterView{
    [_viewCenter removeFromSuperview];
    
    //这样会有动画效果
    [UIView animateWithDuration:0.5 animations:^{
        //强制刷新布局
        [self.view layoutIfNeeded];
    }];
}

- (void)clickRemoveLeftView{
    [_viewLeft removeFromSuperview];
    
    //这样会有动画效果
    [UIView animateWithDuration:0.5 animations:^{
        //强制刷新布局
        [self.view layoutIfNeeded];
    }];
}


@end

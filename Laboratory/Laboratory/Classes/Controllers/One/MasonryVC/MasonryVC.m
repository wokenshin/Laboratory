//
//  MasonryVC.m
//  Laboratory
//
//  Created by mac on 2019/6/21.
//  Copyright © 2019 mac. All rights reserved.
//

#import "MasonryVC.h"


/**
 参考:https://www.jianshu.com/p/24e4ff56bfea
 官网：https://github.com/SnapKit/Masonry
 
 */
@interface MasonryVC ()
@property (nonatomic,strong)UIButton    *btnUpdate;
@property (nonatomic,strong)UILabel     *labB;
@property (nonatomic,assign)BOOL          isChange;
@end

@implementation MasonryVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Masonry";
    self.view.backgroundColor = FXW_HEXColor(0x3f3f3f);//灰色 简书夜间模式
    [self setMasonryUI];
}

- (void)setMasonryUI{
    UILabel *labTop = [[UILabel alloc] init];
    labTop.textColor = [UIColor blackColor];
    labTop.backgroundColor = [UIColor yellowColor];
    labTop.text = @"靠近导航栏底部的文本";
    [self.view addSubview:labTop];
    [labTop mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_topLayoutGuide);//iOS7之后才支持
        make.centerX.mas_equalTo(0);
    }];
    
    UILabel *labA = [[UILabel alloc] init];
    labA.textColor = [UIColor blackColor];
    labA.backgroundColor = [UIColor redColor];
    labA.text = @"水平居中";
    labA.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:labA];
    [labA mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(labTop.mas_bottom).offset(10);
        make.centerX.mas_equalTo(0);
        make.size.mas_equalTo(CGSizeMake(100, 100));
    }];
    
    _labB = [[UILabel alloc] init];
    _labB.textColor = [UIColor greenColor];
    _labB.backgroundColor = FXW_HEXColor(0x0498fa);
    _labB.text = @"倍数布局";
    _labB.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:_labB];
    [_labB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(labA.mas_bottom).offset(10);
        make.centerX.mas_equalTo(0);
        make.height.mas_equalTo(labA.mas_width).multipliedBy(0.5);//相对于labA高度的 0.5倍
        make.width.mas_equalTo(labA.mas_width).multipliedBy(2);//相对于labA宽度的 2倍
    }];
    
    _btnUpdate = [[UIButton alloc] init];
    [_btnUpdate setTitle:@"点击更新约束" forState:UIControlStateNormal];
    _btnUpdate.backgroundColor = FXW_HEXColor(0x00a062);
    [_btnUpdate addTarget:self action:@selector(clickBtnUpdate) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_btnUpdate];
    [_btnUpdate mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->_labB.mas_bottom).offset(10);
        make.centerX.mas_equalTo(0);
        make.width.mas_equalTo(120);
        make.height.mas_equalTo(36*2);
    }];
    
    UILabel *labC = [[UILabel alloc] init];
    labC.textColor = [UIColor brownColor];
    labC.backgroundColor = [UIColor whiteColor];
    labC.text = @"Masonry使用注意事项用mas_makeConstraints的那个view需要在addSubview之后才能用这个方法mas_equalTo适用数值元素，equalTo适合多属性的比如make.left.and.right.equalTo(self.view)方法and和with只是为了可读性，返回自身，比如make.left.and.right.equalTo(self.view)和make.left.right.equalTo(self.view)是一样的。因为iOS中原点在左上角所以注意使用offset时注意right和bottom用负数。";
    labC.numberOfLines = 0;
    labC.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:labC];
    [labC mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->_btnUpdate.mas_bottom).offset(10);
        make.centerX.mas_equalTo(0);
        make.width.mas_equalTo(screenWidth*0.8);
    }];
    
    
    UILabel *labBotton = [[UILabel alloc] init];
    labBotton.textColor = [UIColor blackColor];
    labBotton.backgroundColor = [UIColor yellowColor];
    labBotton.text = @"靠近TabBar顶部的文本";
    [self.view addSubview:labBotton];
    [labBotton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.mas_bottomLayoutGuide);//iOS7之后才支持
        make.centerX.mas_equalTo(0);
    }];
}

//点击按钮更新约束
- (void)clickBtnUpdate{
    _isChange = !_isChange;
    if (_isChange) {
        [_btnUpdate mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self->_labB.mas_bottom).offset(10);
            make.centerX.mas_equalTo(0);
            make.width.mas_equalTo(140);
            make.height.mas_equalTo(36);
        }];
    }else{
        [_btnUpdate mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self->_labB.mas_bottom).offset(10);
            make.centerX.mas_equalTo(0);
            make.width.mas_equalTo(120);
            make.height.mas_equalTo(36*2);
        }];
    }
}

- (void)injected{
    
    
}




@end

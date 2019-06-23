//
//  InjectionIIIVC.m
//  Laboratory
//
//  Created by mac on 2019/6/21.
//  Copyright © 2019 mac. All rights reserved.
//

#import "InjectionIIIVC.h"

/**
 参考：https://www.jianshu.com/p/b2a2f15a3283
 参考：https://www.jianshu.com/p/b2a2f15a3283
 使用步骤
 1.macStrore 下载 InjectionIII
 2.打开InjectionIII 并关联到本项目
 3.在AppDelegate.m 中 didFinishLaunchingWithOptions 做相关配置
 4.遇到cmd+s 崩溃的情况 需要注意 cmd+s 执行的是当前保存页面的 injectd方法，崩溃的话可以试试 清空xCode缓存
 
 需要注意的两点：
 1. InjectionIII工具只对模拟器有效，真机无效。
 2.在injected方法里面修改的代码，再次Command+R运行时不会起作用。因为代码里面只声明了injected方法，并没有去调用，所以不会生效；我们Command+S保存代码后生效
 ，是因为在保存后通过InjectionIII工具读取injected方法里面修改的代码，“告诉”模拟器哪儿修改了，是InjectionIII起的作用。因此我们需要把修改的代码放到合适的位置，
 让程序一运行就会执行。
 
 */
@interface InjectionIIIVC ()
@property (nonatomic,strong)UILabel *labTips;
@end

@implementation InjectionIIIVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"InjectionIII";
    
    _labTips = [[UILabel alloc] init];
    _labTips.text = @"在injected中修改UI后cmd+s";
    [self.view addSubview:_labTips];
    [_labTips mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_topLayoutGuide).offset(10);
        make.centerX.mas_equalTo(0);
    }];
    
}


/**
 code结束后 cmd+s
 在执行本方法的时候 本控制器的viewDidLoad 会被重新调用一次
 */
- (void)injected{
    
    
}


@end

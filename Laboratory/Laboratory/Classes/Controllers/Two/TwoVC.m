//
//  TwoVC.m
//  Laboratory
//
//  Created by kenshin van on 2019/6/23.
//  Copyright © 2019 mac. All rights reserved.
//

#import "TwoVC.h"
#import "IndexedBarVC.h"
#import "KVODemoVC.h"
#import "RuntimeObject.h"
#import "TimerCircleVC.h"
#import "MSVC.h"
#import "AlgorithmVC.h"
#import "MRCDemo.h"
#import "KeyWindowVC.h"
#import "MyEventVC.h"

@interface TwoVC(){
    NSString *kvcDemo2;
}
@property (nonatomic, copy) NSMutableArray *mArr;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *kvcDemo;

@end

@implementation TwoVC

//这样修饰的意思是 不让编译器帮我们自动生成setter getter方法，而是要我们自己在代码中实现
@dynamic name;


- (void)viewDidLoad{
    [super viewDidLoad];
    self.title = @"面试";
    [self loadTwoVCData];
    [self baseTableVC_reloadMyTableView];
}

- (void)loadTwoVCData{
    
    [self baseTableVC_addDataWithTitle:@"响应者链" andDetail:@"2019.7.6"];
    [self baseTableVC_addDataWithTitle:@"UITableView重用" andDetail:@"2019.6.23"];
    [self baseTableVC_addDataWithTitle:@"KVC" andDetail:@"会崩溃 setValue:forUndefinedKey:"];
    [self baseTableVC_addDataWithTitle:@"KVO的实现" andDetail:@"2019.6.24"];
    [self baseTableVC_addDataWithTitle:@"copy1" andDetail:@"self.mArr 会崩溃"];
    [self baseTableVC_addDataWithTitle:@"copy2" andDetail:@"_mArr 不会崩溃"];
    [self baseTableVC_addDataWithTitle:@"runtime 消息转发流程" andDetail:@"2019.6.25"];
    [self baseTableVC_addDataWithTitle:@"runtime Method Swizzling" andDetail:@"2019.6.25"];
    [self baseTableVC_addDataWithTitle:@"runtime 动态添加方法" andDetail:@"2019.6.25"];
    [self baseTableVC_addDataWithTitle:@"循环引用之Timer" andDetail:@"2019.6.26"];
    [self baseTableVC_addDataWithTitle:@"block 截获" andDetail:@"2019.6.26"];
    [self baseTableVC_addDataWithTitle:@"block __blcok" andDetail:@"2019.6.26"];
    [self baseTableVC_addDataWithTitle:@"多线程" andDetail:@"2019.6.26"];
    [self baseTableVC_addDataWithTitle:@"算法" andDetail:@"2019.6.27"];
    [self baseTableVC_addDataWithTitle:@"@dynamic 会崩溃" andDetail:@"此修饰符将要求自己实现读取方法"];
    [self baseTableVC_addDataWithTitle:@"MRC便利构造器 会崩溃" andDetail:@"使用release 会崩溃"];
    [self baseTableVC_addDataWithTitle:@"弹窗的设计" andDetail:@"2019.7.3"];
    [self baseTableVC_addDataWithTitle:@"父类-子类-分类load执行顺序" andDetail:@"过滤控制台日志看看 >>>"];
    //[self baseTableVC_addDataWithTitle:@"RunLoop 常驻线程" andDetail:@"2019.6.27"];
        
}

- (void)baseTableVC_clickCellWithTitle:(NSString *)title{
    if ([title isEqualToString:@"响应者链"]) {
        MyEventVC *vc = [[MyEventVC alloc] init];
        [self base_pushVC:vc];
    }
    if ([title isEqualToString:@"父类-子类-分类load执行顺序"]) {
        return;
    }
    if ([title isEqualToString:@"弹窗的设计"]) {
        KeyWindowVC *vc = [[KeyWindowVC alloc] init];
        [self base_pushVC:vc];
        return;
    }
    if ([title isEqualToString:@"KVC"]) {
        [self setValue:@"fxw" forKey:@"kvcDemo"];
        FXWLog(@"kvcDemo == %@", _kvcDemo);
        
        [self setValue:@"fantasy" forKey:@"kvcDemo2"];
        FXWLog(@"kvcDemo2 == %@", kvcDemo2);
        
        [self setValue:@"李狗蛋" forKey:@"_kvcDemo3"];//会崩溃 setValue:forUndefinedKey:
        return;
    }
    if ([title isEqualToString:@"MRC便利构造器 会崩溃"]) {
        MRCDemo *demo = [[MRCDemo alloc] init];
        [demo testOoe];
        return;
    }
    if ([title isEqualToString:@"@dynamic 会崩溃"]) {
        self.name = @"kenshin";//因为找不到setter方法 所以会崩溃
        return;
    }
    if ([title isEqualToString:@"算法"]) {
        AlgorithmVC *vc = [[AlgorithmVC alloc] init];
        [self base_pushVC:vc];
        return;
    }
    if ([title isEqualToString:@"多线程"]) {
        MSVC *vc = [[MSVC alloc] init];
        [self base_pushVC:vc];
        return;
    }
    if ([title isEqualToString:@"UITableView重用"]) {
        IndexedBarVC *vc = [[IndexedBarVC alloc] init];
        [self base_pushVC:vc];
        return;
    }
    if ([title isEqualToString:@"KVO的实现"]) {
        KVODemoVC *vc = [[KVODemoVC alloc] init];
        [self base_pushVC:vc];
        return;
    }
    if ([title isEqualToString:@"copy1"]) {
        self.mArr = [[NSMutableArray alloc] init];
        [self.mArr addObject:@"看看会不会崩溃"];
        //是因为属性修饰符copy 会在getter方法返回不可变对象，后续的可变操作就崩溃了
        return;
    }
    if ([title isEqualToString:@"copy2"]) {
        _mArr = [[NSMutableArray alloc] init];
        [_mArr addObject:@"看看会不会崩溃"];
        return;
    }
    if ([title isEqualToString:@"runtime 消息转发流程"]) {
        RuntimeObject *obj = [[RuntimeObject alloc] init];
        [obj test];//这里调用了一个只有声明 没有实现的方法，之后runtime会走消息转发流程中的各个方法，都在RuntimeObject.m文件中实现了
        //会打印出相关调用方法日志
        return;
    }
    if ([title isEqualToString:@"runtime Method Swizzling"]) {
        RuntimeObject *obj = [[RuntimeObject alloc] init];
        [obj testFuncOne];//实际上调用的是testFuncTwo
        return;
    }
    if ([title isEqualToString:@"runtime 动态添加方法"]) {
        RuntimeObject *obj = [[RuntimeObject alloc] init];
        [obj meiyouwo];//.m文件中没有此方法的实现，使用动态添加方法的方式，为此方法的实现指定了新的方法
        return;
    }
    if ([title isEqualToString:@"循环引用之Timer"]) {
        TimerCircleVC *vc = [[TimerCircleVC alloc] init];
        [self base_pushVC:vc];
        return;
    }
    if ([title isEqualToString:@"block 截获"]) {
        int var = 6;
        int(^Block)(int) = ^int(int num){
            return num*var;
        };
        var = 4;//由于局部变量基本数据类型 block内部截获是重新声明了一个和截获是一模一样的变量，所以这里的修改其实并不会影响block内部“复制”的变量值
        FXWLog(@"Block resulit is %d", Block(2));
        
        static int a = 10;
        int(^BlockStatic)(int) = ^int(int num){
            return num*a;
        };
        a = 20;//由于静态变量在block内部截获时获取的是静态变量的指针地址，所以这里的修改是会生效的，block内部和外面使用的是通一个变量
        FXWLog(@"BlockStatic resulit is %d", BlockStatic(2));
        return;
    }
    if ([title isEqualToString:@"block __blcok"]) {
        //注意！！！ 当使用__block的时候外界的修改就会影响截获后block的值了
        __block int var2 = 6;
        int(^Block2)(int) = ^int(int num){
            return num*var2;
        };
        var2 = 4;//这里有雨变量被__block修饰 所以下面的输出是8
        FXWLog(@"Block2 resulit is %d", Block2(2));
        return;
    }
    FXWLog(@"没有找到对应选项！！！");
    
}

@end

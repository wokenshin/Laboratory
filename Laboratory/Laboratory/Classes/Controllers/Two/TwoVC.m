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
#import "NSOPBVC.h"
#import "Sington.h"


@interface TwoVC(){
    NSString *kvcDemo2;
}
@property (nonatomic, copy) NSMutableArray *mArr;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *kvcDemo;
@property (nonatomic, strong) Sington *globalSington;
@property (nonatomic, strong) NSObject *test;
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
    [self baseTableVC_addDataWithTitle:@"字符排序-大写靠前" andDetail:@"2019.7.12"];
    [self baseTableVC_addDataWithTitle:@"实现单例" andDetail:@"重复调用 看下控制台输出"];
    [self baseTableVC_addDataWithTitle:@"打印字符串对应子字符的下标" andDetail:@"2019.7.9 容易题"];
    [self baseTableVC_addDataWithTitle:@"NSOperationBlock 面试题" andDetail:@"2019.7.8"];
    [self baseTableVC_addDataWithTitle:@"响应者链" andDetail:@"2019.7.6"];
    [self baseTableVC_addDataWithTitle:@"弹窗的设计" andDetail:@"2019.7.3"];
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
    [self baseTableVC_addDataWithTitle:@"父类-子类-分类load执行顺序" andDetail:@"过滤控制台日志看看 >>>"];
    //[self baseTableVC_addDataWithTitle:@"RunLoop 常驻线程" andDetail:@"2019.6.27"];
        
}

- (void)baseTableVC_clickCellWithTitle:(NSString *)title{
    if ([title isEqualToString:@"字符排序-大写靠前"]) {
        /*
         今天去腾讯面试啦，虽然是外派过去驻场的项目，但是是由腾讯的前辈负责面试的，感觉很兴奋
         面试题不多，也不难，就两个
         字符排序-大写靠前，如 “abcDHelloWorld”-->修改成"DHWabcelloorld"
         大写字母靠前，其他字母一次考后即可
         思路是ASKII码 判断 大小写字母的边界数 if判断即可
         我记得面试的时候我写成 96了。。。
         
         思路：找到大写字母保存到零时变量中，此时原来放大写字母的位置为“空”，将左边所有元素右移一个单位。将临时保存的大写字母放到左边。依次类推
         */
        
        char arr[] = "abcDHelloWorld";
        unsigned long len = strlen(arr);
        unsigned long indexP = 0;
        printCharArr(arr);
        for (int i = 0; i < len; i++) {
            if (arr[i] < 'a') {//这里直接这么写就可以了
                
                char charDX = arr[i];//第一步中间变量保存大写字母
                
                //第二步 将取出大写字母位置前的所有字符向右移动一个单位
                for (unsigned long j = i; j > indexP; j--) {
                    arr[j] = arr[j-1];
                }
                
                //第三步 讲最前面空出的位置放上 charDX
                arr[indexP] = charDX;
                indexP++;//此时大写字母和索引都+1
                
            }
        }
        printCharArr(arr);
        
        return;
    }
    if ([title isEqualToString:@"实现单例"]) {
        /*
         面试官问 如果自己要实现一个单例应该怎么做 它的原理是什么呢？
         
         说一说感想：
         面试题感觉并不难，但是很多知识点平时真的积累得不好，也忘记温故而知新的道理。
         就好比这里的两个面试题暴露出的问题，个人对知识点的掌握程度还是有待提高的，这只是冰山一角，努力吧，其实很多事情不是真的喜欢，而是你要明白为什么要做好它。
         如果你真的喜欢，其实那是很幸福的一件事情。而糟糕的事，有时候会发现喜欢的东西并不等于工作。关于如何看待自己的工作这个问题，我想问已经成熟很多了。
         还不够，继续努力。然后为了安全可以将指针的指向只为null或者0x0
         
         最终收获：2019.7.17
         自己的理解结合资料和前辈的讲解
         在创建单例的时候，由于使用了static 静态变量，我们创建的对象是分配到堆区的，但是指针保存在了全局区域。
         当将指针置为nil之后，堆内存会释放，此时也调用了dealloc方法，但是静态变量不会被释放。也不需要free，
         free是对堆内存的释放，对指针不存在free的概念。
         
         */
        Sington *obj  = [Sington alloc];
        Sington *obj5 = [Sington shareSington];
        Sington *obj1 = [[Sington alloc] init];
        Sington *obj2 = [Sington new];
        Sington *obj3 = [obj1 copy];
        Sington *obj4 = [obj1 mutableCopy];
        if (_globalSington == nil) {
            _globalSington = [Sington shareSington];
        }
        [_globalSington test];
        
        [obj1 test];
        [obj2 test];
        [obj3 test];
        [obj4 test];
        [obj5 test];
        obj1 = nil;
        obj2 = nil;
        obj3 = nil;
        obj4 = nil;
        obj5 = nil;
        
        _test = [[NSObject alloc] init];
        _test = nil;
        
        [obj removeSelf];//这样操作的话 就是真的拿到不愿来的单例了
        _globalSington = nil;
        return;
    }
    if ([title isEqualToString:@"打印字符串对应子字符的下标"]) {
        [self printSubIndexStrInString];
        return;
    }
    if ([title isEqualToString:@"NSOperationBlock 面试题"]) {
        NSOPBVC *vc = [[NSOPBVC alloc] init];
        [self base_pushVC:vc];
    }
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

- (void)printSubIndexStrInString{
    char arr[] = "hellomysweetkenshin";
    // 计算数组中数据长度 :
    // 所有数据的字节数除以一个数据的字节数即为数据的个数 :
    int lengthArr  = sizeof(arr) / sizeof(char);
    for (int i = 0; i < lengthArr; i++) {
        char tmp = arr[i];
        if (tmp == 'e') {
            printf("%d\n", i);
        }
    }
    
}

//打印字节数组中的全部内容
void printCharArr(char arr[]){
    for (unsigned long i =0; i < strlen(arr); i++) {
        printf("%c", arr[i]);
    }
    printf("\n");
}

@end

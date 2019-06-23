//
//  CLanguageBaseContentVC.m
//  Laboratory
//
//  Created by kenshin van on 2019/6/22.
//  Copyright © 2019 mac. All rights reserved.
//

#import "CLanguageBaseContentVC.h"

//宏定义常量
#define PI 3.141592654 //会自动判断右边的类型

//宏定义方法
#define fxwswap(x,y)\
x=x+y;\
y=x-y;\
x=x-y\
//上面 宏定义里面要换行的话 用 \ 表示
//上面的宏定义其实就是一段代码， 最后的 x=x-y 没有加上分号，如果有分号，那么代码中调用 swap(2,1) 末尾也可以不用写分号，为了统一，所以上面的宏末尾没有加分号
/**
 这里提供的C语言基础部分 主要用于对Runtime学习的一个基础，详细的C语言部分还需要另外学习。
 */

//宏定义一段代码
#define FXWLOG\
    int xx = 10;\
    int yy = 10;\
    printf("xx == %d\n", xx);\
    printf("yy == %d\n", yy)
//马德 不知道为什么 上面的宏不缩紧就报错(在代码中有用到宏的前提下)

#define A 520

//宏定义逻辑判断,下面的宏定义的意思是  1.如果没有宏定义A--->2.定义宏定义 A 为 1---->3.结束定义
//由于我们上面定义了 A为520 所以下面的逻辑宏定义就不会执行 A为2的定义

#ifndef A   //是否没有宏定义A
#define A 1 //宏定义A
#endif      //判断结束

//取消宏定义 下面的宏定义的意思是 取消宏定义 A 如果取消下面的注释 那么上面定义的A 就相当于没有了
//#undef A



//定义一个结构体【注意 由于这里用到了C++的语法，所以将本文件名后最修改为了 .mm    否则会报错】
struct Student {
    int no;
    char name[20];
    int *age;

    //结构体初始化
    Student(){
        no = 10;
        strcpy(name, "kenshin");//数组的一种赋值方式
        age = new int(29);//分配int型空间 放入29
    }
};

//定义一个Student1结构体 继承于 Student
struct Student1:Student{

};

//定义一个结构体变量Student2
struct:Student{

}stu2;//这里的stu2 是变量名 上面定义的结构体都省略了变量名

//定义一个Student3结构体和一个结构体变量stu3
struct Student3:Student {

}stu3;

//定义一个结构体Student4 并e给它取别名
typedef struct Student4:Student{

}Stu4;//这里的Stu4 就是这个结构体Student4的别名

@interface CLanguageBaseContentVC ()

@end

@implementation CLanguageBaseContentVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"C语言基础";
    [self loadCLanguageBaseContentVCData];
    [self baseTableVC_reloadMyTableView];
    
    
}

- (void)loadCLanguageBaseContentVCData{
    [self baseTableVC_addDataWithTitle:@"普通指针" andDetail:@"2019.6.22"];
    [self baseTableVC_addDataWithTitle:@"指针的指针" andDetail:@"6.22"];
    [self baseTableVC_addDataWithTitle:@"数组指针" andDetail:@"6.22"];
    [self baseTableVC_addDataWithTitle:@"函数指针" andDetail:@"6.22"];
    [self baseTableVC_addDataWithTitle:@"返回指针的函数" andDetail:@"6.22"];
    [self baseTableVC_addDataWithTitle:@"结构体" andDetail:@"6.23"];
    [self baseTableVC_addDataWithTitle:@"位运算" andDetail:@"核心内容"];
    [self baseTableVC_addDataWithTitle:@"宏定义及操作" andDetail:@"宏定义很重要！！！提升开发效率"];
    
}

- (void)baseTableVC_clickCellWithTitle:(NSString *)title{
    //%p中的p是pointer(指针)的意思，专门用于打印指针变量中的内容
    if ([title isEqualToString:@"普通指针"]) {
        int a = 4;
        int *pa = &a; //用 * 定义指针， pa 是指针的名字， &a 是获取a中的地址值 赋值给指针pa
        printf("a == %d\n", a);//%d 对应输出的是整形数据
        printf("&a == %p\n", &a);//%p 对应输出的是内存地址
        printf("pa == %p\n", pa);
        printf("*pa == %d\n", *pa);
        printf("&*pa == %p\n", &*pa);
        //综上，pa是指针地址， *pa是指针值, &a 其实就是这个值对应的地址，这里也是pa的 即 &a == pa
        
        
        //下面打印内容 区分了 指针指，指针内存地址，它们一个是保存的内容，一个是内容的地址。相当于一个是房间里面的内容，一个是外面的房间号码
        int x = 100;
        int *px = &x;
        printf("打印x的值 x == %d\n", x);
        printf("打印px的值 实际上px的值就是x的内存地址 px == %p\n", px);
        printf("打印px的内存地址 &px == %p\n", &px);
        printf("所以指针的地址 和指针的值 其实是两个概念，地址是保存自己变量的位置，值是保存的另外一个内存地址");
        return;
        
    }
    if ([title isEqualToString:@"指针的指针"]) {
        //相当于链表的形式： ppa--->pa--->a   这里的ppa就是指针pa的指针。而pa指针又指向了a
        int a = 520;
        int *pa = &a;
        int **ppa = &pa;
        printf("&a的意思是a的内存地址 &a==%p\n", &a);
        printf("&pa的意思是pa的内存地址 &pa==%p\n", &pa);
        printf("ppa的内存地址 ppa==%p\n", ppa);
        printf("ppa的内存地址 &ppa==%p\n", &ppa);
        printf("*ppa的内存地址 *ppa==%p\n", *ppa);
        printf("**ppa的值 **ppa==%d\n", **ppa);
        return;
    }
    if ([title isEqualToString:@"数组指针"]) {
        char arr[] = "kenshin";
        char *p = arr;
        printf("arr==%p\n", arr);
        printf("p==%p\n", p);
        //查看每一个元素的地址
        for (int i = 0; i < 7; i++) {
            printf("&arr[%d]==%p\n", i, &arr[i]);//从这里可以看到 打印的第一个元素的地址 就是 arr的内存地址，所以arr的内存地址就是数组首个元素的内存地址
        }
        //1、用数组下标取值
        for (int i = 0; i < 7; i++) {
            printf("%c", arr[i]);//%c 对应打印 字符
        }
        printf("\n");//换行
        //2、用指针地址取值
        for (int i = 0; i < 7; i++) {
            printf("%c", *(p+i));
        }
        return;
    }
    //下面的指针会用到一些函数，我们将在本VC中定义
    if ([title isEqualToString:@"函数指针"]) {
        //函数指针的语法定义：    返回类型(*指针变量名)([形参列表])
        int(*p)(int a, int b);
        p = getMax;//这里的赋值也是赋值的函数的首地址
        int resultMax = p(13, 14);//这里调用了p这个指针，就相当于调用了getMax这个函数，就是通过函数的首地址来调用的
        printf("getMax(13,14) == %d", resultMax);
        return;
    }
    if ([title isEqualToString:@"返回指针的函数"]) {
        //函数指针的语法定义：    返回类型(*指针变量名)([形参列表])
        int *p = getMin(13, 14);
        printf("getMin(13,14) == %d", *p);//这里的 *p 就是指针的值，p就是一个内存地址，这个内存地址里面保存了 getMin的值，而指针自身也保存在了另外一个内存地址中
        return;
    }
    if ([title isEqualToString:@"结构体"]) {
        //在本VC顶部定义了结构体，由于使用了C++语法，所以将本文件名后最改成了 .mm
        //访问结构体
        
        //方式一:
        struct Student1 stu;//这里和定义一个结构体的开头是一样的
        printf("stu.no == %d\n", stu.no);
        printf("stu.age == %d\n", *stu.age);
        printf(" stu.name == %s\n", stu.name);
        
        //下面是通过指针地址偏移的方式来访问的，注意 这里的*是放在括号外面的， 如果写成 (*stu.name + index)的话，得到的结果就是 左边的值+索引了
        printf("通过指针地址偏移访问 stu.name == %c%c%c%c%c%c%c\n", *(stu.name),*(stu.name+1),*(stu.name+2),*(stu.name+3),*(stu.name+4),*(stu.name+5),*(stu.name+6));
        
        //方式二：
        printf("stu2.no == %d\n", stu2.no);//因为前面已经声明了 所以可以直接用
        
        //方式三:使用 typedef 的别名
        Stu4 stu4;
        printf("stu4.no == %d\n", stu4.no);
        
        //还有其他方式 都是大同小异
        
        //结构体指针
        Stu4 *pStu4 = &stu4;
        printf("结构体指针 pStu4.no == %d\n", pStu4->no);//注意 指针的访问方式是 -> 而不是 .
        
        /*
         结构体位域 计算机里面 8位==1字节    1位 就是 一个 0or1 8位就是 0000 0000
         */
        
        //定义一个结构体
        struct Teacher{
            unsigned int a:1;//位域 限定大小
            unsigned int b:2;
            unsigned int c:3;
            unsigned int d:4;
        }tc, *ptc;//这里定义了两个变量， 一个是普通的结构体变量， 一个是结构体指针变量
        
        printf("打印结构体的长度 用 sizeof %lu\n", sizeof(Teacher));//这里打印了4个字节的长度，我还以为会打印结构体内部所有定义大小的总和，但是实际不是
        
        //用结构体指针 赋值
        ptc = &tc;
        ptc->a = 1;//1      0+0+0+1
        ptc->b = 3;//11     0+0+2+1
        ptc->c = 7;//111    0+4+2+1
        ptc->d = 15;//1111  8+4+2+1
        printf("ptc->a == %d\n", ptc->a);
        printf("ptc->b == %d\n", ptc->b);
        printf("ptc->c == %d\n", ptc->c);
        printf("ptc->d == %d\n", ptc->d);
        return;
    }
    if ([title isEqualToString:@"位运算"]) {
        //由于复习的目的是为了找工作，为了高效率，暂时不做笔记了。这里的知识点后续有时间再来补全
        
        /*
         与  &   两者都为1       01&10 == 00     01&11 == 01
         或  |   有1则为1        01|10 == 11
         非  ～   自身取反         ～01 == 10
        异或  ^   两者不通则为1    01^10 == 11
         */
        int a = 1;//01
        int b = 2;//10
        printf("a&b == %d\n", a&b);//01&10 == 00 -->0
        printf("a|b == %d\n", a|b);//01|10 == 11 -->3
        printf("~2a == %d\n", ~a);//~01 == 10 -->2
        printf("a^b == %d\n", a^b);//01^10 == 11 -->3
        return;
    }
    if ([title isEqualToString:@"宏定义及操作"]) {
        /*
         1宏定义 常量
         2.宏定义 方法
         3.宏定义 代码
         4.宏定义
         
         本类的宏定义在文件顶部
         */
        
        //1宏定义 常量
        printf("输出 宏定义 PI == %.9lf\n", PI);//9的意思是 保留小数点后9位
        
        //2.宏定义 方法
        int a = 10;
        int b = 20;
        printf("%d,%d\n", a, b);
        fxwswap(a, b);
        printf("%d,%d\n", a, b);
        
        FXWLOG;//这里的FXWLOG其实就是宏定义的那段代码
        //因为上面的FXWLOG里面已经定义了 xx 和yy 所以下面的代码中是可以访问他们的
        printf("xx == %d\n", xx);
        printf("yy == %d\n", yy);
        
        printf("A == %d", A);
        
#ifdef A
        printf("如果有宏定义A 那么就打印A， A == %d\n", A);
#elif B
        printf("如果有宏定义B 那么就打印B， B == %d\n", B);
#else
        printf("没有如果有宏定义");
#endif
        return;
    }
}

//返回int类型值的函数
int getMax(int a, int b){
    printf("调用了getMax函数\n");
    return a>b?a:b;
}

//返回int类型指针的函数
int *getMin(int a, int b){
    printf("调用了getMin函数\n");
    int resultMin = a<b?a:b;
    int *pMin = &resultMin;
    return pMin;
}

@end

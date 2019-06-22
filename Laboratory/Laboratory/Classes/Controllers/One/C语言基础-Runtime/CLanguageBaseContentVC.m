//
//  CLanguageBaseContentVC.m
//  Laboratory
//
//  Created by kenshin van on 2019/6/22.
//  Copyright © 2019 mac. All rights reserved.
//

#import "CLanguageBaseContentVC.h"

/**
 这里提供的C语言基础部分 主要用于对Runtime学习的一个基础，详细的C语言部分还需要另外学习。
 */

////定义一个结构体【注意 由于这里用到了C++的语法，所以将本文件名后最修改为了 .mm    否则会报错】
//struct Student {
//    int no;
//    char name[20];
//    int *age;
//
//    //结构体初始化
//    Student(){
//        no = 114;
//        strcpy(name, "kenshin");//数组的一种赋值方式
//        age = new int(20);//分配int型空间 放入20
//    }
//};
//
////定义一个Student1结构体 继承于 Student
//struct Student1:Student{
//
//};
//
////定义一个结构体变量Student2
//struct:Student{
//
//}stu2;//这里的stu2 是变量名 上面定义的结构体都省略了变量名
//
////定义一个Student3结构体和一个结构体变量stu3
//struct Student3:Student {
//
//}stu3;
//
////定义一个结构体Student4 并e给它取别名
//typedef struct Student4:Student{
//
//}Stu4;//这里的Stu4 就是这个结构体Student4的别名

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
    [self baseTableVC_addDataWithTitle:@"结构体" andDetail:@"6.22"];
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

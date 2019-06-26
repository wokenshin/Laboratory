//
//  MSVC.m
//  Laboratory
//
//  Created by kenshin van on 2019/6/26.
//  Copyright © 2019 mac. All rights reserved.
//

#import "MSVC.h"

@implementation MSVC
- (void)viewDidLoad{
    [super viewDidLoad];
    self.title = @"多线程";
    [self loadTwoVCData];
    [self baseTableVC_reloadMyTableView];
}

- (void)loadTwoVCData{
    [self baseTableVC_addDataWithTitle:@"多线程-同步串行1" andDetail:@"造成死锁"];
    [self baseTableVC_addDataWithTitle:@"多线程-同步串行2" andDetail:@"不会造成死锁"];
    [self baseTableVC_addDataWithTitle:@"多线程-同步并发" andDetail:@""];
    [self baseTableVC_addDataWithTitle:@"多线程-异步串行" andDetail:@""];
    [self baseTableVC_addDataWithTitle:@"多线程-腾讯面试题" andDetail:@"2019.6.26"];
    [self baseTableVC_addDataWithTitle:@"多线程-group" andDetail:@"2019.6.26"];
    
}

- (void)baseTableVC_clickCellWithTitle:(NSString *)title{
    if ([title isEqualToString:@"多线程-group"]) {
        //创建一个并发队列
        dispatch_queue_t concurrent_queue = dispatch_queue_create("concurrent_queue",DISPATCH_QUEUE_CONCURRENT);
        NSMutableArray<NSURL *> *arrayURLs= [[NSMutableArray alloc] init];
        
        //伪代码
        [arrayURLs addObject:[NSURL URLWithString:@"img1"]];
        [arrayURLs addObject:[NSURL URLWithString:@"img2"]];
        [arrayURLs addObject:[NSURL URLWithString:@"img3"]];
        
        //创建一个group
        dispatch_group_t group = dispatch_group_create();
        for (NSURL *url in arrayURLs) {
            //异步组分派到队列当中
            dispatch_group_async(group, concurrent_queue, ^{
                for (int i = 0; i<100; i++) {//伪代码
                    //根据url去下载图片
                    FXWLog(@"url is %@ loading:%d", url, i);
                }
            });
        }
        
        dispatch_group_notify(group, dispatch_get_main_queue(), ^{
            //这里的block的回调是要等到所有的并发任务都完成之后才会被执行
            //也就是要等到dispatch_group_async中所有的任务都执行完之后才会走这里的回调
            FXWLog(@"将下载完的所有图片进行拼接");
        });
        
        return;
    }
    if ([title isEqualToString:@"多线程-腾讯面试题"]) {//腾讯面试题 问下面的打印结果是什么
        //创建一个并发队列
        dispatch_queue_t globalQueue = dispatch_get_global_queue(0, 0);
        //通过async异步方式分配到全局队列
        dispatch_async(globalQueue, ^{
            FXWLog(@"1");
            //这里的performSelector方法是必须当前线程在runloop中才会执行
            //由于当前gcd中没有runloop 所以这里的performSelector方法是不会执行的
            [self performSelector:@selector(pintLog) withObject:nil afterDelay:0];
            FXWLog(@"3");
        });
        //打印结果是 1、3 其中的2不会打印。！！！
        return;
    }
    if ([title isEqualToString:@"多线程-异步串行"]) {
        //异步分配到主队列，主队列本身也是一个串行队列
        dispatch_async(dispatch_get_main_queue(), ^{//异步async
            [self testFunc];//不会发生死锁
        });
        FXWLog(@"没有发生死锁");
        return;
    }
    if ([title isEqualToString:@"多线程-同步并发"]) {
        FXWLog(@"1");
        //创建一个并发队列
        dispatch_queue_t globalQueue = dispatch_get_global_queue(0, 0);
        dispatch_sync(globalQueue, ^{
            FXWLog(@"2");
            dispatch_sync(globalQueue, ^{
                FXWLog(@"3");
            });
            FXWLog(@"4");
        });
        FXWLog(@"5");
        
        return;
    }
    if ([title isEqualToString:@"多线程-同步串行2"]) {
        //创建一个串行队列
        dispatch_queue_t queue = dispatch_queue_create("慕课网", DISPATCH_QUEUE_SERIAL);
        dispatch_sync(queue, ^{//不会发生死锁的原因是因为这里的任务是在一个新建的串行队列中提交的
            FXWLog(@"我不会发生死锁！！！");//而使用主队列的时候，当前任务也是在主队列中提交的，所以两个任务之间发生了死锁
        });
        FXWLog(@"没有发生死锁!");
        return;
    }
    if ([title isEqualToString:@"多线程-同步串行1"]) {
        //由于当前线程是主线程
        //下面的同步操作和当前操作 都是在主队列中，都要在主线程中执行
        //主队列当中提交的任务 无论是同步 还是异步 最终都要提交到主线程当中执行
        //彼此等待，造成死锁。
        dispatch_sync(dispatch_get_main_queue(), ^{//主队列也是一个串行队列
            [self testFunc];//这里造成了死锁
            //死锁原因:
        });
        FXWLog(@"看看会不会死锁，有没有调用我");
        return;
    }
    
    FXWLog(@"没有找到对应选项！！！");
    
}

- (void)testFunc{
    FXWLog(@"测试方法 多线程");
}

- (void)pintLog{
    FXWLog(@"2");
}

@end

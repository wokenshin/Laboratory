//
//  AlgorithmVC.m
//  Laboratory
//
//  Created by kenshin van on 2019/6/27.
//  Copyright © 2019 mac. All rights reserved.
//

#import "AlgorithmVC.h"
#import "CharReverse.h"
#import "ReverseList.h"

@implementation AlgorithmVC

- (void)viewDidLoad{
    [super viewDidLoad];
    self.title = @"算法";
    [self loadTwoVCData];
    [self baseTableVC_reloadMyTableView];
}

- (void)loadTwoVCData{
    [self baseTableVC_addDataWithTitle:@"字符串反转" andDetail:@"只是对单个字符进行反转，进阶要求单词反转"];
    [self baseTableVC_addDataWithTitle:@"链表反转" andDetail:@"没有完全理解，需要复习"];
    [self baseTableVC_addDataWithTitle:@"有序数组合并" andDetail:@"暂时先不实现"];
    [self baseTableVC_addDataWithTitle:@"Hash算法" andDetail:@"暂时先不实现"];
    
}

- (void)baseTableVC_clickCellWithTitle:(NSString *)title{
    if ([title isEqualToString:@"Hash算法"]) {
        
        return;
    }
    if ([title isEqualToString:@"有序数组合并"]) {
        /*
         有序数组合并的意思是有两个有序的数组，合并之后的数组依然是有序的
         例如
         arrOne[1,4,6,7,9];
         arrTwo[2,3,5,6,8,10,11,12];
         arrNew[1,2,3,4,5,6,7,8,9,10,11,12];
         
         算法思路：定义两个指针p1,p2分别指向两个数组的开头
         对两个指针的元素进行比较，较小的放到合并后的数组中，较大的继续和被放进合并数组的下一个指针地址的元素进行比较，再将较小的放入到合并的数组中
         一直这样比较，最后有一边的数组会全部放完，剩下的另外一边的数组就将所有元素一次添加到合并后的数组中即可。
         */
        
        
        return;
    }
    if ([title isEqualToString:@"链表反转"]) {
        /*
         例如：【1】-->【2】-->【3】-->【4】-->NULL
         反转后: 【4】-->【3】-->【2】-->【1】-->NULL
         */
        
        //创建一个单链表
        struct Node *head = constructList();
        printList(head);
        
        printf("-------------\n");
        
        //反转链表
        struct Node *newH = reverseList(head);
        printList(newH);
        
        return;
    }
    if ([title isEqualToString:@"字符串反转"]) {
        char str[] = "I LOVE YOU";
        char_reverse(str);
        FXWLog(@"%s", str);
        return;
    }
    
    FXWLog(@"没有找到对应选项！！！");
    
}

@end

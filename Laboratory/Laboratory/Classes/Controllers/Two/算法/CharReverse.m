//
//  CharReverse.m
//  Laboratory
//
//  Created by kenshin van on 2019/6/27.
//  Copyright © 2019 mac. All rights reserved.
//

#import "CharReverse.h"

@implementation CharReverse


/**
 大致逻辑是这样的：定义一直begin指针指向字符开头，一个end指针指向字符结尾，彼此都往中间靠，每一次偏移前都替换begin和end的内容

 @param cha 字符数组
 */
void char_reverse(char *cha){
    //指向第一个字符
    char *begin = cha;
    //指向最后一个字符
    char *end = cha + strlen(cha) - 1;
    
    while (begin<end) {
        //交换前后两个字符，同时移动指针向中间靠
        char temp = *begin;
        *(begin++) = *end;
        *(end--) = temp;
    }
}
@end

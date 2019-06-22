//
//  BaseVC.h
//  Laboratory
//
//  Created by mac on 2019/6/21.
//  Copyright © 2019 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/**
 所有父类方法都是用 方法名前缀 这样做的目的是能够很直观的看到其他地方调用方法的来源，当然如果被重写的话，可能会出现混淆。所以重写的方法需要另外命名。
 */
@interface BaseVC : UIViewController

/**
 push 隐藏TabBar
 
 @param pushVC push到的vc
 */
- (void)base_pushVC:(UIViewController *)pushVC;

@end

NS_ASSUME_NONNULL_END

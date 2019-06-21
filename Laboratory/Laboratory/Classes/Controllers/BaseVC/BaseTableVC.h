//
//  BaseTableVC.h
//  Laboratory
//
//  Created by mac on 2019/6/21.
//  Copyright © 2019 mac. All rights reserved.
//

#import "BaseVC.h"

NS_ASSUME_NONNULL_BEGIN

@interface BaseTableVC : BaseVC<UITableViewDataSource, UITableViewDelegate>


/**
 添加数据后调用此方法加载列表
 */
- (void)base_reloadMyTableView;

/**
 添加数据到列表
 
 @param title 标题
 @param detail 详情
 */
- (void)base_addDataWithTitle:(NSString *)title andDetail:(NSString *)detail;


/**
 cell被点击的时候会调用该方法，子类通过重写该方法来实现监听
 
 @param title cell的 title
 */
- (void)base_clickCellWithTitle:(NSString *)title;


/**
 push
 
 @param pushVC push到的vc
 */
- (void)base_pushVC:(UIViewController *)pushVC;

@end

NS_ASSUME_NONNULL_END

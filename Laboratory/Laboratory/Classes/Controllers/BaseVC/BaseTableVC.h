//
//  BaseTableVC.h
//  Laboratory
//
//  Created by mac on 2019/6/21.
//  Copyright © 2019 mac. All rights reserved.
//

#import "BaseVC.h"

NS_ASSUME_NONNULL_BEGIN


/**
 本控制器就是封装了一个默认TableView 带箭头的列表
 
 使用说明
 1.添加数据：- (void)base_addDataWithTitle:(NSString *)title andDetail:(NSString *)detail;
 2.加载数据：- (void)base_reloadMyTableView;
 3.重写点击事件方法：- (void)base_clickCellWithTitle:(NSString *)title;
 */
@interface BaseTableVC : BaseVC<UITableViewDataSource, UITableViewDelegate>

/**
 添加数据后调用此方法加载列表
 */
- (void)baseTableVC_reloadMyTableView;

/**
 添加数据到列表
 
 @param title 标题
 @param detail 详情
 */
- (void)baseTableVC_addDataWithTitle:(NSString *)title andDetail:(NSString *)detail;

/**
 cell被点击的时候会调用该方法，子类通过重写该方法来实现监听
 
 @param title cell的 title
 */
- (void)baseTableVC_clickCellWithTitle:(NSString *)title;



@end

NS_ASSUME_NONNULL_END

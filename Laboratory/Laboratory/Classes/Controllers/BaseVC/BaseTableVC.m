//
//  BaseTableVC.m
//  Laboratory
//
//  Created by mac on 2019/6/21.
//  Copyright © 2019 mac. All rights reserved.
//

#import "BaseTableVC.h"

@interface BaseTableVC ()
@property (nonatomic, strong) UITableView                   *tableView;
@property (nonatomic, strong) NSMutableArray                *mArrData;
@end

@implementation BaseTableVC

- (void)viewDidLoad{
    [super viewDidLoad];
    _tableView = [[UITableView alloc] init];
    _tableView.backgroundColor = [UIColor whiteColor];
    _tableView.dataSource = self;
    _tableView.delegate   = self;
    
    //隐藏多余遇分割线【注释掉 可看效果】
    UIView *v = [[UIView alloc] initWithFrame:CGRectZero];
    [_tableView setTableFooterView:v];
    
    [self.view addSubview:_tableView];
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_topLayoutGuide);//导航栏底部
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.bottom.equalTo(self.mas_bottomLayoutGuide);//UITabbar顶部 这样底部就不会被遮挡了
    }];
    
}

- (void)base_reloadMyTableView{
    [_tableView reloadData];
}

- (void)base_addDataWithTitle:(NSString *)title andDetail:(NSString *)detail{
    NSMutableDictionary *mDic = [[NSMutableDictionary alloc] init];
    [mDic setObject:title  forKey:@"title"];
    [mDic setObject:detail forKey:@"detail"];
    [self.mArrData addObject:mDic];
    
}

#pragma mark UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.mArrData count];
}

#pragma mark UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}

#pragma mark 绘制cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"kenshin"];
    NSDictionary *dic     = [self.mArrData objectAtIndex:indexPath.row];
    
    cell.textLabel.text       = [dic objectForKey:@"title"];
    cell.detailTextLabel.text = [dic objectForKey:@"detail"];
    
    cell.textLabel.textColor       = [UIColor redColor];
    cell.detailTextLabel.textColor = [UIColor blueColor];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;//设置箭头
    return cell;
    
}

#pragma mark - 点击——Cell
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //去除cell选中色
    [tableView deselectRowAtIndexPath:[tableView indexPathForSelectedRow] animated:YES];
    
    NSDictionary *dic = [self.mArrData objectAtIndex:indexPath.row];
    NSString *title   = [dic objectForKey:@"title"];
    [self base_clickCellWithTitle:title];
}

//cell 被点击的时候会调用该方法
- (void)base_clickCellWithTitle:(NSString *)title{}

#pragma mark 懒加载
- (NSMutableArray *)mArrData{
    if (_mArrData == nil){
        _mArrData = [[NSMutableArray alloc] init];
    }
    return _mArrData;
}

- (void)base_pushVC:(UIViewController *)pushVC{
    pushVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:pushVC animated:YES];
}


@end

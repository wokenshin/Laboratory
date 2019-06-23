//
//  MainTabBarVC.m
//  Laboratory
//
//  Created by mac on 2019/6/21.
//  Copyright © 2019 mac. All rights reserved.
//

#import "MainTabBarVC.h"
#import "OneVC.h"
#import "TwoVC.h"

@implementation MainTabBarVC

- (void)viewDidLoad{
    [super viewDidLoad];
    [self initMainUI];
}

#pragma mark initMainUI
- (void)initMainUI
{
    //必须的两个属性设置[如果没有 nav就没有返回 和 title了]
    self.navigationController.navigationBarHidden = YES;
    self.hidesBottomBarWhenPushed = NO;
    
    OneVC *oneVC = [[OneVC alloc] init];
    TwoVC *twoVC = [[TwoVC alloc] init];
    
    //返回导航控制器
    UINavigationController *nav1 = [self subNavOfTabBarVCWith:@"实验"
                                                    viewController:oneVC
                                                         imageName:@"wb_home"
                                                 selectedImageName:@"wb_home_selected"];
    
    UINavigationController *nav2 = [self subNavOfTabBarVCWith:@"面试"
                                               viewController:twoVC
                                                    imageName:@"wb_profile"
                                            selectedImageName:@"wb_profile_selected"];
    
    
    //设置TabBarVC的子控制器
    self.viewControllers = [NSArray arrayWithObjects:nav1, nav2, nil];
    
}

#pragma mark 创建TabBarVC 的子控制器 并设置为Nav
-(UINavigationController *)subNavOfTabBarVCWith:(NSString *)title
                                 viewController:(UIViewController *)viewController
                                      imageName:(NSString *)imageName
                              selectedImageName:(NSString *)selectedImageName
{
    
    //IOS 7以上要设置图片渲染模式
    UIImage *image = [UIImage imageNamed:imageName];
    image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];//禁止渲染
    UIImage *selectedImage = [UIImage imageNamed:selectedImageName];
    selectedImage = [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];//禁止渲染
    
    viewController.hidesBottomBarWhenPushed = NO;//当进入到viewController时 是否要隐藏底部的 bar
    
    UINavigationController *navViewController = [[UINavigationController alloc] initWithRootViewController:viewController];
    navViewController.tabBarItem = [[UITabBarItem alloc] initWithTitle:title image:image selectedImage:selectedImage];
    
    //设置Tab选中时文本文字颜色
    [navViewController.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:FXW_RGBColor(255,70,70)}
                                                forState:UIControlStateSelected];
    
    //设置Tab未选中时颜色
    [navViewController.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:FXW_RGBColor(179, 179, 179)}
                                                forState:UIControlStateNormal];
    
    if(image == nil || viewController == nil){
        navViewController.tabBarItem.enabled = NO;
    }
    return navViewController;
    
}

- (void)dealloc{
    NSLog(@">>>--------释放了：%@", [self class]);
}
@end

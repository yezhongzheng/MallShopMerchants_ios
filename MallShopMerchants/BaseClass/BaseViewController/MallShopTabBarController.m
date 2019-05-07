//
//  MallShopTabBarController.m
//  MallShopMerchants
//
//  Created by zl on 2019/5/5.
//  Copyright © 2019 yezhongzheng. All rights reserved.
//

#import "MallShopTabBarController.h"
#import "MallShopMerchantsNC.h"

#define kTabBarImageName @"kTabBarImageName"
#define kViewControllerClassName @"kViewControllerClassName"
#define kTabBarTitleName @"kTabBarTitleName"
#define kTabBarSelectImageName @"kTabBarSelectImageName"

@interface MallShopTabBarController ()

@end

@implementation MallShopTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSArray *elementArray = @[
                              @{kTabBarImageName:@"ico_home_index_g",
                                kViewControllerClassName: @"HomePageVC",
                                kTabBarTitleName:@"首页",
                                kTabBarSelectImageName:@"ico_home_index"},
                              @{kTabBarImageName:@"ico_home_order_g",
                                kViewControllerClassName: @"OrderVC",
                                kTabBarTitleName:@"订单",
                                kTabBarSelectImageName:@"ico_home_order"},
                              @{kTabBarImageName:@"ico_home_me_g",
                                kViewControllerClassName: @"MyVC",
                                kTabBarTitleName:@"我的",
                                kTabBarSelectImageName:@"ico_home_me"}
                              ];
    NSMutableArray *viewControllers = [NSMutableArray array];
    for (NSDictionary *dict in elementArray) {
        UIViewController *viewController = [NSClassFromString(dict[kViewControllerClassName]) new];
        MallShopMerchantsNC *NC = [[MallShopMerchantsNC alloc]initWithRootViewController:viewController];
        UITabBarItem *tabBarItem = NC.tabBarItem;
        tabBarItem.imageInsets = UIEdgeInsetsMake(0, 0, 0, 0);
        tabBarItem.titlePositionAdjustment = UIOffsetMake(0, -3);
        tabBarItem.title = dict[kTabBarTitleName];
        tabBarItem.image = [[UIImage imageNamed:dict[kTabBarImageName]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        tabBarItem.selectedImage = [[UIImage imageNamed:dict[kTabBarSelectImageName]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        [viewControllers addObject:NC];
    }
    UIView *tabBarBG = [[UIView alloc]initWithFrame:self.tabBar.bounds];
    tabBarBG.backgroundColor = [UIColor colorWithHexString:@"ffffff"];
    [self.tabBar insertSubview:tabBarBG atIndex:0];
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor colorWithHexString:@"999999"],NSFontAttributeName:[UIFont systemFontOfSize:10]} forState:UIControlStateNormal];
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor colorWithHexString:@"00C869"],NSFontAttributeName:[UIFont systemFontOfSize:10]} forState:UIControlStateSelected];
    self.viewControllers = viewControllers;
    self.selectedIndex = 2;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

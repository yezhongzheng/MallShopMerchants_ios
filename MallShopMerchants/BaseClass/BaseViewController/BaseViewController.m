//
//  BaseViewController.m
//  MallShopMerchants
//
//  Created by zl on 2019/5/5.
//  Copyright © 2019 yezhongzheng. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@property(nonatomic,copy) void (^leftBarActionBlock)(void);
@property(nonatomic,copy) void (^rightBarActionBlock)(void);

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.edgesForExtendedLayout = UIRectEdgeNone;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
}

- (void)setMainNavigationController
{
    self.navigationController.navigationBar.translucent = NO;
    [self.navigationController.navigationBar setBackgroundImage:[UIColor imageWithColor:[UIColor colorWithHexString:@"ffffff"]] forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.shadowImage = [UIColor imageWithColor:[UIColor colorWithHexString:@"f6f6f6"]];
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:[UIColor colorWithHexString:@"000000"],NSFontAttributeName:[UIFont fontWithName:@"PingFangSC-Regular" size:17]}; //标题颜色
}

- (void)setClearColorNavigationController
{
    self.navigationController.navigationBar.translucent = YES;
    [self.navigationController.navigationBar setBackgroundImage:[UIColor imageWithColor:[UIColor clearColor]] forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.shadowImage = [UIColor imageWithColor:[UIColor clearColor]];
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:[UIColor colorWithHexString:@"ffffff"], NSFontAttributeName:[UIFont fontWithName:@"PingFangSC-Regular" size:17]};
}

- (void)addBackButton
{
    __weak typeof(self)weakSelf = self;
    [self addLeftButtonWithImage:[UIImage imageNamed:@""] actionBlock:^{
        __strong typeof(weakSelf) strongSelf = weakSelf;
        [strongSelf.navigationController popViewControllerAnimated:YES];
    }];
    self.navigationItem.backBarButtonItem.style = UITableViewRowActionStyleDestructive;
}

- (void)addLeftButtonWithImage:(UIImage *)image actionBlock:(void(^)(void))block
{
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftButton setFrame:CGRectMake(0, 0, 40, 20)];
    [leftButton setImage:image forState:UIControlStateNormal];
    [leftButton setImageEdgeInsets:UIEdgeInsetsMake(0, -25, 0, 0)];
    [leftButton addTarget:self action:@selector(leftBar_Touched:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftButton];
    self.leftBarActionBlock = block;
    self.navigationItem.leftBarButtonItem = barButtonItem;
}

- (void)leftBar_Touched:(id)sender
{
    if (self.leftBarActionBlock) {
        self.leftBarActionBlock();
    }
}

- (void)addRightButtonWithImage:(UIImage *)image actionBlock:(void(^)(void))block
{
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightButton setFrame:CGRectMake(0, 0, 25, 25)];
    [rightButton setImage:image forState:UIControlStateNormal];
    [rightButton addTarget:self action:@selector(rightBar_Touched:) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightButton];
    self.rightBarActionBlock = block;
    self.navigationItem.rightBarButtonItem = rightBarButtonItem;
}

- (void)addRightButtonWithTitle:(NSString *)title actionBlock:(void(^)(void))block
{
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightButton setFrame:CGRectMake(0, 0, 60, 30)];
    rightButton.titleLabel.font = [UIFont boldSystemFontOfSize:15];
    [rightButton setTitle:title forState:UIControlStateNormal];
    [rightButton addTarget:self action:@selector(rightBar_Touched:) forControlEvents:UIControlEventTouchUpInside];
    [rightButton setTitleColor:[UIColor colorWithHexString:@"04b4fd"] forState:UIControlStateNormal];
    UIBarButtonItem *rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightButton];
    self.rightBarActionBlock = block;
    self.navigationItem.rightBarButtonItem = rightBarButtonItem;
}

- (void)addLeftButtonWithTitle:(NSString *)title actionBlock:(void(^)(void))block
{
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftButton setFrame:CGRectMake(0, 0, 60, 30)];
    leftButton.titleLabel.font = [UIFont boldSystemFontOfSize:15];
    [leftButton setTitle:title forState:UIControlStateNormal];
    [leftButton addTarget:self action:@selector(leftBar_Touched:) forControlEvents:UIControlEventTouchUpInside];
    [leftButton setTitleColor:[UIColor colorWithHexString:@"04b4fd"] forState:UIControlStateNormal];
    UIBarButtonItem *leftButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftButton];
    self.leftBarActionBlock = block;
    self.navigationItem.leftBarButtonItem = leftButtonItem;
}

- (void)rightBar_Touched:(id)sender
{
    if (self.rightBarActionBlock) {
        self.rightBarActionBlock();
    }
}

@end

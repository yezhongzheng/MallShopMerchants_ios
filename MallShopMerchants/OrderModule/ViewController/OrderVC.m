//
//  OrderVC.m
//  MallShopMerchants
//
//  Created by zl on 2019/5/5.
//  Copyright © 2019 yezhongzheng. All rights reserved.
//

#import "OrderVC.h"
#import "SearchVC.h"
#import "PaymentHasBeenVC.h"
#import "ProcessingVC.h"
#import "HadFinishVC.h"
#import "InvalidOrderVC.h"
#import "OrderOptionView.h"

@interface OrderVC () <UIPageViewControllerDataSource, UIPageViewControllerDelegate, UISearchControllerDelegate, UISearchBarDelegate>

@property (nonatomic, strong) OrderOptionView *optionView;
@property (nonatomic, strong) UIView *titleView;
@property (nonatomic, strong) UIImageView *searchIcon;
@property (nonatomic, strong) UILabel *searchTipLabel;
@property (nonatomic, strong) UIButton *searchButton;
@property (nonatomic, strong) UIPageViewController *pageVC;
@property (nonatomic, strong) NSArray <BaseViewController *>*datasource;
@property (nonatomic, strong) UIViewController *pendVC;
@property (nonatomic, assign) NSInteger currentIndex;

@end

@implementation OrderVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setUI];
 
    [self addChildViewController:self.pageVC];
    [self.view addSubview:self.pageVC.view];
    [self.pageVC.view setFrame:CGRectMake(0, kSixScreen(38), kScreenWidth, self.view.bounds.size.height - kSixScreen(38))];
    [self.pageVC didMoveToParentViewController:self];
    self.currentIndex = 0;
    BaseViewController *vc = self.datasource[self.currentIndex];
    [self.pageVC setViewControllers:@[vc] direction:UIPageViewControllerNavigationDirectionReverse animated:YES completion:^(BOOL finished) {

    }];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self setMainNavigationController];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)setUI
{
    self.view.backgroundColor = [UIColor colorWithHexString:@"ffffff"];
    self.navigationItem.titleView = self.titleView;
    [self.titleView addSubview:self.searchIcon];
    [self.titleView addSubview:self.searchTipLabel];
    [self.titleView addSubview:self.searchButton];
    [self.searchIcon setFrame:CGRectMake(kSixScreen(11), kSixScreen(10), kSixScreen(10), kSixScreen(10))];
    [self.searchTipLabel setFrame:CGRectMake(kSixScreen(27), kSixScreen(5), kSixScreen(150), kSixScreen(20))];
    [self.searchButton setFrame:self.titleView.bounds];
    [self.view addSubview:self.optionView];
    [self.view bringSubviewToFront:self.optionView];
}

#pragma mark - Button Action
- (void)searchButtonDidClick:(UIButton *)sender
{
    SearchVC *searchVC = [[SearchVC alloc] init];
    [self.navigationController pushViewController:searchVC animated:YES];
}

#pragma mark - UIPageViewControllerDataSource
- (nullable UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    NSInteger before = self.currentIndex - 1;
    if (before < 0) {
        return nil;
    }
    return self.datasource[before];
}

- (nullable UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    NSInteger after = self.currentIndex + 1;
    if (after >= self.datasource.count) {
        return nil;
    }
    return self.datasource[after];
}

#pragma mark - UIPageViewControllerDelegate
- (void)pageViewController:(UIPageViewController *)pageViewController willTransitionToViewControllers:(NSArray<UIViewController *> *)pendingViewControllers
{
    self.pendVC = pendingViewControllers.firstObject;
}

- (void)pageViewController:(UIPageViewController *)pageViewController didFinishAnimating:(BOOL)finished previousViewControllers:(NSArray<UIViewController *> *)previousViewControllers transitionCompleted:(BOOL)completed
{
    [self.datasource enumerateObjectsUsingBlock:^(BaseViewController * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (obj == self.pendVC) {
            self.currentIndex = idx;
            [self.optionView orderOptionViewScrollToButtonIndex:(int)idx];
        }
    }];
}

- (UIInterfaceOrientationMask)pageViewControllerSupportedInterfaceOrientations:(UIPageViewController *)pageViewController
{
    return UIInterfaceOrientationMaskAllButUpsideDown;
}

- (UIInterfaceOrientation)pageViewControllerPreferredInterfaceOrientationForPresentation:(UIPageViewController *)pageViewController
{
    return UIInterfaceOrientationLandscapeRight | UIDeviceOrientationLandscapeLeft;
}

#pragma mark - Lazy
- (UIPageViewController *)pageVC
{
    if (!_pageVC) {
        NSDictionary *options = [NSDictionary dictionaryWithObject:[NSNumber numberWithInteger:0] forKey:UIPageViewControllerOptionInterPageSpacingKey];
        self.pageVC = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:options];
        self.pageVC.delegate = self;
        self.pageVC.dataSource = self;
    }
    return _pageVC;
}

- (UIView *)titleView
{
    if (!_titleView) {
        self.titleView = [ComponentTools createViewWithBackgroundColor:[UIColor colorWithHexString:@"F9F9F9"]];
        [self.titleView setFrame:CGRectMake(0, 0, kScreenWidth - kSixScreen(15) * 2, kSixScreen(30))];
        self.titleView.layer.masksToBounds = YES;
        self.titleView.layer.cornerRadius = kSixScreen(12);
        
    }
    return _titleView;
}

- (UIImageView *)searchIcon
{
    if (!_searchIcon) {
        self.searchIcon = [ComponentTools createImageViewWithImage:[UIImage imageNamed:@"ico_index_search"]];
    }
    return _searchIcon;
}

- (UILabel *)searchTipLabel
{
    if (!_searchTipLabel) {
        self.searchTipLabel = [ComponentTools createLabelWithFont:[UIFont fontWithName:@"PingFangSC-Regular" size:kSixScreen(11)] backgroundColor:[UIColor clearColor] textColor:[UIColor colorWithHexString:@"7D8087"] numberOfLines:0 textAlignment:NSTextAlignmentLeft text:@"输入您的手机或订单号查询"];
    }
    return _searchTipLabel;
}

- (UIButton *)searchButton
{
    if (!_searchButton) {
        self.searchButton = [ComponentTools createButtonWithFont:[UIFont systemFontOfSize:0] buttonType:UIButtonTypeCustom titleColor:[UIColor clearColor] title:@""];
        [self.searchButton addTarget:self action:@selector(searchButtonDidClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _searchButton;
}

- (NSArray<BaseViewController *> *)datasource
{
    if (!_datasource) {
        PaymentHasBeenVC *paymentVC = [[PaymentHasBeenVC alloc] init];
        ProcessingVC *processVC = [[ProcessingVC alloc] init];
        HadFinishVC *finishVC = [[HadFinishVC alloc] init];
        InvalidOrderVC *invalidOrderVC = [[InvalidOrderVC alloc] init];
        self.datasource = @[paymentVC, processVC, finishVC, invalidOrderVC];
    }
    return _datasource;
}

- (OrderOptionView *)optionView
{
    if (!_optionView) {
        self.optionView = [[OrderOptionView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kSixScreen(38))];
        self.optionView.backgroundColor = [UIColor whiteColor];
        [self.optionView setTitles:@[@"已付款", @"处理中", @"已完成", @"无效订单"]];
        __weak typeof(self) weakSelf = self;
        [self.optionView setDidSelectIndexBlock:^(NSInteger index) {
            weakSelf.currentIndex = index;
            BaseViewController *vc = weakSelf.datasource[weakSelf.currentIndex];
            [weakSelf.pageVC setViewControllers:@[vc] direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:^(BOOL finished) {
                
            }];
        }];
    }
    return _optionView;
}

@end

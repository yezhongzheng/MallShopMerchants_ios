//
//  OrderVC.m
//  MallShopMerchants
//
//  Created by zl on 2019/5/5.
//  Copyright © 2019 yezhongzheng. All rights reserved.
//

#import "ReportVC.h"
#import "SearchVC.h"
#import "ReportListVC.h"
#import "OrderOptionView.h"

@interface ReportVC () <UIPageViewControllerDataSource, UIPageViewControllerDelegate, UISearchControllerDelegate, UISearchBarDelegate>

@property (nonatomic, strong) OrderOptionView *optionView;
@property (nonatomic, strong) UIPageViewController *pageVC;
@property (nonatomic, strong) NSMutableArray <BaseViewController *>*datasource;
@property (nonatomic, strong) UIViewController *pendVC;
@property (nonatomic, assign) NSInteger currentIndex;

@end

@implementation ReportVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"经营报表";
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
    [self addBackButton];
    [self setMainNavigationController];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)setUI
{
    self.view.backgroundColor = [UIColor colorWithHexString:@"ffffff"];
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
//前滚
- (nullable UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    NSInteger before = self.currentIndex - 1;
    if (before < 0) {
        return nil;
    }
    return self.datasource[before];
}
//后滚
- (nullable UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    NSInteger after = self.currentIndex + 1;
    if (after >= self.datasource.count) {
        return nil;
    }
    return self.datasource[after];
}

#pragma mark - UIPageViewControllerDelegate
//开始滚动
- (void)pageViewController:(UIPageViewController *)pageViewController willTransitionToViewControllers:(NSArray<UIViewController *> *)pendingViewControllers
{
    self.pendVC = pendingViewControllers.firstObject;
}

//结束滚动
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


- (NSMutableArray<BaseViewController *> *)datasource
{
    if (!_datasource) {
        self.datasource = [[NSMutableArray alloc]init];
        for (int i=0; i<5; i++) {
            ReportListVC *vc = [[ReportListVC alloc] init];
            vc.payId = i;
            [self.datasource addObject:vc];
        }
    }
    return _datasource;
}

- (OrderOptionView *)optionView
{
    if (!_optionView) {
        self.optionView = [[OrderOptionView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kSixScreen(38))];
        self.optionView.backgroundColor = [UIColor whiteColor];
        [self.optionView setTitles:@[@"今日", @"昨日", @"近七天", @"近三十天",@"累计"]];
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

//
//  HomePageVC.m
//  MallShopMerchants
//
//  Created by zl on 2019/5/5.
//  Copyright © 2019 yezhongzheng. All rights reserved.
//

#import "HomePageVC.h"
#import "HomePageShopManageCell.h"
#import "LoginViewController.h"
#import "HomePageSerivce.h"
#import "UserInfoItems.h"
#import "MyWalletVC.h"
#import "ReportVC.h"

@interface HomePageVC () <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UIView *navigationView;
@property (nonatomic, strong) UILabel *shopNameLabel;
@property (nonatomic, strong) UIImageView *pullIcon;
@property (nonatomic, strong) UIButton *messageButton;
@property (nonatomic, strong) UIButton *scannerButton;
@property (nonatomic, strong) UILabel *paidKeyAmountLabel;
@property (nonatomic, strong) UILabel *paidValueAmountLabel;
@property (nonatomic, strong) UILabel *orderKeyCountLabel;
@property (nonatomic, strong) UILabel *orderValueCountLabel;
@property (nonatomic, strong) UILabel *paidKeyCountLabel;
@property (nonatomic, strong) UILabel *paidValueCountLabel;
@property (nonatomic, strong) UIView *diliverView;
@property (nonatomic, strong) UICollectionViewFlowLayout *layout;
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) UIView *layoutView;
@property (nonatomic, strong) UIView *cornerView;
@property (nonatomic, strong) UIImageView *shopManageIcon;
@property (nonatomic, strong) NSArray *datasource;

@end

@implementation HomePageVC

- (BOOL)prefersStatusBarHidden
{
    return NO;
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setUI];
    LCAccount *account = [LCAccount sharedInstance];
    if([NSString isEmptyString:account.accesstoken]){
        LoginViewController *login = [[LoginViewController alloc]init];
        MallShopMerchantsNC *nav = [[MallShopMerchantsNC alloc]initWithRootViewController:login];
        [self presentViewController:nav animated:NO completion:^{
            
        }];
    }else{
        [self getSuppeilerInfoData];
    }
}

-(void)getSuppeilerInfoData{
    [HomePageSerivce getSupplierInfoWithParam:@{} successfulBlock:^(NSArray * _Nonnull responseObject, double timeStamp) {
        UserInfoItems *items = responseObject.firstObject;
        if(items.ret_code.integerValue){
            UserInfoItem *item = items.data;
            [self SetDataViewModel:item];
        }
    } failedBlock:^(NSString * _Nonnull errDescription, NSInteger errCode) {
        
    }];
}

-(void)SetDataViewModel:(UserInfoItem *)model{
    self.paidValueAmountLabel.text = model.stats.order_amount;
    self.orderValueCountLabel.text = model.stats.order_count;
    self.paidValueCountLabel.text = model.stats.member_count;
    self.shopNameLabel.text = model.supplier_name;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:NO];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:NO];
}

- (void)setUI
{
    self.view.backgroundColor = [UIColor colorWithHexString:@"ffffff"];
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.frame = self.view.bounds;
    gradientLayer.startPoint = CGPointMake(0, 0);
    gradientLayer.endPoint = CGPointMake(0, 1);
    gradientLayer.locations = @[@(0.3), @(0.9)];
    gradientLayer.colors = @[(__bridge id)[UIColor colorWithHexString:@"#C6A15E"].CGColor, (__bridge id)[[UIColor colorWithHexString:@"#D9C39D"] colorWithAlphaComponent:0.1].CGColor];
    [self.view.layer insertSublayer:gradientLayer atIndex:0];
    [self.view addSubview:self.navigationView];
    [self.navigationView addSubview:self.shopNameLabel];
    [self.navigationView addSubview:self.pullIcon];
    [self.navigationView addSubview:self.messageButton];
    [self.navigationView addSubview:self.scannerButton];
    [self.view addSubview:self.paidKeyAmountLabel];
    [self.view addSubview:self.paidValueAmountLabel];
    [self.view addSubview:self.orderKeyCountLabel];
    [self.view addSubview:self.orderValueCountLabel];
    [self.view addSubview:self.diliverView];
    [self.view addSubview:self.paidKeyCountLabel];
    [self.view addSubview:self.paidValueCountLabel];
    [self.view addSubview:self.layoutView];
    [self.layoutView addSubview:self.cornerView];
    [self.cornerView addSubview:self.collectionView];
    [self.layoutView addSubview:self.shopManageIcon];
    __weak typeof(self) weakSelf = self;
    [self.navigationView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.mas_equalTo(weakSelf.view);
        make.height.mas_equalTo(kStatusBarHeight + 44);
    }];
    [self.shopNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(weakSelf.navigationView.mas_left).with.mas_offset(kSixScreen(10));
        make.top.mas_equalTo(kStatusBarHeight + 9);
        make.height.mas_equalTo(kSixScreen(24));
    }];
    [self.pullIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(weakSelf.shopNameLabel.mas_centerY);
        make.left.mas_equalTo(weakSelf.shopNameLabel.mas_right).with.mas_offset(kSixScreen(8));
        make.size.mas_equalTo(CGSizeMake(kSixScreen(13), kSixScreen(7)));
    }];
    [self.messageButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(kSixScreen(21), kSixScreen(19)));
        make.centerY.mas_equalTo(weakSelf.shopNameLabel.mas_centerY);
        make.right.mas_equalTo(weakSelf.scannerButton.mas_left).with.mas_offset(kSixScreen(-16));
    }];
    [self.scannerButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(weakSelf.shopNameLabel.mas_centerY);
        make.right.mas_equalTo(weakSelf.navigationView.mas_right).with.mas_offset(kSixScreen(-10));
        make.size.mas_equalTo(CGSizeMake(kSixScreen(19), kSixScreen(19)));
    }];
    [self.paidKeyAmountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(weakSelf.view.mas_centerX);
        make.top.mas_equalTo(weakSelf.navigationView.mas_bottom).with.mas_offset(kSixScreen(20));
        make.height.mas_equalTo(kSixScreen(20));
    }];
    [self.paidValueAmountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(weakSelf.view.mas_centerX);
        make.top.mas_equalTo(weakSelf.paidKeyAmountLabel.mas_bottom).with.mas_offset(kSixScreen(5));
        make.height.mas_equalTo(kSixScreen(30));
    }];
    [self.orderValueCountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(weakSelf.view.mas_left);
        make.right.mas_equalTo(weakSelf.diliverView.mas_left);
        make.centerY.mas_equalTo(weakSelf.diliverView.mas_centerY);
    }];
    [self.orderKeyCountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf.orderValueCountLabel.mas_bottom).with.mas_offset(kSixScreen(5));
        make.width.mas_equalTo(weakSelf.orderValueCountLabel.mas_width);
        make.centerX.mas_equalTo(weakSelf.orderKeyCountLabel.mas_centerX);
    }];
    [self.diliverView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf.paidValueAmountLabel.mas_bottom).with.mas_offset(kSixScreen(20));
        make.height.mas_equalTo(kSixScreen(13));
        make.width.mas_equalTo(kSixScreen(1));
        make.centerX.mas_equalTo(weakSelf.view.mas_centerX);
    }];
    [self.paidValueCountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(weakSelf.diliverView.mas_right);
        make.right.mas_equalTo(weakSelf.view.mas_right);
        make.centerY.mas_equalTo(weakSelf.diliverView.mas_centerY);
    }];
    [self.paidKeyCountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.width.mas_equalTo(weakSelf.paidValueCountLabel.mas_width);
        make.centerX.mas_equalTo(weakSelf.paidValueCountLabel.mas_centerX);
        make.centerY.mas_equalTo(weakSelf.orderKeyCountLabel.mas_centerY);
    }];
    [self.layoutView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(weakSelf.view.mas_left).with.mas_offset(kSixScreen(17));
        make.right.mas_equalTo(weakSelf.view.mas_right).with.mas_offset(kSixScreen(-17));
        make.top.mas_equalTo(weakSelf.paidKeyCountLabel.mas_bottom).with.mas_offset(kSixScreen(27));
        make.height.mas_equalTo(kSixScreen(335));
    }];
    [self.cornerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(weakSelf.layoutView.mas_left);
        make.right.mas_equalTo(weakSelf.layoutView.mas_right);
        make.top.mas_equalTo(weakSelf.layoutView.mas_top).with.mas_offset(kSixScreen(7));
        make.bottom.mas_equalTo(weakSelf.layoutView.mas_bottom);
    }];
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(weakSelf.cornerView);
    }];
    [self.shopManageIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(kSixScreen(149), kSixScreen(38)));
        make.top.mas_equalTo(weakSelf.layoutView.mas_top);
        make.centerX.mas_equalTo(weakSelf.layoutView.mas_centerX);
    }];
}

#pragma mark - UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"----%f", (collectionView.bounds.size.width - kSixScreen(1)) / 2.0f);
    return CGSizeMake((collectionView.bounds.size.width - kSixScreen(1)) / 2.0f, (collectionView.bounds.size.height - kSixScreen(1) * 2) / 3.0f);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsZero;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return kSixScreen(1);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    return CGSizeZero;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section
{
    return CGSizeZero;
}

#pragma mark - UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
    if(indexPath.row == 0){
        ReportVC *vc = [[ReportVC alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }else if(indexPath.row == 5){
        MyWalletVC *vc = [[MyWalletVC alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.datasource.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    HomePageShopManageCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:IDHomePageShopManageCell forIndexPath:indexPath];
    [cell setShopManageCellWithImageName:self.datasource[indexPath.item] labelName:self.datasource[indexPath.item]];
    return cell;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    if (kind == UICollectionElementKindSectionHeader) {
        UICollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"IDHeaderView" forIndexPath:indexPath];
        return headerView;
    } else {
        UICollectionReusableView *footerView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"IDFooterView" forIndexPath:indexPath];
        return footerView;
    }
}

- (void)messageButtonDidClick:(UIButton *)sender
{
    
}

- (void)scannerButtonDidClick:(UIButton *)sender
{
    
}

#pragma mark - Lazy
- (UICollectionViewFlowLayout *)layout
{
    if (!_layout) {
        self.layout = [[UICollectionViewFlowLayout alloc] init];
        self.layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    }
    return _layout;
}

- (UICollectionView *)collectionView
{
    if (!_collectionView) {
        self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:self.layout];
        self.collectionView.backgroundColor = [UIColor clearColor];
        self.collectionView.delegate = self;
        self.collectionView.dataSource = self;
        self.collectionView.showsVerticalScrollIndicator = NO;
        self.collectionView.showsHorizontalScrollIndicator = NO;
        [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"IDHeaderView"];
        [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"IDFooterView"];
        [self.collectionView registerClass:[HomePageShopManageCell class] forCellWithReuseIdentifier:IDHomePageShopManageCell];
    }
    return _collectionView;
}

- (UIView *)navigationView
{
    if (!_navigationView) {
        self.navigationView = [ComponentTools createViewWithBackgroundColor:[UIColor colorWithHexString:@"C6A15E"]];
    }
    return _navigationView;
}

- (UILabel *)shopNameLabel
{
    if (!_shopNameLabel) {
        self.shopNameLabel = [ComponentTools createLabelWithFont:[UIFont fontWithName:@"PingFangSC-Medium" size:kSixScreen(17)] backgroundColor:[UIColor clearColor] textColor:[UIColor colorWithHexString:@"ffffff"] numberOfLines:0 textAlignment:NSTextAlignmentLeft text:@""];
    }
    return _shopNameLabel;
}

- (UIImageView *)pullIcon
{
    if (!_pullIcon) {
        self.pullIcon = [ComponentTools createImageViewWithImage:[UIImage imageNamed:@""]];
    }
    return _pullIcon;
}

- (UIButton *)messageButton
{
    if (!_messageButton) {
        self.messageButton = [ComponentTools createButtonWithFont:[UIFont systemFontOfSize:0] buttonType:UIButtonTypeCustom titleColor:[UIColor clearColor] title:@""];
        [self.messageButton setImage:[UIImage imageNamed:@"ico_news_no"] forState:UIControlStateNormal];
        [self.messageButton addTarget:self action:@selector(messageButtonDidClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _messageButton;
}

- (UIButton *)scannerButton
{
    if (!_scannerButton) {
        self.scannerButton = [ComponentTools createButtonWithFont:[UIFont systemFontOfSize:0] buttonType:UIButtonTypeCustom titleColor:[UIColor clearColor] title:@""];
        [self.scannerButton setImage:[UIImage imageNamed:@"ico_index_sweep"] forState:UIControlStateNormal];
        [self.scannerButton addTarget:self action:@selector(scannerButtonDidClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _scannerButton;
}

- (UILabel *)paidKeyAmountLabel
{
    if (!_paidKeyAmountLabel) {
        self.paidKeyAmountLabel = [ComponentTools createLabelWithFont:[UIFont fontWithName:@"PingFangSC-Light" size:kSixScreen(14)] backgroundColor:[UIColor clearColor] textColor:[UIColor colorWithHexString:@"ffffff"] numberOfLines:0 textAlignment:NSTextAlignmentCenter text:@"今日实收金额(元)"];
    }
    return _paidKeyAmountLabel;
}

- (UILabel *)paidValueAmountLabel
{
    if (!_paidValueAmountLabel) {
        self.paidValueAmountLabel = [ComponentTools createLabelWithFont:[UIFont fontWithName:@"DINAlternate-Bold" size:kSixScreen(30)] backgroundColor:[UIColor clearColor] textColor:[UIColor colorWithHexString:@"ffffff"] numberOfLines:0 textAlignment:NSTextAlignmentCenter text:@"0.00"];
    }
    return _paidValueAmountLabel;
}

- (UILabel *)orderValueCountLabel
{
    if (!_orderValueCountLabel) {
        self.orderValueCountLabel = [ComponentTools createLabelWithFont:[UIFont fontWithName:@"DINAlternate-Bold" size:kSixScreen(22)] backgroundColor:[UIColor clearColor] textColor:[UIColor colorWithHexString:@"ffffff"] numberOfLines:0 textAlignment:NSTextAlignmentCenter text:@"0"];
    }
    return _orderValueCountLabel;
}

- (UILabel *)orderKeyCountLabel
{
    if (!_orderKeyCountLabel) {
        self.orderKeyCountLabel = [ComponentTools createLabelWithFont:[UIFont fontWithName:@"PingFangSC-Light" size:kSixScreen(14)] backgroundColor:[UIColor clearColor] textColor:[UIColor colorWithHexString:@"ffffff"] numberOfLines:0 textAlignment:NSTextAlignmentCenter text:@"订单数(单)"];
    }
    return _orderKeyCountLabel;
}

- (UIView *)diliverView
{
    if (!_diliverView) {
        self.diliverView = [ComponentTools createViewWithBackgroundColor:[UIColor whiteColor]];
    }
    return _diliverView;
}

- (UILabel *)paidValueCountLabel
{
    if (!_paidValueCountLabel) {
        self.paidValueCountLabel = [ComponentTools createLabelWithFont:[UIFont fontWithName:@"DINAlternate-Bold" size:kSixScreen(22)] backgroundColor:[UIColor clearColor] textColor:[UIColor colorWithHexString:@"ffffff"] numberOfLines:0 textAlignment:NSTextAlignmentCenter text:@"0"];
    }
    return _paidValueCountLabel;
}

- (UILabel *)paidKeyCountLabel
{
    if (!_paidKeyCountLabel) {
        self.paidKeyCountLabel = [ComponentTools createLabelWithFont:[UIFont fontWithName:@"PingFangSC-Light" size:kSixScreen(14)] backgroundColor:[UIColor clearColor] textColor:[UIColor colorWithHexString:@"ffffff"] numberOfLines:0 textAlignment:NSTextAlignmentCenter text:@"付款人数(人)"];
    }
    return _paidKeyCountLabel;
}

- (UIView *)layoutView
{
    if (!_layoutView) {
        self.layoutView = [ComponentTools createViewWithBackgroundColor:[UIColor clearColor]];
    }
    return _layoutView;
}

- (UIView *)cornerView
{
    if (!_cornerView) {
        self.cornerView = [ComponentTools createViewWithBackgroundColor:[UIColor colorWithHexString:@"F6F6F6"]];
        self.cornerView.layer.masksToBounds = YES;
        self.cornerView.layer.cornerRadius = kSixScreen(10);
        self.cornerView.layer.shadowOffset = CGSizeMake(0, kSixScreen(2));
        self.cornerView.layer.shadowColor = [UIColor colorWithHexString:@"5E7360"].CGColor;
        self.cornerView.layer.shadowOpacity = kSixScreen(1);
        self.cornerView.layer.shadowRadius = kSixScreen(2);
    }
    return _cornerView;
}

- (NSArray *)datasource
{
    if (!_datasource) {
        self.datasource = @[@"经营报表", @"到账记录", @"商品管理", @"分类管理", @"收款码", @"我的钱包"];
    }
    return _datasource;
}

- (UIImageView *)shopManageIcon
{
    if (!_shopManageIcon) {
        self.shopManageIcon = [ComponentTools createImageViewWithImage:[UIImage imageNamed:@"店铺管理"]];
        [self.shopManageIcon setContentMode:UIViewContentModeScaleAspectFit];
    }
    return _shopManageIcon;
}

@end

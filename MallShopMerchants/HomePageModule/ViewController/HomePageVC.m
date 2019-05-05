//
//  HomePageVC.m
//  MallShopMerchants
//
//  Created by zl on 2019/5/5.
//  Copyright © 2019 yezhongzheng. All rights reserved.
//

#import "HomePageVC.h"

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
    gradientLayer.locations = @[@(0.3), @(0.5), @(1)];
    gradientLayer.colors = @[(__bridge id)[UIColor colorWithHexString:@"#C6A15E"].CGColor, (__bridge id)[UIColor colorWithHexString:@"#D9C39D"].CGColor];
    [self.view.layer insertSublayer:gradientLayer atIndex:0];
    [self.view addSubview:self.navigationView];
    [self.navigationView addSubview:self.shopNameLabel];
    [self.navigationView addSubview:self.pullIcon];
    [self.navigationView addSubview:self.messageButton];
    [self.navigationView addSubview:self.scannerButton];
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
}

#pragma mark - UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeZero;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsZero;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
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
    
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.datasource.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return nil;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    if (kind == UICollectionElementKindSectionHeader) {
        
        return nil;
    } else {
        UICollectionReusableView *footerView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"IDMediatorToWithdrawFooter" forIndexPath:indexPath];
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
        self.collectionView.backgroundColor = [UIColor colorWithHexString:@"ffffff"];
        self.collectionView.delegate = self;
        self.collectionView.dataSource = self;
        self.collectionView.showsVerticalScrollIndicator = NO;
        self.collectionView.showsHorizontalScrollIndicator = NO;
        [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HeaderView"];
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
        self.shopNameLabel = [ComponentTools createLabelWithFont:[UIFont fontWithName:@"PingFangSC-Medium" size:kSixScreen(17)] backgroundColor:[UIColor clearColor] textColor:[UIColor colorWithHexString:@"ffffff"] numberOfLines:0 textAlignment:NSTextAlignmentLeft text:@"EVISU潮牌店(东信大道店)"];
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
        [self.messageButton setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
        [self.messageButton addTarget:self action:@selector(messageButtonDidClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _messageButton;
}

- (UIButton *)scannerButton
{
    if (!_scannerButton) {
        self.scannerButton = [ComponentTools createButtonWithFont:[UIFont systemFontOfSize:0] buttonType:UIButtonTypeCustom titleColor:[UIColor clearColor] title:@""];
        [self.scannerButton setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
        [self.scannerButton addTarget:self action:@selector(scannerButtonDidClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _scannerButton;
}

- (UILabel *)paidKeyCountLabel
{
    if (!_paidKeyCountLabel) {
        self.paidKeyCountLabel = [ComponentTools createLabelWithFont:[UIFont fontWithName:@"PingFangSC-Light" size:kSixScreen(14)] backgroundColor:[UIColor clearColor] textColor:[UIColor colorWithHexString:@"ffffff"] numberOfLines:0 textAlignment:NSTextAlignmentCenter text:@"今日实收金额(元)"];
    }
    return _paidKeyCountLabel;
}

- (UILabel *)paidValueCountLabel
{
    if (!_paidValueCountLabel) {
        self.paidValueCountLabel = [ComponentTools createLabelWithFont:[UIFont fontWithName:@"DINAlternate-Bold" size:kSixScreen(30)] backgroundColor:[UIColor clearColor] textColor:[UIColor colorWithHexString:@"ffffff"] numberOfLines:0 textAlignment:NSTextAlignmentCenter text:@"0.00"];
    }
    return _paidValueCountLabel;
}

@end

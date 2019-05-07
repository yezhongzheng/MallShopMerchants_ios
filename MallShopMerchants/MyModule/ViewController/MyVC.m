//
//  MyVC.m
//  MallShopMerchants
//
//  Created by zl on 2019/5/5.
//  Copyright © 2019 yezhongzheng. All rights reserved.
//

#import "MyVC.h"
#import "MyItemCell.h"
#import "MyItemModel.h"

@interface MyVC () <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UICollectionViewFlowLayout *layout;
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) NSArray *datasource;

@end

@implementation MyVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
    self.view.backgroundColor = [UIColor colorWithHexString:@"f6f6f6"];
    [self.view addSubview:self.collectionView];
    __weak typeof(self) weakSelf = self;
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf.view).with.mas_offset(-kStatusBarHeight);
        make.left.right.bottom.mas_equalTo(weakSelf.view);
    }];
}

#pragma mark - UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return CGSizeMake(kScreenWidth / 3.0, kSixScreen(88));
    }
    return CGSizeMake(kScreenWidth, kSixScreen(53));
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
    if (section == 0) {
       return CGSizeMake(kScreenWidth, kSixScreen(148) + kStatusBarHeight);
    } else {
        return CGSizeMake(kScreenWidth, kSixScreen(10));
    }
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section
{
    return CGSizeZero;
}

#pragma mark - UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
    if (indexPath.section == 0) {
        
    } else {
        NSArray *temArr = self.datasource[indexPath.section];
        MyItemModel *voiceModel = temArr[indexPath.item];
        if ([voiceModel.imageName isEqualToString:@"btn_off"]) {
            voiceModel.imageName = @"btn_open";
        } else {
            voiceModel.imageName = @"btn_off";
        }
        [collectionView reloadSections:[NSIndexSet indexSetWithIndex:indexPath.section]];
    }
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    NSArray *temArray = self.datasource[section];
    return temArray.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    MyItemCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:IDMyItemCell forIndexPath:indexPath];
    for (UIView *view in cell.contentView.subviews) {
        [view removeFromSuperview];
    }
    NSArray *temArr = self.datasource[indexPath.section];
    MyItemModel *itemModel = temArr[indexPath.item];
    [cell setMyItemModel:itemModel indexPath:indexPath];
    return cell;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return self.datasource.count;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    if (kind == UICollectionElementKindSectionHeader) {
        UICollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"IDHeader" forIndexPath:indexPath];
        if (indexPath.section == 0) {
            headerView.backgroundColor = [UIColor whiteColor];
            UIImageView *mybg = [ComponentTools createImageViewWithImage:[UIImage imageNamed:@"me_bg"]];
            UIImageView *mepichead = [ComponentTools createImageViewWithImage:[UIImage imageNamed:@"me_pic_head"]];
            UILabel *shopNameLabel = [ComponentTools createLabelWithFont:[UIFont fontWithName:@"PingFangSC-Medium" size:kSixScreen(19)] backgroundColor:[UIColor clearColor] textColor:[UIColor colorWithHexString:@"333333"] numberOfLines:0 textAlignment:NSTextAlignmentCenter text:@"lining潮牌店(NO.04)"];
            [headerView addSubview:mybg];
            [headerView addSubview:mepichead];
            [headerView addSubview:shopNameLabel];
            [mybg mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.left.right.mas_equalTo(headerView);
                make.height.mas_equalTo(kSixScreen(107));
            }];
            [mepichead mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerX.mas_equalTo(headerView.mas_centerX);
                make.top.mas_equalTo(headerView.mas_top).with.mas_offset(kSixScreen(54));
                make.size.mas_equalTo(CGSizeMake(kSixScreen(83), kSixScreen(82)));
            }];
            [shopNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.mas_equalTo(mepichead.mas_bottom).with.mas_offset(kSixScreen(12));
                make.centerX.mas_equalTo(headerView.mas_centerX);
                make.height.mas_equalTo(kSixScreen(17));
            }];
        } else {
            headerView.backgroundColor = [UIColor colorWithHexString:@"f6f6f6"];
        }
        return headerView;
    } else {
        UICollectionReusableView *footerView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"IDFooter" forIndexPath:indexPath];
        return footerView;
    }
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
        self.collectionView.backgroundColor = [UIColor colorWithHexString:@"f6f6f6"];
        self.collectionView.delegate = self;
        self.collectionView.dataSource = self;
        self.collectionView.showsVerticalScrollIndicator = NO;
        self.collectionView.showsHorizontalScrollIndicator = NO;
        [self.collectionView registerClass:[MyItemCell class] forCellWithReuseIdentifier:IDMyItemCell];
        [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"IDHeader"];
        [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"IDFooter"];
    }
    return _collectionView;
}

- (NSArray<MyItemModel *> *)datasource
{
    if (!_datasource) {
        MyItemModel *dataModel = [[MyItemModel alloc] init];
        dataModel.imageName = @"商户资料";
        dataModel.itemName = @"商户资料";
        
        MyItemModel *announceModel = [[MyItemModel alloc] init];
        announceModel.imageName = @"商户公告";
        announceModel.itemName = @"商户公告";
        
        MyItemModel *setModel = [[MyItemModel alloc] init];
        setModel.imageName = @"设置";
        setModel.itemName = @"设置";
        
        MyItemModel *voiceModel = [[MyItemModel alloc] init];
        voiceModel.imageName = @"btn_open";
        voiceModel.itemName = @"语音提醒";
        
        self.datasource = @[@[dataModel, announceModel, setModel],
                            @[voiceModel]];
    }
    return _datasource;
}

@end

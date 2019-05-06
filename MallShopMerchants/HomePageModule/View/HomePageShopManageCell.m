//
//  HomePageShopManageCell.m
//  MallShopMerchants
//
//  Created by zl on 2019/5/6.
//  Copyright © 2019 yezhongzheng. All rights reserved.
//

#import "HomePageShopManageCell.h"

@interface HomePageShopManageCell ()

@property (nonatomic, strong) UIImageView *managerIcon;
@property (nonatomic, strong) UILabel *managerLabel;

@end

@implementation HomePageShopManageCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        [self.contentView addSubview:self.managerIcon];
        [self.contentView addSubview:self.managerLabel];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    __weak typeof(self) weakSelf = self;
    [self.managerIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(weakSelf.contentView.mas_centerX);
        make.top.mas_equalTo(weakSelf.contentView.mas_top).with.mas_offset(kSixScreen(25));
        make.size.mas_equalTo(CGSizeMake(kSixScreen(23), kSixScreen(29)));
    }];
    [self.managerLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(weakSelf.contentView.mas_centerX);
        make.top.mas_equalTo(weakSelf.managerIcon.mas_bottom).with.mas_offset(kSixScreen(7));
        make.height.mas_equalTo(kSixScreen(17));
        make.bottom.mas_equalTo(weakSelf.contentView.mas_bottom).with.mas_offset(kSixScreen(-22));
    }];
}

- (void)setShopManageCellWithImageName:(NSString *)imageName labelName:(NSString *)labelName
{
    self.managerIcon.image = [UIImage imageNamed:imageName];
    self.managerLabel.text = labelName;
}

- (UIImageView *)managerIcon
{
    if (!_managerIcon) {
        self.managerIcon = [ComponentTools createImageViewWithImage:[UIImage imageNamed:@""]];
        [self.managerIcon setContentMode:UIViewContentModeScaleAspectFit];
    }
    return _managerIcon;
}

- (UILabel *)managerLabel
{
    if (!_managerLabel) {
        self.managerLabel = [ComponentTools createLabelWithFont:[UIFont fontWithName:@"PingFangSC-Regular" size:kSixScreen(12)] backgroundColor:[UIColor clearColor] textColor:[UIColor colorWithHexString:@"333333"] numberOfLines:0 textAlignment:NSTextAlignmentCenter text:@"--"];
    }
    return _managerLabel;
}

@end

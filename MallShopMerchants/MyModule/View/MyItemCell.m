//
//  MyItemCell.m
//  MallShopMerchants
//
//  Created by zl on 2019/5/7.
//  Copyright © 2019 yezhongzheng. All rights reserved.
//

#import "MyItemCell.h"
#import "MyItemModel.h"

@interface MyItemCell ()

@property (nonatomic, strong) UIImageView *itemIcon;
@property (nonatomic, strong) UILabel *itemNameLabel;

@end

@implementation MyItemCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (void)setMyItemModel:(MyItemModel *)model indexPath:(NSIndexPath *)indexPath
{
    [self.contentView addSubview:self.itemIcon];
    [self.contentView addSubview:self.itemNameLabel];
    __weak typeof(self) weakSelf = self;
    if (indexPath.section == 0) {
        
        [self.itemIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(weakSelf.contentView.mas_centerX);
            make.top.mas_equalTo(weakSelf.contentView.mas_top).with.mas_offset(kSixScreen(15));
            make.size.mas_equalTo(CGSizeMake(kSixScreen(31), kSixScreen(31)));
        }];
        [self.itemNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(weakSelf.contentView.mas_centerX);
            make.top.mas_equalTo(weakSelf.itemIcon.mas_bottom).with.mas_offset(kSixScreen(8));
            make.height.mas_equalTo(kSixScreen(19));
            make.bottom.mas_equalTo(weakSelf.contentView.mas_bottom).with.mas_offset(kSixScreen(-15));
        }];
        self.itemNameLabel.textColor = [UIColor colorWithHexString:@"666666"];
        self.itemNameLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:kSixScreen(13)];
        self.itemIcon.image = [UIImage imageNamed:model.imageName];
        self.itemNameLabel.text = model.itemName;
    } else {
        [self.itemIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(weakSelf.contentView.mas_centerY);
            make.right.mas_equalTo(weakSelf.contentView.mas_right).with.mas_offset(kSixScreen(-15));
            make.size.mas_equalTo(CGSizeMake(kSixScreen(45), kSixScreen(22)));
        }];
        [self.itemNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(weakSelf.contentView.mas_centerY);
            make.left.mas_equalTo(weakSelf.contentView.mas_left).with.mas_offset(kSixScreen(13));
            make.height.mas_equalTo(kSixScreen(23));
        }];
        self.itemIcon.image = [UIImage imageNamed:model.imageName];
        self.itemNameLabel.textColor = [UIColor colorWithHexString:@"333333"];
        self.itemNameLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:kSixScreen(16)];
        self.itemNameLabel.text = model.itemName;
    }
    
}

- (UIImageView *)itemIcon
{
    if (!_itemIcon) {
        self.itemIcon = [ComponentTools createImageViewWithImage:[UIImage imageNamed:@""]];
    }
    return _itemIcon;
}

- (UILabel *)itemNameLabel
{
    if (!_itemNameLabel) {
        self.itemNameLabel = [ComponentTools createLabelWithFont:[UIFont fontWithName:@"PingFangSC-Regular" size:kSixScreen(13)] backgroundColor:[UIColor clearColor] textColor:[UIColor colorWithHexString:@"666666"] numberOfLines:0 textAlignment:NSTextAlignmentLeft text:@"--"];
    }
    return _itemNameLabel;
}

@end

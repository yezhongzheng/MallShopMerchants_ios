//
//  StoreNoticeTableViewCell.m
//  MallShopMerchants
//
//  Created by benzhang on 2019/5/8.
//  Copyright © 2019 yezhongzheng. All rights reserved.
//

#import "StoreNoticeTableViewCell.h"

@interface StoreNoticeTableViewCell()

@property (nonatomic, strong) UIView *bgView;
@property (nonatomic, strong) UILabel *txtLabel;

@end

@implementation StoreNoticeTableViewCell

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    if (self) {
        self.contentView.backgroundColor = [UIColor clearColor];
        
        [self.contentView addSubview:self.bgView];
        [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(kSixScreen(12));
            make.top.equalTo(self);
            make.right.equalTo(self).offset(kSixScreen(-12));
            make.bottom.equalTo(self);
        }];
        
        [self.contentView addSubview:self.txtLabel];
        [self.txtLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.bgView.mas_left).offset(kSixScreen(15));
            make.right.equalTo(self.bgView.mas_right).offset(kSixScreen(-15));
            make.bottom.equalTo(self.bgView.mas_bottom).offset(kSixScreen(-12));
            make.top.equalTo(self.bgView.mas_top).offset(kSixScreen(12));
        }];
    }
    return self;
}

- (void)setNoticeWithString:(NSString *)string {
    self.txtLabel.text = string;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}

#pragma mark --

- (UIView *)bgView {
    if (!_bgView) {
        _bgView = [[UIView alloc] init];
        _bgView.backgroundColor = [UIColor whiteColor];
    }
    return _bgView;
}

- (UILabel *)txtLabel {
    if (!_txtLabel) {
        _txtLabel = [[UILabel alloc] init];
        _txtLabel.backgroundColor = [UIColor clearColor];
        _txtLabel.font = [UIFont systemFontOfSize:15.f];
        _txtLabel.textColor = [UIColor colorWithHexString:@"333333"];
        _txtLabel.numberOfLines = 0;
    }
    return _txtLabel;
}

@end

//
//  StoreInfoTableViewCell.m
//  MallShopMerchants
//
//  Created by benzhang on 2019/5/8.
//  Copyright © 2019 yezhongzheng. All rights reserved.
//

#import "StoreInfoTableViewCell.h"

@interface StoreInfoTableViewCell()

@property (nonatomic, strong) UILabel *txtLabel;
@property (nonatomic, strong) UIView *line;

@end

@implementation StoreInfoTableViewCell

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        [self.contentView addSubview:self.txtLabel];
        [self.txtLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.mas_top).offset(kSixScreen(15));
            make.left.equalTo(self.mas_left).offset(kSixScreen(12));
        }];
        
        [self.contentView addSubview:self.line];
        [self.line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(kSixScreen(15));
            make.right.equalTo(self).offset( kSixScreen(-12));
            make.bottom.equalTo(self).offset(-1);
            make.height.mas_equalTo(0.5);
        }];
    }
    
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

- (void)setTxtString:(NSString *)string {
    self.txtLabel.text = string;
}

#pragma mark--
- (UILabel *)txtLabel {
    if (!_txtLabel) {
        _txtLabel = [[UILabel alloc] init];
        _txtLabel.backgroundColor = [UIColor clearColor];
        _txtLabel.font = [UIFont systemFontOfSize:16.0];
        _txtLabel.textColor = [UIColor colorWithHexString:@"333333"];
    }
    return _txtLabel;
}

- (UIView *)line {
    if (!_line) {
        _line = [[UIView alloc] init];
        _line.backgroundColor = [UIColor colorWithHexString:@"f5f5f5"];
    }
    return _line;
}

@end

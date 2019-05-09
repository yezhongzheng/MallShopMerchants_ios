//
//  CashOutView.m
//  MallShopMerchants
//
//  Created by benzhang on 2019/5/9.
//  Copyright © 2019 yezhongzheng. All rights reserved.
//

#import "CashOutView.h"

@interface CashOutView()

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *cardNameLabel;
@property (nonatomic, strong) UILabel *amountLabel;
@property (nonatomic, strong) UILabel *RMBLabel;
@property (nonatomic, strong) UILabel *balanceLabel;
@property (nonatomic, strong) UILabel *allCashOutLabel;
@property (nonatomic, strong) UITextField *textField;

@property (nonatomic, strong) UIView *line1;
@property (nonatomic, strong) UIView *line2;

@end

@implementation CashOutView

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = [UIColor whiteColor];
        self.layer.cornerRadius = 5.f;
        
        [self addSubview:self.titleLabel];
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(kSixScreen(11.f));
            make.top.equalTo(self).offset(kSixScreen(18.f));
        }];
        
        [self addSubview:self.cardNameLabel];
        [self.cardNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.titleLabel.mas_right).offset(kSixScreen(30.f));
            make.top.equalTo(self).offset(kSixScreen(18.f));
        }];
        
        UIImageView *arrImgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"me_ico_into"]];
        [self addSubview:arrImgView];
        [arrImgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self).offset(kSixScreen(-10.f));
            make.centerY.equalTo(self.cardNameLabel);
        }];
        
        [self addSubview:self.line1];
        [self.line1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(kSixScreen(10.f));
            make.right.equalTo(self).offset(kSixScreen(-10.f));
            make.height.mas_offset(0.5);
            make.top.equalTo(self).offset(55.f);
        }];
        
        [self addSubview:self.amountLabel];
        [self.amountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(kSixScreen(11.f));
            make.top.equalTo(self).offset(kSixScreen(72.f));
        }];
        
        [self addSubview:self.RMBLabel];
        [self.RMBLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(kSixScreen(15.f));
            make.top.equalTo(self).offset(kSixScreen(112.f));
        }];
        
        [self addSubview:self.line2];
        [self.line2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(kSixScreen(10.f));
            make.right.equalTo(self).offset(kSixScreen(-10.f));
            make.height.mas_offset(0.5);
            make.bottom.equalTo(self).offset(kSixScreen(-38.f));
        }];
        
        [self addSubview:self.textField];
        [self.textField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(45.f);
            make.centerY.equalTo(self.RMBLabel);
            make.right.equalTo(self).offset(-30.f);
        }];
        
        [self addSubview:self.balanceLabel];
        [self.balanceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(kSixScreen(12.f));
            make.bottom.equalTo(self).offset(kSixScreen(-12.f));
        }];
        
        [self addSubview:self.allCashOutLabel];
        [self.allCashOutLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self).offset(kSixScreen(-12.f));
            make.bottom.equalTo(self).offset(kSixScreen(-12.f));
        }];
    }
    return self;
}

-(void)labelTouchUpInside:(UITapGestureRecognizer *)recognizer {
    
    if ([self.delegate respondsToSelector:@selector(allCashOut)]) {
        [self.delegate allCashOut];
    }
}

- (void)setTextFieldWithallCashOut:(NSString *)string
{
    self.textField.text = string;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.backgroundColor = [UIColor clearColor];
        _titleLabel.font = [UIFont systemFontOfSize:16.0];
        _titleLabel.text = @"提现至";
        _titleLabel.textColor = [UIColor colorWithHexString:@"999999"];
    }
    return _titleLabel;
}

- (UILabel *)cardNameLabel {
    if (!_cardNameLabel) {
        _cardNameLabel = [[UILabel alloc] init];
        _cardNameLabel.backgroundColor = [UIColor clearColor];
        _cardNameLabel.font = [UIFont systemFontOfSize:16.0];
        _cardNameLabel.text = @"中国邮政储蓄银行储蓄卡(1275)";
        _cardNameLabel.textColor = [UIColor colorWithHexString:@"333333"];
    }
    return _cardNameLabel;
}

- (UIView *)line1 {
    if (!_line1) {
        _line1 = [[UIView alloc] init];
        _line1.backgroundColor = [UIColor colorWithHexString:@"f4f4f4"];
    }
    return _line1;
}

- (UILabel *)amountLabel {
    if (!_amountLabel) {
        _amountLabel = [[UILabel alloc] init];
        _amountLabel.backgroundColor = [UIColor clearColor];
        _amountLabel.font = [UIFont systemFontOfSize:16.0];
        _amountLabel.text = @"提现金额";
        _amountLabel.textColor = [UIColor colorWithHexString:@"999999"];
    }
    return _amountLabel;
}

- (UILabel *)RMBLabel {
    if (!_RMBLabel) {
        _RMBLabel = [[UILabel alloc] init];
        _RMBLabel.backgroundColor = [UIColor clearColor];
        _RMBLabel.font = [UIFont boldSystemFontOfSize:24.0];
        _RMBLabel.text = @"¥";
        _RMBLabel.textColor = [UIColor colorWithHexString:@"1d1d1d"];
    }
    return _RMBLabel;
}

- (UIView *)line2 {
    if (!_line2) {
        _line2 = [[UIView alloc] init];
        _line2.backgroundColor = [UIColor colorWithHexString:@"f4f4f4"];
    
    }
    return _line2;
}

- (UILabel *)balanceLabel {
    if (!_balanceLabel) {
        _balanceLabel = [[UILabel alloc] init];
        _balanceLabel.backgroundColor = [UIColor clearColor];
        _balanceLabel.font = [UIFont systemFontOfSize:13.0];
        _balanceLabel.text = @"可提现余额¥9000.00";
        _balanceLabel.textColor = [UIColor colorWithHexString:@"999999"];
    }
    return _balanceLabel;
}

- (UILabel *)allCashOutLabel {
    if (!_allCashOutLabel) {
        _allCashOutLabel = [[UILabel alloc] init];
        _allCashOutLabel.backgroundColor = [UIColor clearColor];
        _allCashOutLabel.font = [UIFont systemFontOfSize:13.0];
        _allCashOutLabel.text = @"全部提现";
        _allCashOutLabel.textColor = [UIColor colorWithHexString:@"1DB907"];
        _allCashOutLabel.userInteractionEnabled=YES;
        UITapGestureRecognizer *labelTapGestureRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(labelTouchUpInside:)];
        
        [_allCashOutLabel addGestureRecognizer:labelTapGestureRecognizer];
        
    }
    return _allCashOutLabel;
}

- (UITextField *)textField {
    if (!_textField) {
        _textField = [[UITextField alloc] init];
        _textField.backgroundColor = [UIColor whiteColor];
        _textField.keyboardType = UIKeyboardTypeNumbersAndPunctuation;
        _textField.font = [UIFont systemFontOfSize:24.f];
    }
    return _textField;
}

@end

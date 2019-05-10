//
//  VerificationCodeViewController.m
//  MallShopMerchants
//
//  Created by benzhang on 2019/5/8.
//  Copyright © 2019 yezhongzheng. All rights reserved.
//

#import "VerificationCodeViewController.h"

@interface VerificationCodeViewController ()

@property (nonatomic, strong) UIView *bgView;
@property (nonatomic, strong) UILabel *codeLabel;
@property (nonatomic, strong) UITextField *codeTextField;
@property (nonatomic, strong) UIView *line;
@property (nonatomic, strong) UIButton *button;

@end

@implementation VerificationCodeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithHexString:@"f6f6f6"];
    [self setMainNavigationController];
    [self addBackButton];
    self.title = @"添加银行卡";
    
    [self setupUI];
}
- (void) setupUI {
    
    [self.view addSubview:self.bgView];
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view);
        make.top.equalTo(self.view).offset(kSixScreen(49.f));
        make.right.equalTo(self.view);
        make.height.mas_equalTo(50.f);
    }];
    
    [self.view addSubview:self.codeLabel];
    [self.codeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(kSixScreen(12.f));
        make.centerY.equalTo(self.bgView);
    }];
    
    [self.view addSubview:self.codeTextField];
    [self.codeTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(kSixScreen(75));
        make.right.equalTo(self.view).offset(kSixScreen(-30));
        make.centerY.equalTo(self.bgView);
        make.height.mas_equalTo(30.f);
    }];
    
    [self.view addSubview:self.line];
    [self.line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view);
        make.right.equalTo(self.view);
        make.bottom.equalTo(self.bgView).offset(-1.f);
        make.height.mas_equalTo(0.5f);
    }];
    
    [self.view addSubview:self.button];
    [self.button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(kSixScreen(24.f));
        make.right.equalTo(self.view).offset(kSixScreen(-24.f));
        make.height.mas_equalTo(45.f);
        make.top.equalTo(self.bgView.mas_bottom).offset(kSixScreen(95.f));
    }];
}

- (void)buttonClicked {
    
}

#pragma mark --

- (UIView *)bgView {
    if (!_bgView) {
        _bgView = [[UIView alloc] init];
        _bgView.backgroundColor = [UIColor whiteColor];
    }
    return _bgView;
}

- (UILabel *)codeLabel {
    if (!_codeLabel) {
        _codeLabel = [[UILabel alloc] init];
        _codeLabel.backgroundColor = [UIColor clearColor];
        _codeLabel.font = [UIFont systemFontOfSize:16.0];
        _codeLabel.text = @"验证码";
        _codeLabel.textColor = [UIColor colorWithHexString:@"333333"];
    }
    return _codeLabel;
}

- (UITextField *)codeTextField {
    if (!_codeTextField) {
        _codeTextField = [[UITextField alloc] init];
        _codeTextField.backgroundColor = [UIColor clearColor];
        _codeTextField.placeholder = @"请输入银行预留手机验证码";
        _codeTextField.font = [UIFont systemFontOfSize:14];
    }
    return _codeTextField;
}

- (UIView *)line {
    if (!_line) {
        _line = [[UIView alloc] init];
        _line.backgroundColor = [UIColor colorWithHexString:@"d3d3d3"];
    }
    return _line;
}

- (UIButton *)button {
    if (!_button) {
        _button = [UIButton buttonWithType:UIButtonTypeCustom];
        _button.backgroundColor = [UIColor colorWithHexString:@"5AE06A"];
        [_button setTitle:@"确定" forState:UIControlStateNormal];
        _button.titleLabel.font = [UIFont systemFontOfSize:15.0];
        [_button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _button.layer.cornerRadius = 4.f;
        [_button addTarget:self action:@selector(buttonClicked) forControlEvents:UIControlEventTouchUpInside];
    }
    return _button;
}


@end

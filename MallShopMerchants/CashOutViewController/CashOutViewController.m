//
//  CashOutViewController.m
//  MallShopMerchants
//
//  Created by benzhang on 2019/5/9.
//  Copyright © 2019 yezhongzheng. All rights reserved.
//

#import "CashOutViewController.h"
#import "CashOutView.h"

@interface CashOutViewController ()<CashOutViewAllCashOutDelegate>

@property (nonatomic ,strong) CashOutView *cashOutView;
@property (nonatomic, strong) UIButton *button;

@end

@implementation CashOutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    [self setMainNavigationController];
    [self addBackButton];
    self.title = @"余额提现";
    self.view.backgroundColor = [UIColor colorWithHexString:@"f6f6f6"];
    
    [self.view addSubview:self.cashOutView];
    [self.view addSubview:self.button];
    [self.button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(kSixScreen(24.f));
        make.right.equalTo(self.view).offset(kSixScreen(-24.f));
        make.top.equalTo(self.cashOutView.mas_bottom).offset(kSixScreen(30.f));
        make.height.mas_equalTo(44.f);
    }];
}

#pragma mark -- CashOutViewAllCashOutDelegate
- (void)allCashOut {
//    [self.cashOutView setTextFieldWithallCashOut:@"9000"];
}

- (void)buttonClicked {
    
}

- (CashOutView *)cashOutView {
    if (!_cashOutView) {
        _cashOutView = [[CashOutView alloc] initWithFrame:CGRectMake(kSixScreen(10.f), kSixScreen(14.f), kScreenWidth - 2*kSixScreen(10.f), 200.f)];
        _cashOutView.delegate = self;
    }
    return _cashOutView;
}

- (UIButton *)button {
    if (!_button) {
        _button = [UIButton buttonWithType:UIButtonTypeCustom];
        _button.backgroundColor = [UIColor colorWithHexString:@"5AE06A"];
        [_button setTitle:@"确认提现" forState:UIControlStateNormal];
        _button.titleLabel.font = [UIFont systemFontOfSize:15.0];
        [_button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _button.layer.cornerRadius = 4.f;
        [_button addTarget:self action:@selector(buttonClicked) forControlEvents:UIControlEventTouchUpInside];
    }
    return _button;
}


@end

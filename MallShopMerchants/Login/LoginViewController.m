//
//  LoginViewController.m
//  MallShopMerchants
//
//  Created by benzhang on 2019/5/7.
//  Copyright © 2019年 yezhongzheng. All rights reserved.
//

#import "LoginViewController.h"
#import "LoginIconView.h"
#import "LoginTexView.h"

@interface LoginViewController ()

@property (nonatomic, strong) UIButton *loginBtn;
@property (nonatomic, strong) LoginIconView *iconView;
@property (nonatomic, strong) LoginTexView *textView;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.iconView];
    
    [self.view addSubview:self.textView];
//    [self.textView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(self.view);
//        make.top.mas_equalTo(self.iconView.mas_bottom);
//    }];
    
    [self.view addSubview:self.loginBtn];
    [self.loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(20);
        make.right.equalTo(self.view).offset(-20);
        make.height.mas_equalTo(45);
        make.top.equalTo(self.textView.mas_bottom).offset(50);
    }];
    
}

- (void)loginButtonClicked {
    
}

- (UIButton *) loginBtn {
    
    if (!_loginBtn) {
        _loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _loginBtn.backgroundColor = [UIColor colorWithHexString:@"00C869"];
        [_loginBtn setTitle:@"账号登录" forState:UIControlStateNormal];
        _loginBtn.titleLabel.font = [UIFont systemFontOfSize:15.0];
        [_loginBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _loginBtn.layer.cornerRadius = 23.0;
        [_loginBtn addTarget:self action:@selector(loginButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    }
    return _loginBtn;
}

- (LoginIconView *) iconView {
    
    if (!_iconView) {
        _iconView = [[LoginIconView alloc] initWithFrame:CGRectMake(0, 75, kScreenWidth, 238)];
    }
    return _iconView;
}

- (LoginTexView *) textView {
    
    if (!_textView) {
        _textView = [[LoginTexView alloc] initWithFrame:CGRectMake(0, 320, kScreenWidth, 90)];
    }
    return _textView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

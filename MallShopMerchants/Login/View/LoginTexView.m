//
//  LoginTexView.m
//  MallShopMerchants
//
//  Created by benzhang on 2019/5/7.
//  Copyright © 2019年 yezhongzheng. All rights reserved.
//

#import "LoginTexView.h"

@interface LoginTexView ()

@property (nonatomic, strong) UIImageView *phoneImgView;
@property (nonatomic, strong) UIImageView *passwordImgView;
@property (nonatomic, strong) UITextField *phoneTextField;
@property (nonatomic, strong) UITextField *passwordTextField;
@property (nonatomic, strong) UIView *line1;
@property (nonatomic, strong) UIView *line2;


@end

@implementation LoginTexView

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        
        [self addSubview:self.phoneImgView];
        [self.phoneImgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(kSixScreen(28));
            make.top.equalTo(self).offset(17);
            make.size.mas_equalTo(CGSizeMake(kSixScreen(12), kSixScreen(18)));
        }];
        
        [self addSubview:self.phoneTextField];
        [self.phoneTextField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(kSixScreen(54));
            make.right.equalTo(self).offset(kSixScreen(-40));
            make.top.equalTo(self).offset(10);
            make.height.mas_equalTo(30);
        }];
        
        [self addSubview:self.line1];
//        [self.line1 mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.left.equalTo(self.phoneImgView);
//            make.right.equalTo(self).offset(kSixScreen(28));
//            make.height.mas_equalTo(0.5);
//        }];
        
        [self addSubview:self.passwordImgView];
        [self.passwordImgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(kSixScreen(28));
            make.bottom.equalTo(self).offset(-10);
            make.size.mas_equalTo(CGSizeMake(kSixScreen(12), kSixScreen(18)));
        }];
        
        [self addSubview:self.passwordTextField];
        [self.passwordTextField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(kSixScreen(54));
            make.right.equalTo(self).offset(kSixScreen(-40));
            make.bottom.equalTo(self).offset(-5);
            make.height.mas_equalTo(30);
        }];
        
        [self addSubview:self.line2];
    }
    return self;
}

- (UIImageView *)phoneImgView {
    if (!_phoneImgView) {
        _phoneImgView = [[UIImageView alloc] init];
        _phoneImgView.image = [UIImage imageNamed:@"ico_enter_phone"];
    }
    return _phoneImgView;
}

- (UIImageView *) passwordImgView {
    if (!_passwordImgView) {
        _passwordImgView = [[UIImageView alloc] init];
        _passwordImgView.image = [UIImage imageNamed:@"ico_enter_auth code"];
    }
    return _passwordImgView;
}

- (UITextField *) phoneTextField {
    if (!_phoneTextField) {
        _phoneTextField = [[UITextField alloc] init];
        _phoneTextField.backgroundColor = [UIColor clearColor];
        _phoneTextField.placeholder = @"请输入手机号码";
        _phoneTextField.font = [UIFont systemFontOfSize:14];
    }
    return _phoneTextField;
}

- (UITextField *) passwordTextField {
    
    if (!_passwordTextField) {
        _passwordTextField = [[UITextField alloc] init];
        _passwordTextField.backgroundColor = [UIColor clearColor];
        _passwordTextField.placeholder = @"请输入您的密码";
        _passwordTextField.font = [UIFont systemFontOfSize:14];
    }
    return _passwordTextField;
}

- (UIView *) line1 {
    if (!_line1) {
        _line1 = [[UIView alloc] initWithFrame:CGRectMake(28, 44, kScreenWidth - 28*2, 0.5)];
//        _line1 = [[UIView alloc] init];
        _line1.backgroundColor = [UIColor colorWithHexString:@"B4B4B4"];
    }
    return _line1;
}

- (UIView *) line2 {
    
    if (!_line2) {
        _line2 = [[UIView alloc] initWithFrame:CGRectMake(28, 89, kScreenWidth - 28*2, 0.5)];
        //        _line1 = [[UIView alloc] init];
        _line2.backgroundColor = [UIColor colorWithHexString:@"B4B4B4"];
    }
    return _line2;
}







@end

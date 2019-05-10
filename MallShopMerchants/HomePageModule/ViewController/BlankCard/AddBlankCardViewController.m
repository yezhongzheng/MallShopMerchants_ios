//
//  AddBlankCardViewController.m
//  MallShopMerchants
//
//  Created by benzhang on 2019/5/8.
//  Copyright © 2019 yezhongzheng. All rights reserved.
//

#import "AddBlankCardViewController.h"
#import "VerificationCodeViewController.h"
#import "HomePageSerivce.h"
#import "GeneralResultsItems.h"

@interface AddBlankCardViewController ()

@property (nonatomic, strong) UILabel *titleLable;
@property (nonatomic, strong) UIView *bgView;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *numberLabel;
@property (nonatomic, strong) UITextField *nameTextField;
@property (nonatomic, strong) UITextField *numberTextField;

@property (nonatomic, strong) UIView *line1;
@property (nonatomic, strong) UIView *line2;

@property (nonatomic, strong) UIButton *button;

@end

@implementation AddBlankCardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithHexString:@"f6f6f6"];
    [self setMainNavigationController];
    [self addBackButton];
    self.title = @"添加银行卡";
    
    [self setupUI];
    
}

- (void)setupUI {
    
    [self.view addSubview:self.titleLable];
    [self.titleLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(kSixScreen(12.f));
        make.top.equalTo(self.view).offset(kSixScreen(15.f));
    }];
    
    [self.view addSubview:self.bgView];
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view);
        make.top.equalTo(self.view).offset(kSixScreen(48));
        make.right.equalTo(self.view);
        make.height.mas_equalTo(100.f);
    }];
    
    [self.view addSubview:self.nameLabel];
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(kSixScreen(12));
        make.top.equalTo(self.bgView).offset(kSixScreen(15.f));
    }];
    
    [self.view addSubview:self.nameTextField];
    [self.nameTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(kSixScreen(75));
        make.right.equalTo(self.view).offset(kSixScreen(-30));
        make.top.equalTo(self.bgView.mas_top).offset(kSixScreen(10.f));
        make.height.mas_equalTo(30.f);
    }];
    
    [self.view addSubview:self.line1];
    [self.line1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view);
        make.right.equalTo(self.view);
        make.top.equalTo(self.bgView).offset(50.f);
        make.height.mas_equalTo(0.5f);
    }];
    
    [self.view addSubview:self.numberLabel];
    [self.numberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(kSixScreen(12));
        make.bottom.equalTo(self.bgView).offset(kSixScreen(-12.f));
    }];
    
    [self.view addSubview:self.numberTextField];
    [self.numberTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(kSixScreen(75));
        make.right.equalTo(self.view).offset(kSixScreen(-30));
        make.bottom.equalTo(self.bgView.mas_bottom).offset(kSixScreen(-10.f));
        make.height.mas_equalTo(30.f);
    }];
    
    [self.view addSubview:self.line2];
    [self.line2 mas_makeConstraints:^(MASConstraintMaker *make) {
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
        make.top.equalTo(self.bgView.mas_bottom).offset(kSixScreen(75.f));
    }];
    
}

- (void)buttonClicked {
    if([NSString isEmptyString:self.nameTextField.text]){
        [MBProgressHUD showTipMessag:@"持卡人不能为空" toView:self.view];
        return;
    }else if ([NSString isEmptyString:self.numberTextField.text]){
        [MBProgressHUD showTipMessag:@"卡号不能为空" toView:self.view];
        return;
    }
    [HomePageSerivce addBankCardWithParam:@{@"name":self.nameTextField.text,@"number":self.numberTextField.text} successfulBlock:^(NSArray * _Nonnull responseObject, double timeStamp) {
        GeneralResultsItems *items = responseObject.firstObject;
        if(items.ret_code.integerValue == 200){
            GeneralResultsItem *item = items.data;
//            [MBProgressHUD showTipMessag:item.message toView:self.view];
            if(item.status){
                VerificationCodeViewController *vc = [[VerificationCodeViewController alloc]init];
                [self.navigationController pushViewController:vc animated:YES];
            }
        }else{
            [MBProgressHUD showTipMessag:items.err toView:self.view];
        }
    } failedBlock:^(NSString * _Nonnull errDescription, NSInteger errCode) {
        
    }];
}


#pragma mark --
- (UILabel *)titleLable {
    if (!_titleLable) {
        _titleLable = [[UILabel alloc] init];
        _titleLable.backgroundColor = [UIColor clearColor];
        _titleLable.font = [UIFont systemFontOfSize:13.0];
        _titleLable.text = @"请绑定持卡人本人的银行卡";
        _titleLable.textColor = [UIColor colorWithHexString:@"999999"];
    }
    return _titleLable;
}

- (UIView *)bgView {
    if (!_bgView) {
        _bgView = [[UIView alloc] init];
        _bgView.backgroundColor = [UIColor whiteColor];
    }
    return _bgView;
}

- (UILabel *)nameLabel {
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.backgroundColor = [UIColor clearColor];
        _nameLabel.font = [UIFont systemFontOfSize:16.0];
        _nameLabel.text = @"持卡人";
        _nameLabel.textColor = [UIColor colorWithHexString:@"333333"];
    }
    return _nameLabel;
}

- (UILabel *)numberLabel {
    if (!_numberLabel) {
        _numberLabel = [[UILabel alloc] init];
        _numberLabel.backgroundColor = [UIColor clearColor];
        _numberLabel.font = [UIFont systemFontOfSize:16.0];
        _numberLabel.text = @"卡  号";
        _numberLabel.textColor = [UIColor colorWithHexString:@"333333"];
    }
    return _numberLabel;
}

- (UITextField *)nameTextField {
    if (!_nameTextField) {
        _nameTextField = [[UITextField alloc] init];
        _nameTextField.backgroundColor = [UIColor clearColor];
        _nameTextField.placeholder = @"请输入持卡人姓名";
        _nameTextField.font = [UIFont systemFontOfSize:14];
    }
    return _nameTextField;
}

- (UITextField *)numberTextField {
    if (!_numberTextField) {
        _numberTextField = [[UITextField alloc] init];
        _numberTextField.backgroundColor = [UIColor clearColor];
        _numberTextField.placeholder = @"请输入银行卡号";
        _numberTextField.font = [UIFont systemFontOfSize:14];
    }
    return _numberTextField;
}

- (UIView *)line1 {
    if (!_line1) {
        _line1 = [[UIView alloc] init];
        _line1.backgroundColor = [UIColor colorWithHexString:@"d3d3d3"];
    }
    return _line1;
}

- (UIView *)line2 {
    if (!_line2) {
        _line2 = [[UIView alloc] init];
        _line2.backgroundColor = [UIColor colorWithHexString:@"d3d3d3"];
    }
    return _line2;
}

- (UIButton *)button {
    if (!_button) {
        _button = [UIButton buttonWithType:UIButtonTypeCustom];
        _button.backgroundColor = [UIColor colorWithHexString:@"5AE06A"];
        [_button setTitle:@"下一步" forState:UIControlStateNormal];
        _button.titleLabel.font = [UIFont systemFontOfSize:15.0];
        [_button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _button.layer.cornerRadius = 4.f;
        [_button addTarget:self action:@selector(buttonClicked) forControlEvents:UIControlEventTouchUpInside];
    }
    return _button;
}


@end

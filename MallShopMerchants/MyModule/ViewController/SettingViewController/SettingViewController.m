//
//  SettingViewController.m
//  MallShopMerchants
//
//  Created by benzhang on 2019/5/8.
//  Copyright © 2019 yezhongzheng. All rights reserved.
//

#import "SettingViewController.h"
#import "StoreInfoTableViewCell.h"

@interface SettingViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIButton *button;

@end

@implementation SettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setMainNavigationController];
    [self addBackButton];
    self.title = @"设置";
    
    [self setupUI];
}

- (void)setupUI {
    
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top);
        make.left.equalTo(self.view.mas_left);
        make.bottom.equalTo(self.view.mas_bottom);
        make.right.equalTo(self.view.mas_right);
    }];
    
    [self.view addSubview:self.button];
    [self.button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(kSixScreen(20.f));
        make.right.equalTo(self.view).offset(kSixScreen(-20.f));
        make.height.mas_equalTo(45.f);
        make.bottom.equalTo(self.view).offset(kSixScreen(-30.f));
    }];
}

- (void)buttonClicked {
    
}

#pragma tableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    StoreInfoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ssettingCell"];
    if (!cell) {
        cell = [[StoreInfoTableViewCell alloc] initWithReuseIdentifier:@"ssettingCell"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        [cell setTxtString:@"修改密码"] ;
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    return cell;
}

#pragma tableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44.f;
}


- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] init];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.backgroundColor = [UIColor colorWithHexString:@"f6f6f6"];
    }
    return _tableView;
}

- (UIButton *)button {
    if (!_button) {
        _button = [UIButton buttonWithType:UIButtonTypeCustom];
        _button.backgroundColor = [UIColor colorWithHexString:@"D02911"];
        [_button setTitle:@"退出登录" forState:UIControlStateNormal];
        _button.titleLabel.font = [UIFont systemFontOfSize:15.0];
        [_button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _button.layer.cornerRadius = 23.f;
        [_button addTarget:self action:@selector(buttonClicked) forControlEvents:UIControlEventTouchUpInside];
    }
    return _button;
}


@end

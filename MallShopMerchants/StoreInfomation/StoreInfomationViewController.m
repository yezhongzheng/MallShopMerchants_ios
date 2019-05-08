//
//  StoreInfomationViewController.m
//  MallShopMerchants
//
//  Created by benzhang on 2019/5/8.
//  Copyright © 2019 yezhongzheng. All rights reserved.
//

#define kCellHeight 44.0f

#import "StoreInfomationViewController.h"
#import "StoreInfoTableViewCell.h"

@interface StoreInfomationViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *dataArr;

@end

@implementation StoreInfomationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setMainNavigationController];
    [self addBackButton];
    self.title = @"商户资料";
    
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top);
        make.left.equalTo(self.view.mas_left);
        make.bottom.equalTo(self.view.mas_bottom);
        make.right.equalTo(self.view.mas_right);
    }];
}


#pragma tableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.dataArr.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    StoreInfoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"infoCell"];
    if (!cell) {
        cell = [[StoreInfoTableViewCell alloc] initWithReuseIdentifier:@"infoCell"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.textLabel.text = self.dataArr[indexPath.row];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    return cell;
}

#pragma tableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return kCellHeight;
}


#pragma
- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] init];
        _tableView.backgroundColor = [UIColor whiteColor];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.backgroundColor = [UIColor colorWithHexString:@"f6f6f6"];
    }
    return _tableView;
}

- (NSArray *)dataArr {
    if (!_dataArr) {
        _dataArr = @[@"商户名称",@"行业类别",@"负责任手机",@"商品头图",@"商家logo"];
    }
    return _dataArr;
}


@end

//
//  PaymentHasBeenVC.m
//  MallShopMerchants
//
//  Created by zl on 2019/5/7.
//  Copyright © 2019 yezhongzheng. All rights reserved.
//

#import "PaymentHasBeenVC.h"
#import "OrderStatusCell.h"
#import "OrderModelItems.h"
#import "OrederSerivce.h"

@interface PaymentHasBeenVC () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation PaymentHasBeenVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUI];
    [self GetListData];
}

-(void)GetListData{
    NSDictionary *dict = @{@"page_num":@"1",@"page_size":@"10",@"type":@(self.payId)};
    [OrederSerivce getOrderlistWithParam:dict successfulBlock:^(NSArray * _Nonnull responseObject, double timeStamp) {
        OrderModelItems *items = responseObject.firstObject;
        if(items.ret_code.integerValue == 200){
            [self.dataArray addObjectsFromArray:items.data.order];
            [self.tableView reloadData];
        }
    } failedBlock:^(NSString * _Nonnull errDescription, NSInteger errCode) {
        
    }];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)setUI
{
    [self.view addSubview:self.tableView];
    __weak typeof(self) weakSelf = self;
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(weakSelf.view);
    }];
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    OrderModelItem *model = self.dataArray[indexPath.section];
    OrderStatusCell *cell = [[OrderStatusCell alloc] init];
    //给一个模型，自动计算高度
    return [cell calculateOrderCellHeightWithOrderModel:model];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return kSixScreen(15);
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0;
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    return [[UIView alloc] init];
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    return [[UIView alloc] init];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    OrderStatusCell *cell = [tableView dequeueReusableCellWithIdentifier:IDOrderStatusCell];
    if (cell == nil) {
        cell = [[OrderStatusCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:IDOrderStatusCell];
        cell.selectionStyle = UITableViewCellSelectionStyleDefault;
    }
    OrderModelItem *model = self.dataArray[indexPath.section];
    [cell setDataModel:model];
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.dataArray.count;
}

#pragma mark - Lazy
- (UITableView *)tableView
{
    if (!_tableView) {
        self.tableView = [[UITableView alloc] init];
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        self.tableView.backgroundColor = [UIColor colorWithHexString:@"F6F6F6"];
        self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;//设置显示cell线
        self.tableView.estimatedRowHeight = 0;
        self.tableView.estimatedSectionFooterHeight = 0;
        self.tableView.estimatedSectionHeaderHeight = 0;
        self.tableView.tableFooterView = [[UIView alloc] init];
    }
    return _tableView;
}


@end

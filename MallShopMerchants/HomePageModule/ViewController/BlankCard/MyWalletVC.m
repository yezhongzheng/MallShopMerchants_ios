//
//  MyWalletVC.m
//  MallShopMerchants
//
//  Created by 黄伟业 on 2019/5/8.
//  Copyright © 2019 yezhongzheng. All rights reserved.
//

#import "MyWalletVC.h"
#import "BankCardCell.h"
#import "WalletHeardView.h"
#import "WalletFooterView.h"
#import "HomePageSerivce.h"
#import "WalletItems.h"
#import "AddBlankCardViewController.h"
#import "VerificationCodeViewController.h"
#import "CashOutViewController.h"


@interface MyWalletVC ()<UITableViewDelegate,UITableViewDataSource,WalletFooterViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) WalletHeardView *heardVIew;
@property (nonatomic, strong) WalletFooterView *footView;


@end

@implementation MyWalletVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithHexString:@"F6F6F6"];
    [self setUI];
    [self addBackButton];
    [self setMainNavigationController];
    self.title = @"我的钱包";
    [self getMyWalletData];
    WEAKSELF
    self.footView.PushCashOutVC=^{
        CashOutViewController *vc = [[CashOutViewController alloc]init];
        [weakSelf.navigationController pushViewController:vc animated:YES];
    };
}

-(void)setUI
{
    [self.view addSubview:self.tableView];
    __weak typeof(self) weakSelf = self;
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(weakSelf.view);
        make.left.mas_equalTo(kSixScreen(14));
        make.right.mas_equalTo(kSixScreen(-14));
    }];
}

-(void)getMyWalletData{
    [HomePageSerivce getSalletsuccessfulBlock:^(NSArray * _Nonnull responseObject, double timeStamp) {
        WalletItems *items = responseObject.firstObject;
        if(items.ret_code.integerValue == 200){
            WalletItem *item = items.data;
            [self.heardVIew setDataModel:item.wallet];
            [self.dataArray addObjectsFromArray:item.card];
            [self.tableView reloadData];
        }
    } failedBlock:^(NSString * _Nonnull errDescription, NSInteger errCode) {
        
    }];
}

-(void)WithdrawalClicket{

}

-(void)addBankCardClicket{
    AddBlankCardViewController *vc = [[AddBlankCardViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return kSixScreen(85);
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return kSixScreen(15);
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if(section == self.dataArray.count -1){
        return kSixScreen(15);
    }else{
        return kSixScreen(0);
    }
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
    BankCardCell *cell = [tableView dequeueReusableCellWithIdentifier:BankCardCellID];
    if (cell == nil) {
        cell = [[BankCardCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:BankCardCellID];
        cell.selectionStyle = UITableViewCellSelectionStyleDefault;
    }
    BankCartItem *model = self.dataArray[indexPath.section];
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
        self.tableView.tableFooterView = self.footView;
        self.tableView.tableHeaderView = self.heardVIew;
    }
    return _tableView;
}

-(WalletHeardView *)heardVIew{
    if(!_heardVIew){
        self.heardVIew = [[WalletHeardView alloc]initWithFrame:CGRectMake(0, 0, kSixScreen(348), kSixScreen(165))];
    }
    return _heardVIew;
}

-(WalletFooterView *)footView{
    if(!_footView){
        self.footView = [[WalletFooterView alloc]initWithFrame:CGRectMake(0, 0, kSixScreen(110), kSixScreen(165))];
        self.footView.delegate = self;
    }
    return _footView;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

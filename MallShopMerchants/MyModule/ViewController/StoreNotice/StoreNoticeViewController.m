//
//  StoreNoticeViewController.m
//  MallShopMerchants
//
//  Created by benzhang on 2019/5/8.
//  Copyright © 2019 yezhongzheng. All rights reserved.
//

#import "StoreNoticeViewController.h"
#import "StoreNoticeTableViewCell.h"
#import "NoticeSectionHeadView.h"

@interface StoreNoticeViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation StoreNoticeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setMainNavigationController];
    [self addBackButton];
    self.title = @"商户公告";
    
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
    
    return 1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 40.f;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    NoticeSectionHeadView *secHeadView = [[NoticeSectionHeadView alloc] initWithTimeString:@"2018年12月24日 上午09:37"];
    return secHeadView;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    StoreNoticeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"noticeCell"];
    if (!cell) {
        cell = [[StoreNoticeTableViewCell alloc] initWithReuseIdentifier:@"noticeCell"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        [cell setNoticeWithString:@"商家短APP将在今日凌晨0:00到06:00e更新，将出现登录不上的问题，j敬请谅解"];
    }

    return cell;
}

#pragma tableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 70;
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


@end

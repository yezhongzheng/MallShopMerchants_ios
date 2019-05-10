//
//  ReportListVC.m
//  MallShopMerchants
//
//  Created by 黄伟业 on 2019/5/9.
//  Copyright © 2019 yezhongzheng. All rights reserved.
//

#import "ReportListVC.h"
#import "ReportAmountView.h"
#import "ReportShopNewsView.h"
#import "HomePageSerivce.h"
#import "ReportItems.h"

@interface ReportListVC ()

@property(nonatomic,strong)ReportAmountView *amountView;
@property(nonatomic,strong)ReportShopNewsView *shopNewsView;

@end

@implementation ReportListVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = MainBgGrayColor;
    [self setUIView];
    [self GetSupplier_reportData];
}

-(void)GetSupplier_reportData{
    [HomePageSerivce getSupplierReportWithParam:@{@"type":@(self.payId)} successfulBlock:^(NSArray * _Nonnull responseObject, double timeStamp) {
        ReportItems *items = responseObject.firstObject;
        if(items.ret_code.integerValue == 200){
            ReportItem *item = items.data;
            [self.amountView setDataModel:item];
            [self.shopNewsView setDataModel:item];
        }
    } failedBlock:^(NSString * _Nonnull errDescription, NSInteger errCode) {
        
    }];
}

-(void)setUIView{
    [self.view addSubview:self.amountView];
    [self.view addSubview:self.shopNewsView];
    WEAKSELF
    [self.amountView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(kSixScreen(355), kSixScreen(164)));
        make.centerX.equalTo(weakSelf.view);
        make.top.mas_equalTo(kSixScreen(15));
    }];
    [self.shopNewsView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(kSixScreen(355), kSixScreen(124)));
        make.centerX.equalTo(weakSelf.view);
        make.top.equalTo(weakSelf.amountView.mas_bottom).with.offset(kSixScreen(20));
    }];
}

-(ReportAmountView *)amountView{
    if(!_amountView){
        self.amountView = [[ReportAmountView alloc]init];
        self.amountView.backgroundColor = kWhiteColor;
        self.amountView.layer.cornerRadius = 5;
    }
    return _amountView;
}

-(ReportShopNewsView *)shopNewsView{
    if(!_shopNewsView){
        self.shopNewsView = [[ReportShopNewsView alloc]init];
        self.shopNewsView.backgroundColor = kWhiteColor;
        self.shopNewsView.layer.cornerRadius = 5;
    }
    return _shopNewsView;
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

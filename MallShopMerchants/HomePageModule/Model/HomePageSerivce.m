//
//  HomePageSerivce.m
//  MallShopMerchants
//
//  Created by 黄伟业 on 2019/5/8.
//  Copyright © 2019 yezhongzheng. All rights reserved.
//

#import "HomePageSerivce.h"

@implementation HomePageSerivce

/**
 *获取商户信息
 */
+ (void)getSupplierInfoWithParam:(NSDictionary *)dic successfulBlock:(SuccessfulBlock)sBlock failedBlock:(FailedBlock)fBlock{
    ProcessingHandler *handler = [ProcessingHandler sharedInstance];
    [handler addRequestIdentify:@"b2b.user.get_supplier_info" ParamsDic:dic ModelName:@"UserInfoItems"];
    [handler sendRequestWithSuccessBlock:sBlock FaliedBlock:fBlock];
}

/**
 *获取商户钱包接口
 */
+ (void)getSalletsuccessfulBlock:(SuccessfulBlock)sBlock failedBlock:(FailedBlock)fBlock{
    ProcessingHandler *handler = [ProcessingHandler sharedInstance];
    [handler addRequestIdentify:@"b2b.user.wallet" ParamsDic:@{} ModelName:@"WalletItems"];
    [handler sendRequestWithSuccessBlock:sBlock FaliedBlock:fBlock];
}

/**
 *获取银行卡信息
 */
+ (void)getSettlementBanksuccessfulBlock:(SuccessfulBlock)sBlock failedBlock:(FailedBlock)fBlock{
    ProcessingHandler *handler = [ProcessingHandler sharedInstance];
    [handler addRequestIdentify:@"b2b.user.get_settlement_bank" ParamsDic:@{} ModelName:@"BankCartItems"];
    [handler sendRequestWithSuccessBlock:sBlock FaliedBlock:fBlock];
}

@end

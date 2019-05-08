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
    [handler addRequestIdentify:@"b2b.goods.get_supplier_info" ParamsDic:dic ModelName:@"UserInfoItems"];
    [handler sendRequestWithSuccessBlock:sBlock FaliedBlock:fBlock];
}

@end

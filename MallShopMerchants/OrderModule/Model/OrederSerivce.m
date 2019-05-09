//
//  OrederSerivce.m
//  MallShopMerchants
//
//  Created by 黄伟业 on 2019/5/8.
//  Copyright © 2019 yezhongzheng. All rights reserved.
//

#import "OrederSerivce.h"

@implementation OrederSerivce

/**
 *密登录注册
 */
+ (void)getOrderlistWithParam:(NSDictionary *)dic successfulBlock:(SuccessfulBlock)sBlock failedBlock:(FailedBlock)fBlock{
    ProcessingHandler *handler = [ProcessingHandler sharedInstance];
    [handler addRequestIdentify:@"b2b.order.get_orders" ParamsDic:dic ModelName:@"OrderModelItems"];
    [handler sendRequestWithSuccessBlock:sBlock FaliedBlock:fBlock];
}

@end

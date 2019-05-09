//
//  OrederSerivce.h
//  MallShopMerchants
//
//  Created by 黄伟业 on 2019/5/8.
//  Copyright © 2019 yezhongzheng. All rights reserved.
//

#import "BaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface OrederSerivce : BaseModel

/**
 *根据商户获取订单列表信息
 */
+ (void)getOrderlistWithParam:(NSDictionary *)dic successfulBlock:(SuccessfulBlock)sBlock failedBlock:(FailedBlock)fBlock;

@end

NS_ASSUME_NONNULL_END

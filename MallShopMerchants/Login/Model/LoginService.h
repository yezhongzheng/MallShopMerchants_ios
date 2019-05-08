//
//  LoginService.h
//  Mallshop
//
//  Created by 黄伟业 on 2019/1/9.
//  Copyright © 2019年 MongoliaForests. All rights reserved.
//

#import "BaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface LoginService : BaseModel

/**
 *密码登录注册
 */
+ (void)loginPassportWithParam:(NSDictionary *)dic successfulBlock:(SuccessfulBlock)sBlock failedBlock:(FailedBlock)fBlock;


@end

NS_ASSUME_NONNULL_END

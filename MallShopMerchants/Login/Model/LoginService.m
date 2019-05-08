//
//  LoginService.m
//  Mallshop
//
//  Created by 黄伟业 on 2019/1/9.
//  Copyright © 2019年 MongoliaForests. All rights reserved.
//

#import "LoginService.h"
@implementation LoginService

/**
 *密登录注册
 */
+ (void)loginPassportWithParam:(NSDictionary *)dic successfulBlock:(SuccessfulBlock)sBlock failedBlock:(FailedBlock)fBlock{
    ProcessingHandler *handler = [ProcessingHandler sharedInstance];
    [handler addRequestIdentify:@"b2b.passport.signin" ParamsDic:dic ModelName:@"LoginModelItems"];
    [handler sendRequestWithSuccessBlock:sBlock FaliedBlock:fBlock];
}

@end

//
//  ProcessingHandler.h
//  Mallshop
//
//  Created by 黄伟业 on 2019/1/14.
//  Copyright © 2019年 MongoliaForests. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@interface ProcessingHandler : NSObject

DECLARE_SINGLETON(ProcessingHandler, sharedInstance);
typedef void(^SuccessfulBlock)(NSArray *responseObject,double timeStamp); // 暂时没有返回 timeStamp
typedef void(^FailedBlock)(NSString *errDescription, NSInteger errCode);

/**
 *  单个普通请求时,调用此方法增加参数,param可以为nil
 *  @warning 手动调用sendRequestWithSuccessBlock:FaliedBlock:前,不要多次调用这个方法.
 *                    如果想合并多个请求,请调用下面的方法.
 */
- (void)addRequestIdentify:(NSString *)identify ParamsDic:(NSDictionary *)param ModelName:(NSString *)name;

- (void)sendRequestWithSuccessBlock:(SuccessfulBlock)sBlock FaliedBlock:(FailedBlock)fBlock;

@end

NS_ASSUME_NONNULL_END

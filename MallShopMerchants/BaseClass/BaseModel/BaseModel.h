//
//  BaseModel.h
//  MallShopMerchants
//
//  Created by zl on 2019/5/5.
//  Copyright © 2019 yezhongzheng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ProcessingHandler.h"

NS_ASSUME_NONNULL_BEGIN

@interface BaseModel : NSObject

@property (nonatomic, copy) NSString *ret_code;
@property (nonatomic, copy) NSString *err;
@property (nonatomic, copy) NSDictionary *data;

@end

NS_ASSUME_NONNULL_END

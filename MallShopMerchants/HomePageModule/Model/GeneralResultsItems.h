//
//  GeneralResultsItems.h
//  MallShopMerchants
//
//  Created by 黄伟业 on 2019/5/9.
//  Copyright © 2019 yezhongzheng. All rights reserved.
//

#import <Foundation/Foundation.h>
@class GeneralResultsItem;

NS_ASSUME_NONNULL_BEGIN

@interface GeneralResultsItems : NSObject

@property (nonatomic, copy) NSString *ret_code;
@property (nonatomic, copy) NSString *err;
@property (nonatomic, strong) GeneralResultsItem *data;

@end

@interface GeneralResultsItem : NSObject

@property (nonatomic, copy) NSString *status;
@property (nonatomic, copy) NSString *message;

@end

NS_ASSUME_NONNULL_END

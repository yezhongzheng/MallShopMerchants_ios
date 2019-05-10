//
//  ReportItems.h
//  MallShopMerchants
//
//  Created by 黄伟业 on 2019/5/9.
//  Copyright © 2019 yezhongzheng. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ReportItem;

NS_ASSUME_NONNULL_BEGIN

@interface ReportItems : NSObject

@property (nonatomic, copy) NSString *ret_code;
@property (nonatomic, copy) NSString *err;
@property (nonatomic, strong) ReportItem *data;

@end

@interface ReportItem : NSObject

@property (nonatomic, copy) NSString *order_amount;
@property (nonatomic, copy) NSString *order_count;
@property (nonatomic, copy) NSString *member_count;
@property (nonatomic, copy) NSString *goods_enable;
@property (nonatomic, copy) NSString *goods_disable;

@end

NS_ASSUME_NONNULL_END

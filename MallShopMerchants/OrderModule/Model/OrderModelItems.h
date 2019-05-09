//
//  OrderModelItems.h
//  MallShopMerchants
//
//  Created by 黄伟业 on 2019/5/8.
//  Copyright © 2019 yezhongzheng. All rights reserved.
//

#import <Foundation/Foundation.h>

@class OrderModelItem,ConsigneeModel,DeliveryModel,OrderInfo;

NS_ASSUME_NONNULL_BEGIN

@interface OrderModelItems : NSObject

@property (nonatomic, copy) NSString *ret_code;
@property (nonatomic, copy) NSString *err;
@property (nonatomic, strong) OrderInfo *data;

@end

@interface OrderInfo : NSObject

@property (nonatomic, strong) NSArray <OrderModelItem *>*order;

@end

@interface OrderModelItem : NSObject

@property (nonatomic, copy) NSString *order_id;
@property (nonatomic, strong) ConsigneeModel *consignee;
@property (nonatomic, copy) NSString *total_amount;
@property (nonatomic, copy) NSString *cur_amount;
@property (nonatomic, copy) NSString *order_status;
@property (nonatomic, copy) NSString *order_text;
@property (nonatomic, copy) NSString *pay_status;
@property (nonatomic, copy) NSString *ship_status;
@property (nonatomic, copy) NSString *is_delivery;
@property (nonatomic, copy) NSString *createtime;
@property (nonatomic, copy) NSString *member_id;
@property (nonatomic, copy) NSString *confirm;
@property (nonatomic, copy) NSString *quantity;
@property (nonatomic, copy) NSString *mailNo;
@property (nonatomic, strong) NSArray <DeliveryModel *>*delivery;
@property (nonatomic, copy) NSString *goods_name;

@end

@interface ConsigneeModel : NSObject

@property (nonatomic, copy) NSString *a_id;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *phone;
@property (nonatomic, copy) NSString *address_all;
@property (nonatomic, copy) NSString *def;

@end

@interface DeliveryModel : NSObject

@property (nonatomic, copy) NSString *mailNo;
@property (nonatomic, copy) NSString *expTextName;


@end
NS_ASSUME_NONNULL_END

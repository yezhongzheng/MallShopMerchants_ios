//
//  OrderStatusCell.h
//  MallShopMerchants
//
//  Created by zl on 2019/5/7.
//  Copyright © 2019 yezhongzheng. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *订单已付款，处理中，已完成，无效订单Cell
 */

NS_ASSUME_NONNULL_BEGIN

@class OrderModel;

static NSString *const IDOrderStatusCell = @"IDOrderStatusCell";

@interface OrderStatusCell : UITableViewCell

/**
 *根据model计算Cell的高
 */
- (CGFloat)calculateOrderCellHeightWithOrderModel:(OrderModel *)orderModel;

@end

NS_ASSUME_NONNULL_END

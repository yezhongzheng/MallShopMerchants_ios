//
//  OrderModelItems.m
//  MallShopMerchants
//
//  Created by 黄伟业 on 2019/5/8.
//  Copyright © 2019 yezhongzheng. All rights reserved.
//

#import "OrderModelItems.h"

@implementation OrderModelItems

+ (NSDictionary *)objectClassInArray{
    return @{@"data" : [OrderInfo class]};
}

@end

@implementation OrderInfo

+ (NSDictionary *)objectClassInArray{
    return @{@"order" : [OrderModelItem class]};
}

@end

@implementation OrderModelItem

+ (NSDictionary *)objectClassInArray{
    return @{@"consignee" : [ConsigneeModel class],@"delivery":[DeliveryModel class]};
}

@end

@implementation ConsigneeModel

@end

@implementation DeliveryModel

@end

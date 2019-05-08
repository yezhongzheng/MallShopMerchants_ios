//
//  BankCartItems.m
//  MallShopMerchants
//
//  Created by 黄伟业 on 2019/5/8.
//  Copyright © 2019 yezhongzheng. All rights reserved.
//

#import "BankCartItems.h"

@implementation BankCartItems

+ (NSDictionary *)objectClassInArray{
    return @{@"data" : [CardItem class]};
}

@end

@implementation CardItem

+ (NSDictionary *)objectClassInArray{
    return @{@"card" : [BankCartItem class]};
}

@end

@implementation BankCartItem

@end

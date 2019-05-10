//
//  WalletItems.m
//  MallShopMerchants
//
//  Created by 黄伟业 on 2019/5/8.
//  Copyright © 2019 yezhongzheng. All rights reserved.
//

#import "WalletItems.h"

@implementation WalletItems

+ (NSDictionary *)objectClassInArray{
    return @{@"data" : [WalletItem class]};
}

@end


@implementation WalletItem

+ (NSDictionary *)objectClassInArray{
    return @{@"card" : [BankCartItem class],@"wallet":[WalletInfo class]};
}

@end


@implementation WalletInfo

@end

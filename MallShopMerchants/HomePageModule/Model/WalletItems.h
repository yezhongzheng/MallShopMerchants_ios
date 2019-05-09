//
//  WalletItems.h
//  MallShopMerchants
//
//  Created by 黄伟业 on 2019/5/8.
//  Copyright © 2019 yezhongzheng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BankCartItems.h"
@class WalletItem,WalletInfo;

NS_ASSUME_NONNULL_BEGIN

@interface WalletItems : NSObject

@property (nonatomic, copy) NSString *ret_code;
@property (nonatomic, copy) NSString *err;
@property (nonatomic, strong) WalletItem *data;

@end

@interface WalletItem : NSObject

@property (nonatomic, strong) NSArray <BankCartItem *> *card;
@property (nonatomic, strong) WalletInfo *wallet;


@end

@interface WalletInfo : NSObject

@property (nonatomic, copy) NSString *withdrawable;
@property (nonatomic, copy) NSString *withdrawals;
@property (nonatomic, copy) NSString *settled;
@property (nonatomic, copy) NSString *unsettled;

@end


NS_ASSUME_NONNULL_END

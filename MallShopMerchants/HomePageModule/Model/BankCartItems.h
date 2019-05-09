//
//  BankCartItems.h
//  MallShopMerchants
//
//  Created by 黄伟业 on 2019/5/8.
//  Copyright © 2019 yezhongzheng. All rights reserved.
//

#import <Foundation/Foundation.h>
@class BankCartItem,CardItem;

NS_ASSUME_NONNULL_BEGIN

@interface BankCartItems : NSObject

@property (nonatomic, copy) NSString *ret_code;
@property (nonatomic, copy) NSString *err;
@property (nonatomic, strong) CardItem *data;

@end

@interface CardItem : NSObject

@property (nonatomic, strong) NSArray <BankCartItem *> *card;

@end

@interface BankCartItem : NSObject

@property (nonatomic, copy) NSString *b_id;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *logo;
@property (nonatomic, copy) NSString *number;

@end
NS_ASSUME_NONNULL_END

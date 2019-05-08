//
//  UserInfoItems.h
//  MallShopMerchants
//
//  Created by 黄伟业 on 2019/5/8.
//  Copyright © 2019 yezhongzheng. All rights reserved.
//

#import <Foundation/Foundation.h>
@class UserInfoItem,StatusInfoItem;

NS_ASSUME_NONNULL_BEGIN

@interface UserInfoItems : NSObject

@property (nonatomic, copy) NSString *ret_code;
@property (nonatomic, copy) NSString *err;
@property (nonatomic, strong) UserInfoItem *data;

@end

@interface UserInfoItem : NSObject

@property (nonatomic, copy) NSString *supplier_id;
@property (nonatomic, copy) NSString *uname;
@property (nonatomic, copy) NSString *local_uname;
@property (nonatomic, copy) NSString *supplier_name;
@property (nonatomic, strong) StatusInfoItem *stats;

@end

@interface StatusInfoItem : NSObject

@property (nonatomic, copy) NSString *order_amount;
@property (nonatomic, copy) NSString *order_count;
@property (nonatomic, copy) NSString *member_count;

@end

NS_ASSUME_NONNULL_END

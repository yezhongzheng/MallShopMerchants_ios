//
//  LoginModelItems.h
//  MallShopMerchants
//
//  Created by 黄伟业 on 2019/5/8.
//  Copyright © 2019 yezhongzheng. All rights reserved.
//

#import <Foundation/Foundation.h>
@class LoginModelItem;

NS_ASSUME_NONNULL_BEGIN

@interface LoginModelItems : NSObject

@property (nonatomic, copy) NSString *ret_code;
@property (nonatomic, copy) NSString *err;
@property (nonatomic, strong) LoginModelItem *data;

@end

@interface LoginModelItem : NSObject

@property (nonatomic, copy) NSString *status;
@property (nonatomic, copy) NSString *supplier_id;
@property (nonatomic, copy) NSString *accesstoken;
@property (nonatomic, copy) NSString *message;

@end

NS_ASSUME_NONNULL_END

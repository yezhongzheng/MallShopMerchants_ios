//
//  UserInfoItems.m
//  MallShopMerchants
//
//  Created by 黄伟业 on 2019/5/8.
//  Copyright © 2019 yezhongzheng. All rights reserved.
//

#import "UserInfoItems.h"

@implementation UserInfoItems

+ (NSDictionary *)objectClassInArray{
    return @{@"data" : [UserInfoItem class]};
}

@end

@implementation UserInfoItem

+ (NSDictionary *)objectClassInArray{
    return @{@"stats" : [StatusInfoItem class]};
}

@end

@implementation StatusInfoItem

@end

//
//  MyItemModel.h
//  MallShopMerchants
//
//  Created by zl on 2019/5/7.
//  Copyright © 2019 yezhongzheng. All rights reserved.
//

#import "BaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface MyItemModel : BaseModel

@property (nonatomic, copy) NSString *imageName;
@property (nonatomic, copy) NSString *itemName;

@end

NS_ASSUME_NONNULL_END

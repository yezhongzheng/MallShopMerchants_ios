//
//  StoreInfoTableViewCell.h
//  MallShopMerchants
//
//  Created by benzhang on 2019/5/8.
//  Copyright © 2019 yezhongzheng. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface StoreInfoTableViewCell : UITableViewCell

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier;

- (void)setTxtString:(NSString *)string;

@end

NS_ASSUME_NONNULL_END

//
//  HomePageShopManageCell.h
//  MallShopMerchants
//
//  Created by zl on 2019/5/6.
//  Copyright © 2019 yezhongzheng. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

static NSString *const IDHomePageShopManageCell = @"IDHomePageShopManageCell";

@interface HomePageShopManageCell : UICollectionViewCell

- (void)setShopManageCellWithImageName:(NSString *)imageName
                             labelName:(NSString *)labelName;

@end

NS_ASSUME_NONNULL_END

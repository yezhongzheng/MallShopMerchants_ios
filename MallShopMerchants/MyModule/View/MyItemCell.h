//
//  MyItemCell.h
//  MallShopMerchants
//
//  Created by zl on 2019/5/7.
//  Copyright © 2019 yezhongzheng. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class MyItemModel;

static NSString *const IDMyItemCell = @"IDMyItemCell";

@interface MyItemCell : UICollectionViewCell

- (void)setMyItemModel:(MyItemModel *)model indexPath:(NSIndexPath *)indexPath;

@end

NS_ASSUME_NONNULL_END

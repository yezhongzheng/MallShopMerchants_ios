//
//  OrderOptionView.h
//  MallShopMerchants
//
//  Created by zl on 2019/5/7.
//  Copyright © 2019 yezhongzheng. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *订单选项卡
 */
NS_ASSUME_NONNULL_BEGIN

@interface OrderOptionView : UIView

/**
 *必传，会根据标题多少来显示
 */
@property (nonatomic, strong) NSArray <NSString *> *titles;

/**
 *滚动到哪一页
 */
- (void)orderOptionViewScrollToButtonIndex:(int)index;

@property (nonatomic, copy) void(^DidSelectIndexBlock)(NSInteger index);

@end

NS_ASSUME_NONNULL_END

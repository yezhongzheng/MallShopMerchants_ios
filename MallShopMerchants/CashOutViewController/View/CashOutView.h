//
//  CashOutView.h
//  MallShopMerchants
//
//  Created by benzhang on 2019/5/9.
//  Copyright © 2019 yezhongzheng. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol CashOutViewAllCashOutDelegate <NSObject>

- (void)allCashOut;

@end

@interface CashOutView : UIView

@property (nonatomic, weak) id<CashOutViewAllCashOutDelegate> delegate;

- (void)setTextFieldWithallCashOut:(NSString *)string;

@end

NS_ASSUME_NONNULL_END

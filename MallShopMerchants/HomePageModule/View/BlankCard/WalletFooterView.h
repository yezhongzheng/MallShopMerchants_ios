//
//  WalletFooterView.h
//  MallShopMerchants
//
//  Created by 黄伟业 on 2019/5/8.
//  Copyright © 2019 yezhongzheng. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol WalletFooterViewDelegate <NSObject>

-(void)WithdrawalClicket;
-(void)addBankCardClicket;

@end

@interface WalletFooterView : UIView

@property(nonatomic,weak)id <WalletFooterViewDelegate> delegate;

@property (nonatomic, strong)void(^PushCashOutVC)(void);

@end

NS_ASSUME_NONNULL_END

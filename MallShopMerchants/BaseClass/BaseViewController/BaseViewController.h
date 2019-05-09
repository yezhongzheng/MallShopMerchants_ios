//
//  BaseViewController.h
//  MallShopMerchants
//
//  Created by zl on 2019/5/5.
//  Copyright © 2019 yezhongzheng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MallShopMerchantsNC.h"

NS_ASSUME_NONNULL_BEGIN

@interface BaseViewController : UIViewController

@property(nonatomic,strong)NSMutableArray *dataArray;

- (void)addBackButton;

- (void)addLeftButtonWithTitle:(NSString *)title actionBlock:(void(^)(void))block;

- (void)addLeftButtonWithImage:(UIImage *)image actionBlock:(void(^)(void))block;

- (void)addRightButtonWithImage:(UIImage *)image actionBlock:(void(^)(void))block;

- (void)addRightButtonWithTitle:(NSString *)title actionBlock:(void(^)(void))block;

- (void)setMainNavigationController;

- (void)setClearColorNavigationController;

@end

NS_ASSUME_NONNULL_END

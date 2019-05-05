//
//  MallShopMerchantsMacro.h
//  MallShopMerchants
//
//  Created by zl on 2019/5/5.
//  Copyright © 2019 yezhongzheng. All rights reserved.
//

#ifndef MallShopMerchantsMacro_h
#define MallShopMerchantsMacro_h

#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height
#define kSixScreen(width_param) (width_param * ([UIScreen mainScreen].bounds.size.width / 375))
#define kStatusBarHeight [UIApplication sharedApplication].statusBarFrame.size.height
#define kBottomSafeHeight (CGFloat)(kStatusBarHeight > 20 ? (34.0):(0))


#endif /* MallShopMerchantsMacro_h */

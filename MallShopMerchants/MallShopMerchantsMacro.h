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
#define KNavigationBarHeight self.navigationController.navigationBar.frame.size.height
#define KMainBarHeight (kStatusBarHeight + KNavigationBarHeight)

#define WEAKSELF typeof(self) __weak weakSelf = self;

#define DECLARE_SINGLETON(cls_name, method_name)\
+ (cls_name*)method_name;

#define IMPLEMENT_SINGLETON(cls_name, method_name)\
+ (cls_name *)method_name {\
static cls_name *method_name;\
static dispatch_once_t onceToken;\
dispatch_once(&onceToken, ^{\
method_name = [[cls_name alloc] init];\
});\
return method_name;\
}

#define REALM_NAME_URL [[[NSUserDefaults standardUserDefaults] objectForKey:@"SYBaseUrlDictKey"] jk_stringForKey:@"SYBaseUrlRealmNameKey"]
#define BASE_URL [[[NSUserDefaults standardUserDefaults] objectForKey:@"SYBaseUrlDictKey"] jk_stringForKey:@"SYBaseUrlKey"]
#define BASE_MALL_URL [[[NSUserDefaults standardUserDefaults] objectForKey:@"SYBaseUrlDictKey"] jk_stringForKey:@"SYBaseUrlMallKey"]
#define BASE_ALI_URL [[[NSUserDefaults standardUserDefaults] objectForKey:@"SYBaseUrlDictKey"] jk_stringForKey:@"SYBaseUrlAliKey"]
#define CORRECT_CODE  200

#endif /* MallShopMerchantsMacro_h */

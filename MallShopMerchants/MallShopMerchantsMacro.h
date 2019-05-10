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

//主要颜色
#define kWhiteColor [UIColor whiteColor]
#define kBlackColor [UIColor blackColor]
#define MainTextGrayColor [UIColor colorWithHex:0x666666]        // 主要的灰色字体颜色
#define MainTitleGrayColor [UIColor colorWithHex:0x999999]        // 主要标题的灰色字体颜色
#define MainTextBlackColor [UIColor colorWithHex:0x333333]        // 主要的黑色字体颜色
#define MainBgGrayColor [UIColor colorWithHex:0xf5f5f5]           // 主要的灰色背景颜色

// 如果obj为nil或者null，返回@""、@[]或者@{}，否则返回原样返回obj
// 主要是用在setObject:forKey:或者打印NSString的时候
#define VALID_STRING(obj) ([obj isKindOfClass:[NSString class]] ? obj : @"")
#define VALID_ARRAY(obj) ([obj isKindOfClass:[NSArray class]] ? obj : @[])
#define VALID_DICTIONARY(obj) ([obj isKindOfClass:[NSDictionary class]] ? obj : @{})
#define SHITF_STRING(obj) ([NSString stringWithFormat:@"%@",obj])

#define REALM_NAME_URL [[[NSUserDefaults standardUserDefaults] objectForKey:@"SYBaseUrlDictKey"] jk_stringForKey:@"SYBaseUrlRealmNameKey"]
#define BASE_URL [[[NSUserDefaults standardUserDefaults] objectForKey:@"SYBaseUrlDictKey"] jk_stringForKey:@"SYBaseUrlKey"]
#define BASE_MALL_URL [[[NSUserDefaults standardUserDefaults] objectForKey:@"SYBaseUrlDictKey"] jk_stringForKey:@"SYBaseUrlMallKey"]
#define BASE_ALI_URL [[[NSUserDefaults standardUserDefaults] objectForKey:@"SYBaseUrlDictKey"] jk_stringForKey:@"SYBaseUrlAliKey"]
#define CORRECT_CODE  200

#endif /* MallShopMerchantsMacro_h */

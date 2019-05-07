//
//  ServiceBaseUrlTool.m
//  fish
//
//  Created by 91钓鱼 on 2017/10/28.
//  Copyright © 2017年 GZLC. All rights reserved.
//

#import "ServiceBaseUrlTool.h"

#define RealmNameUrlArr @[@"80"]
#define BaseUrlArr @[@"http://mall.slctmall.com/api?method="]

static NSString *const SYBaseUrlTypeKey = @"SYBaseUrlTypeKey";
static NSString *const SYBaseUrlDictKey = @"SYBaseUrlDictKey";
static NSString *const SYBaseUrlRealmNameKey = @"SYBaseUrlRealmNameKey";
static NSString *const SYBaseUrlKey = @"SYBaseUrlKey";
static NSString *const SYBaseUrlAliKey = @"SYBaseUrlAliKey";
static NSString *const SYBaseUrlMallKey = @"SYBaseUrlMallKey";

@implementation ServiceBaseUrlTool

/**
 设置测试环境初始状态
 */
+ (void)setTestDefaultBaseUrl
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSDictionary *dict = [defaults objectForKey:SYBaseUrlDictKey];
    if (!dict || ![dict objectForKey:SYBaseUrlTypeKey] || [NSString isEmptyString:[dict jk_stringForKey:SYBaseUrlRealmNameKey]] || [NSString isEmptyString:[dict jk_stringForKey:SYBaseUrlKey]] || [NSString isEmptyString:[dict jk_stringForKey:SYBaseUrlAliKey]] || [NSString isEmptyString:[dict jk_stringForKey:SYBaseUrlMallKey]] || (ServiceBaseUrlTypeFormal==[self getNowServiceType]) ) {//如果defaults没有存储过服务器地址或者存储了正式服务器地址, 则清空
        [self changeBaseUrlType:0];
    }
}

/**
 当前服务器
 
 @return <#return value description#>
 */
+ (ServiceBaseUrlType)getNowServiceType
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSDictionary *dict = [defaults objectForKey:SYBaseUrlDictKey];
    NSNumber *num = [dict objectForKey:SYBaseUrlTypeKey];
    if (num) {
        return [num integerValue];
    }else{
        return 0;
    }
}

/**
 获取服务器域名
 */
+ (NSString *)getRealmNameUrlWithType:(ServiceBaseUrlType)type
{
    return [RealmNameUrlArr jk_stringWithIndex:type];
}

/**
 获取服务器地址
 */
+ (NSString *)getBaseUrlWithType:(ServiceBaseUrlType)type
{
    return [BaseUrlArr jk_stringWithIndex:type];
}


/**
 修改服务器地址
 
 @param type <#type description#>
 */
+ (void)changeBaseUrlType:(ServiceBaseUrlType)type
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    NSMutableDictionary *mutDcit = [NSMutableDictionary dictionaryWithCapacity:4];
    [mutDcit setObject:[NSNumber numberWithInteger:type] forKey:SYBaseUrlTypeKey];
    [mutDcit setObject:[self getRealmNameUrlWithType:type] forKey:SYBaseUrlRealmNameKey];
    [mutDcit setObject:[self getBaseUrlWithType:type] forKey:SYBaseUrlKey];
    [mutDcit setObject:[self getBaseUrlWithType:type] forKey:SYBaseUrlAliKey];
    
    [defaults setObject:mutDcit forKey:SYBaseUrlDictKey];
}

@end

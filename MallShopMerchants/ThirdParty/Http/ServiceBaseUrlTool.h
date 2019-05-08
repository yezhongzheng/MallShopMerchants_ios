//
//  ServiceBaseUrlTool.h
//  fish
//
//  Created by 91钓鱼 on 2017/10/28.
//  Copyright © 2017年 GZLC. All rights reserved.
//
//  测试需要切换测试服务器与待发布服务器

#import <Foundation/Foundation.h>

typedef enum : NSUInteger {
    ServiceBaseUrlTypeTest = 0,//测试服务器
    ServiceBaseUrlTypeReadyAnnounced = 1,//待发布服务器
    ServiceBaseUrlTypeFormal = 2,//正式服务器
} ServiceBaseUrlType;

@interface ServiceBaseUrlTool : NSObject

/**
 设置测试环境初始状态
 */
+ (void)setTestDefaultBaseUrl;

/**
 当前服务器

 @return <#return value description#>
 */
+ (ServiceBaseUrlType)getNowServiceType;

/**
 修改服务器地址

 @param type <#type description#>
 */
+ (void)changeBaseUrlType:(ServiceBaseUrlType)type;

@end

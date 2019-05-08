//
//  LCAccount.h
//  TripVip
//
//  Created by HuZeSen on 15/7/23.
//  Copyright (c) 2015年 GZLC. All rights reserved.
//

#import <Foundation/Foundation.h>

#define UserForceOfflineNotification  @"UserForceOfflineNotification"

typedef NS_ENUM(NSInteger, CacheStatusType)   // 缓存标记类型
{
    CacheStatusTypeNormal = 0,     // 正常情况,比如发送成功
    CacheStatusTypeFailed = 1,       // 发送失败,可能是服务器报错,也可能是断网,需要重发的
    CacheStatusTypeAbandon = 2   //  重发也会失败的
};

@class UserProfileItems;

@interface LCAccount : NSObject

@property (nonatomic) NSTimeInterval appStartTime;      // app启动时间
@property (nonatomic) BOOL showLeaderBoard;             // 是否显示排行榜
@property (nonatomic) BOOL logined;                     // 是否登录
@property (nonatomic, copy) NSString *deviceToken;      // 设备标识
@property (nonatomic, copy) NSString *accesstoken;      // 登录
@property (nonatomic) NSInteger memberId;               // 用户ID
@property (nonatomic, copy) NSString *mobileNum;        // 手机号码
@property (nonatomic, copy) NSArray *recieveNotify;     //消息通知
@property (nonatomic, copy) NSString *timeStamp;        //用于判断用户登录加积分
@property (nonatomic, copy) NSString *balance;          //余额

@property (nonatomic, copy, readonly) NSArray *districtArray;      // 行政区域数组
@property (nonatomic, strong) UserProfileItems *userInfo;


+ (instancetype)sharedInstance;

/**
 *  判断是否已经登录
 *
 */
+ (BOOL)hasLogined;


/**
 *  获取个人信息文件(以手机号为唯一标识)
 *
 */
- (NSString *)getFilePath;


- (void)logOut;
+ (void)logOut;
@end

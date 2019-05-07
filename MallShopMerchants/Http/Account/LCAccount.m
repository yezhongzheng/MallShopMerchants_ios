//
//  LCAccount.m
//  TripVip
//
//  Created by HuZeSen on 15/7/23.
//  Copyright (c) 2015年 GZLC. All rights reserved.
//


#import "LCAccount.h"

static NSString *const appStartTimeKey = @"appStartTime";           // app启动时间
static NSString *const loginedKey = @"ow_logined";                  // 是否登录
static NSString *const deviceTokenKey = @"deviceToken";             // 设备令牌
static NSString *const accesstokenKey = @"ow_accesstoken";          // 身份识别
static NSString *const memberIdKey = @"ow_memberId";                // 用户Id
static NSString *const balanceKey = @"ow_balance";                  // 用户余额
static NSString *const mobileKey = @"bw_mobileKey";
static NSString *const liveSigKey = @"ow_liveSig";
static NSString *const receiptKey = @"ow_receipt";
static NSString *const cashMoneyKey = @"ow_cashMoney";
static NSString *const cashAccountKey = @"ow_cashAccount";
static NSString *const cashNameKey = @"ow_cashName";
static NSString *const hasRecoveryDialogKey = @"ow_hasRecoveryDialog";//是否有断线重连提示弹框
static NSString *const sharedCatchIdKey = @"ow_sharedCatchId";//是否有断线重连提示弹框

static NSString *const districtKey = @"districtKey";               // 行政区域
static NSString *const recieveNotifyKey = @"ow_recieveNotifyKey";
static NSString *const leaderBoardKey = @"showLeaderBoard";

static NSString *const lastWWANTimeKey = @"lastWWANTime";
static NSString *const lastOpenPushTimeKey = @"lastOpenPushTime";
static NSString *const whiteListsKey = @"whiteListsKey";

#define GET_USER_DEFAULTS(v) NSUserDefaults *v = [NSUserDefaults standardUserDefaults];
#define ProfileName @"Profile"
#define PostCachePath @"PostCache"
#define LiveName @"LiveBase"
#define MainListName @"MainList"

@interface LCAccount ()<NSXMLParserDelegate>

@property (nonatomic, weak) NSArray *districtArr;

@property (nonatomic, strong) dispatch_queue_t queue;

@end

@implementation LCAccount

+ (instancetype)sharedInstance
{
    static id account = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        account = [[LCAccount alloc]init];
    });
    return account;
}

-(void)setAccesstoken:(NSString *)accesstoken{
    [self setOWObject:accesstoken forKey:accesstokenKey];
}

-(void)setMemberId:(NSInteger)memberId{
    [self setOWObject:@(memberId) forKey:memberIdKey];
}

-(void)setBalance:(NSString *)balance{
    [self setOWObject:balance forKey:balanceKey];
}

- (void)setLogined:(BOOL)logined
{
    [self setOWObject:@(logined) forKey:loginedKey];
}

- (void)setOWObject:(id)object forKey:(NSString *)key
{
    GET_USER_DEFAULTS(defaults);
    [defaults setObject:object forKey:key];
    [defaults synchronize];
}

- (NSString *)accesstoken
{
    return [self getOWObjectWithKey:accesstokenKey];
}

- (NSInteger)memberId
{
    NSNumber *num = [self getOWObjectWithKey:memberIdKey];
    return num.integerValue;
}

- (BOOL)logined
{
    NSNumber *num = [self getOWObjectWithKey:loginedKey];
    return num.boolValue;
}

-(NSString *)balance{
    return [self getOWObjectWithKey:balanceKey];
}

- (id)getOWObjectWithKey:(NSString *)key
{
    GET_USER_DEFAULTS(defaults);
    return [defaults objectForKey:key];
}

+ (BOOL)hasLogined
{
    LCAccount *account = [LCAccount sharedInstance];
    return account.logined;
}

+ (void)logOut
{
    LCAccount *act = [LCAccount sharedInstance];
    [act logOut];
}

- (void)logOut
{
    GET_USER_DEFAULTS(defaults);
    NSDictionary *dic = [defaults dictionaryRepresentation];
    for (NSString *object in dic.allKeys)
    {
        if (![object hasPrefix:@"ow"])
        {
            continue;
        }
        [defaults removeObjectForKey:object];
    }
    [defaults synchronize];
}


@end

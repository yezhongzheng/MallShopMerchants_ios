//
//  LCCache.m
//  fish
//
//  Created by HuZeSen on 16/1/22.
//  Copyright © 2016年 GZLC. All rights reserved.
//

#import "LCCache.h"
#import "MJExtension.h"
@interface LCCache ()

@property (nonatomic, strong) dispatch_queue_t queue;

@end

@implementation LCCache

+ (LCCache *)sharedInstance
{
    static id tool = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        tool = [[LCCache alloc]init];
    });
    return tool;
}

- (dispatch_queue_t)queue
{
    if (!_queue)
    {
        _queue = dispatch_queue_create("", DISPATCH_QUEUE_CONCURRENT);
    }
    return _queue;
}

#pragma mark- setter
- (void)cacheData:(id)data forKey:(NSString *)key
{
    if (key == nil)
    {
        return;
    }
    NSData *kData = nil;
    if ([data isKindOfClass:[NSDictionary class]])
    {
         kData = [NSJSONSerialization dataWithJSONObject:data options:NSJSONWritingPrettyPrinted error:nil];
        [self setObject:kData forKey:key];
    }
    if (kData)
    {
        NSString *filePath = [self getFilePathWithKey:key];
        dispatch_async(self.queue, ^{
            [[NSFileManager defaultManager] createFileAtPath:filePath contents:kData attributes:nil];
        });
    }
}

#pragma mark- getter

- (NSArray *)getCacheModelsArrayWithNameArray:(NSArray<NSString *> *)nameArr keyArray:(NSArray<NSString *> *)keyArr
{
    WEAKSELF
    NSMutableArray *temp = [[NSMutableArray alloc]initWithCapacity:0];
    [keyArr enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        NSDictionary *dic = [weakSelf getCacheDictionaryWithKey:obj];
        if (dic)
        {
            id model = [NSClassFromString(nameArr[idx]) objectWithKeyValues:dic];
            if (model)
            {
                [temp addObject:model];
            }
        }
    }];
    return temp;
}

- (NSDictionary *)getCacheDictionaryWithKey:(NSString *)key
{
    NSData *data = [self getCacheDataWithKey:key];
    
    if (data)
    {
        NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        return dictionary;
    }
    return nil;
}

- (NSData *)getCacheDataWithKey:(NSString *)key
{
    NSData *data = [self objectForKey:key];
    if (data)
    {
        return data;
    }
    NSString *path = [self getFilePathWithKey:key];
    data =  [[NSFileManager defaultManager] contentsAtPath:path];
    if (data)
    {
        return data;
    }
    return nil;
}

- (NSString *)getFilePathWithKey:(NSString *)key
{
    NSString *documents = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *path = [documents stringByAppendingPathComponent:key];
    return path;
}
//- (void)write:(NSData*)data forKey:(NSString*)key
//{
//    
//    NSString *filepath  = [self filePathForKey:key];
//    
//    [_cache setObject:data forKey:key];
//    
//    dispatch_async(fileQueue, ^{
//        
//        [[NSFileManager defaultManager] createFileAtPath:filepath contents:data attributes:nil];
//        
//    });
//}
@end

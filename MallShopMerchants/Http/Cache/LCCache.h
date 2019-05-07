//
//  LCCache.h
//  fish
//
//  Created by HuZeSen on 16/1/22.
//  Copyright © 2016年 GZLC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LCCache : NSCache

+ (LCCache *)sharedInstance;

/**
 *  缓存数据
 *
 *  @param data 可以为NSData,NSDictionary等
 *  @param key  
 */
- (void)cacheData:(id)data forKey:(NSString *)key;

/**
 *  获取之前缓存的数据,而且缓存的是字典类型的数据,方便转化成model
 *
 *  @param nameArr model名字
 *  @param keyArr  对应的key值
 *
 *  @return 返回1或者多个model
 */
- (NSArray *)getCacheModelsArrayWithNameArray:(NSArray<NSString *> *)nameArr keyArray:(NSArray<NSString *> *)keyArr;

/**
 *  如果缓存的是字典类型的,如果对上一个方法有疑问,可以用这个检查下缓存的数据
 *
 *  @param key
 */

- (NSDictionary *)getCacheDictionaryWithKey:(NSString *)key;
/**
 *  获取NSData类型的缓存
 *
 *  @param key
 */
- (NSData *)getCacheDataWithKey:(NSString *)key;

@end

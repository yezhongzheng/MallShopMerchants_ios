//
//  XRSYNetworkingHelper.h
//  XRSY
//
//  Created by yezhongzheng on 2017/5/18.
//  Copyright © 2017年 yezhongzheng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NetworkingManager : NSObject

DECLARE_SINGLETON(NetworkingManager, shareNetworkingManager);

/**
 *GET请求方式
 *param url: 接口路径
 *param params: 接口中所需要的参数, 为nil
 *param success: 数据获取成功
 *param failure: 数据获取失败555555
 */

- (void)requestDataThroughTheGETMethodWithUrl:(NSString *)url params:(NSDictionary *)params success:(void(^)(NSDictionary *responseObject))success failure:(void(^)(NSError *error))failure;


/**
 *POST请求方式
 *param url: 接口路径
 *param params: 接口中所需要的参数
 *param success: 数据获取成功
 *param failure: 数据获取失败
 */

- (void)requestDataThroughThePOSTMethodWithUrl:(NSString *)url params:(NSDictionary *)params success:(void(^)(NSDictionary *responseObject))success failure:(void(^)(NSError *error))failure;



/**
 *  下载数据
 *
 *  @param URLString   下载数据的网址
 *  @param parameters  下载数据的参数
 *  @param success     下载成功的回调
 *  @param failure     下载失败的回调
 */
- (void)downLoadWithURLString:(NSString *)URLString
                   parameters:(id)parameters
                     progerss:(void (^)())progress
                      success:(void (^)())success
                      failure:(void (^)(NSError *error))failure;
/**
 *上传图片
 */
- (void)uploadTaskWithImage:(NSArray*)photosArr WithUrl:(NSString *)urlstr WithParams:(NSDictionary *)dict success:(void(^)(NSDictionary *responseObject))success failure:(void(^)(NSError *error))failure;

@end

//
//  XRSYNetworkingHelper.m
//  XRSY
//
//  Created by yezhongzheng on 2017/5/18.
//  Copyright © 2017年 yezhongzheng. All rights reserved.
//

#import "NetworkingManager.h"
#import <AFNetworking.h>
#import "LCAccount.h"

@implementation NetworkingManager

IMPLEMENT_SINGLETON(NetworkingManager, shareNetworkingManager);

#pragma mark - GET请求方式
- (void)requestDataThroughTheGETMethodWithUrl:(NSString *)url
                                       params:(NSDictionary *)params success:(void(^)(NSDictionary *responseObject))success failure:(void(^)(NSError *error))failure
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",@"application/json", @"text/json",@"text/plain",nil];
    [manager GET:url parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(error);
        }
    }];
}

#pragma mark - POST请求方式
- (void)requestDataThroughThePOSTMethodWithUrl:(NSString *)url
                                        params:(NSDictionary *)params success:(void(^)(NSDictionary *responseObject))success failure:(void(^)(NSError *error))failure
{
    LCAccount *account = [LCAccount sharedInstance];
    NSString *userID = [NSString stringWithFormat:@"%ld",(long)account.memberId];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",@"application/json", @"text/json",@"text/plain",nil];
    [manager.requestSerializer setValue:account.accesstoken forHTTPHeaderField:@"accesstoken"];
    [manager.requestSerializer setValue:userID forHTTPHeaderField:@"supplierid"];
    [manager POST:url parameters:params progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(error);
        }
    }];
}

//上传图片
- (void)uploadTaskWithImage:(NSArray*)photosArr WithUrl:(NSString *)urlstr WithParams:(NSDictionary *)dict success:(void(^)(NSDictionary *responseObject))success failure:(void(^)(NSError *error))failure {
    // 基于AFN3.0+ 封装的HTPPSession句柄
    LCAccount *account = [LCAccount sharedInstance];
    NSString *userID = [NSString stringWithFormat:@"%ld",(long)account.memberId];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer.timeoutInterval = 60;
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/plain", @"multipart/form-data", @"application/json", @"text/html", @"image/jpeg", @"image/png", @"application/octet-stream", @"text/json", nil];
    [manager.requestSerializer setValue:account.accesstoken forHTTPHeaderField:@"accesstoken"];
    [manager.requestSerializer setValue:userID forHTTPHeaderField:@"supplier_id"];
    NSString *url  = [BASE_URL stringByAppendingString:urlstr];
    // 在parameters里存放照片以外的对象
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0); //创建信号量
    [manager POST:url parameters:dict constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        // formData: 专门用于拼接需要上传的数据,在此位置生成一个要上传的数据体
        // 这里的_photoArr是你存放图片的数组
//        for (int i = 0; i < photosArr.count; i++) {
            UIImage *image = photosArr.firstObject;
            NSData *imageData = UIImageJPEGRepresentation(image, 0.5);
            // 在网络开发中，上传文件时，是文件不允许被覆盖，文件重名
            // 要解决此问题，
            // 可以在上传时使用当前的系统事件作为文件名
            NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
            // 设置时间格式
            [formatter setDateFormat:@"yyyyMMddHHmmss"];
            NSString *dateString = [formatter stringFromDate:[NSDate date]];
            NSString *fileName = [NSString  stringWithFormat:@"%@.png", dateString];
            /*
             *该方法的参数
             1. appendPartWithFileData：要上传的照片[二进制流]
             2. name：对应网站上[upload.php中]处理文件的字段（比如upload）
             3. fileName：要保存在服务器上的文件名
             4. mimeType：上传的文件的类型
             */
            [formData appendPartWithFileData:imageData name:@"file" fileName:fileName mimeType:@"image/png"]; //
//        }
    } progress:^(NSProgress * _Nonnull uploadProgress) {
//        NSLog(@"---上传进度--- %@",uploadProgress);
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"```上传成功``` %@",responseObject);
        dispatch_semaphore_signal(semaphore);//不管请求状态是什么，都得发送信号，否则会一直卡着进程
        if (success) {
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        NSLog(@"xxx上传失败xxx %@", error);
        dispatch_semaphore_signal(semaphore);//不管请求状态是什么，都得发送信号，否则会一直卡着进程
        if (failure) {
            failure(error);
        }
    }];
    dispatch_semaphore_wait(semaphore,DISPATCH_TIME_FOREVER);  //等待
}

#pragma mark - 下载数据
- (void)downLoadWithURLString:(NSString *)URLString parameters:(id)parameters progerss:(void (^)())progress success:(void (^)())success failure:(void (^)(NSError *))failure {
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:URLString]];
    NSURLSessionDownloadTask *downLoadTask = [manager downloadTaskWithRequest:request progress:^(NSProgress * _Nonnull downloadProgress) {
        if (progress) {
            progress();
        }
    } destination:^NSURL * _Nonnull(NSURL * _Nonnull targetPath, NSURLResponse * _Nonnull response) {
        return targetPath;
    } completionHandler:^(NSURLResponse * _Nonnull response, NSURL * _Nullable filePath, NSError * _Nullable error) {
        if (failure) {
            failure(error);
        }
    }];
    [downLoadTask resume];
}

/**
 *
 **/

@end

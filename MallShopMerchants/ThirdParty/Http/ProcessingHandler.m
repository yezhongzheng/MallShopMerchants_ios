//
//  ProcessingHandler.m
//  Mallshop
//
//  Created by 黄伟业 on 2019/1/14.
//  Copyright © 2019年 MongoliaForests. All rights reserved.
//

#import "ProcessingHandler.h"
#import "MJExtension.h"

@interface ProcessingHandler()
@property (nonatomic ,strong) NSMutableArray<NSString *> *identifiersArr;
@property (nonatomic, strong) NSMutableArray<NSDictionary *> *paramsArr;
@property (nonatomic, strong) NSMutableArray<NSString *> *modelArr;

@property (nonatomic, copy) SuccessfulBlock success_;
@property (nonatomic, copy) FailedBlock failed_;
@end

@implementation ProcessingHandler
IMPLEMENT_SINGLETON(ProcessingHandler, sharedInstance);

#pragma mark- getting
- (NSMutableArray *)identifiersArr
{
    if (_identifiersArr == nil)
    {
        _identifiersArr = [[NSMutableArray alloc]initWithCapacity:0];
    }
    return _identifiersArr;
}

- (NSMutableArray *)paramsArr
{
    if (_paramsArr == nil)
    {
        _paramsArr = [[NSMutableArray alloc]initWithCapacity:0];
    }
    return _paramsArr;
}

- (NSMutableArray *)modelArr
{
    if (_modelArr == nil)
    {
        _modelArr = [[NSMutableArray alloc]initWithCapacity:0];
    }
    return _modelArr;
}

- (void)cacheData
{
    @synchronized(self)
    {
        [self.identifiersArr removeAllObjects];
        [self.paramsArr removeAllObjects];
        [self.modelArr removeAllObjects];
    }
}

#pragma mark- method
- (void)addRequestIdentify:(NSString *)identify ParamsDic:(NSDictionary *)param ModelName:(NSString *)name
{
    @synchronized(self)
    {
        [self.identifiersArr addObject:identify];
        [self.paramsArr addObject:param?param:@{}];
        [self.modelArr addObject:name];
    }
}

#pragma mark- send
- (void)sendRequestWithSuccessBlock:(SuccessfulBlock)sBlock FaliedBlock:(FailedBlock)fBlock
{
    NSString *url  = [BASE_URL stringByAppendingString:self.identifiersArr.firstObject];
    NSDictionary *dict = self.paramsArr.firstObject;
    NSMutableArray *Array = [[NSMutableArray alloc]initWithArray:self.modelArr];
    [self cacheData];
    [[NetworkingManager shareNetworkingManager]requestDataThroughThePOSTMethodWithUrl:url params:dict success:^(NSDictionary *responseObject) {
        NSMutableArray *modelArray = [[NSMutableArray alloc]initWithCapacity:0];
        [modelArray addObject:[NSClassFromString(Array.firstObject) objectWithKeyValues:responseObject]];
        NSString * retcode = responseObject[@"ret_code"];
        if(retcode.integerValue == 100001){
            [LCAccount sharedInstance].logined = NO;
            [LCAccount sharedInstance].accesstoken = @"";
        }
        !sBlock?:sBlock(modelArray,0);
    } failure:^(NSError *error) {
        NSLog(@"%@", error);
        !fBlock?:fBlock(@"请求失败",error.code);
    }];
}


@end

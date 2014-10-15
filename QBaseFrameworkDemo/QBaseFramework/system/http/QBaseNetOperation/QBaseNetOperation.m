//
//  QBaseNetOperation.m
//  QBase_Client
//
//  Created by andy on 10/13/14.
//  Copyright (c) 2014 Andy Jin. All rights reserved.
//

#import "QBaseNetOperation.h"
#import "NSString+ArchiveCache.h"
#import "NSDictionary+OperationURL.h"

@implementation QBaseNetOperation

- (id)init
{
    if (self = [super init]) {
        
        // 默认URL为空
        self.url = nil;
        
        // 默认GET方法
        self.method = @"GET";
        
        // 默认响应标签为data
        self.responseDataTag = @"data";
        
        // 默认缓存机制打开
        self.isArchiveCache = YES;
        
        // 默认数据库缓存机制打开
        self.isDatabaseCache = YES;
        
        // 用户自定义匹配
        [self configOperation];
    }
    
    return self;
}

#pragma mark -
#pragma mark - Public Method

/**
 *  初始化
 */
+ (id)operationWithDelegate:(id<QBaseNetOperationDelegate>)delegate
{
    QBaseNetOperation *operation = [[[self class] alloc] init];
    operation.delegate = delegate;
    
    return operation;
}

/**
 *  开始任务
 */
- (void)start
{
    [self prepareOperation];
}


#pragma mark -
#pragma mark - 子类重写函数

/**
 *  配置信息
 */
- (void)configOperation
{

}

/**
 *  请求行为函数
 */
- (void)execute
{
    if ([self.method isEqualToString:@"GET"]) {
        
        [self getRequest];
    
    }else if ([self.method isEqualToString:@"POST"]) {
    
        [self postRequest];
    
    }else {
    
        NSLog(@"%@类 Method参数设置出错.", [self class]);
        
    }
}

/**
 *  解析请求响应字典数据
 */
- (NSArray *)parseResponseData:(NSDictionary *)responseData
{
    NSMutableArray *dataArray = [NSMutableArray array];
    
    NSArray *arr;
    
    NSObject *data = [responseData objectForKey:_responseDataTag];
    
    if ([data isKindOfClass:[NSDictionary class]]) {
        
        arr = @[(NSDictionary *)data];
    
    }else if([data isKindOfClass:[NSArray class]]) {
        
        arr = (NSArray *)data;
    
    }else {
    
        NSLog(@"%@ 对应服务器数据有误", [self class]);
        
        return nil;
    }
    
    NSString *modelClassStr = [NSStringFromClass(self.class) stringByReplacingOccurrencesOfString:@"Operation" withString:@"Model"];

    Class ModelClass = NSClassFromString(modelClassStr);

    if (!ModelClass) {
        
        NSLog(@"请声明对象 %@", ModelClass);
        return nil;
    }
    
    for (NSDictionary *dict in arr) {
        
        NSMutableDictionary *d = [NSMutableDictionary dictionaryWithDictionary:dict];
        [d setObject:@(1) forKey:@"qbase_id"];
        
        QBaseModel *model = [[[ModelClass class] alloc] initWithDictionary:d
                                                                     error:nil];
 
        if (model) {
            
            if (_isDatabaseCache) {
                
                [model insertTable];
            }
            
            [dataArray addObject:model];
        }
    }
    
    return dataArray;
}


#pragma mark -
#pragma mark - Private Method

- (void)prepareOperation
{
    QBaseNetStatus status = [[QBaseNetworkObserver sharedQBaseNetworkObserver] status];
    
    switch (status) {
        case QBaseNetStatus_None:
            
            [self handleArchiveCache];
            
            break;
            
        case QBaseNetStatus_WiFi:
        case QBaseNetStatus_WWAN:
            
            [self execute];
            break;
    }
}


#pragma mark -
#pragma mark - 归档处理

/**
 *  归档缓存处理
 */
- (void)handleArchiveCache
{
    // 回调, 通知是否存在缓存
    if ([[self completeURL] archiveCache]) {
        
        _responseData = [[self completeURL] archiveCache];
        
        _dataArray = [self parseResponseData:_responseData];
        
        [self successCallback];
        
    }else {
        
        _error = [NSError errorWithDomain:@"不存在缓存文件"
                                     code:1001
                                 userInfo:nil];
    
        [self failedCallback];
    }
}


#pragma mark -
#pragma mark - Callback Handle

- (void)successCallback
{
    // 请求成功回调
    if (self.delegate && [self.delegate respondsToSelector:@selector(netOperationDidFinish:)]) {
        [self.delegate performSelector:@selector(netOperationDidFinish:)
                            withObject:self];
    }
    
    // 请求成功, 显示异常界面
    if ([self.delegate isKindOfClass:[QBaseViewController class]] &&
        [(QBaseViewController *)self.delegate respondsToSelector:@selector(hiddenErrorView)]) {
        [(QBaseViewController *)self.delegate performSelector:@selector(hiddenErrorView)];
    }
}

- (void)failedCallback
{
    // 请求失败回调
    if (self.delegate && [self.delegate respondsToSelector:@selector(netOperationDidFailed:)]) {
        [self.delegate performSelector:@selector(netOperationDidFailed:)
                            withObject:self];
    }
    
    // 请求失败, 隐藏异常界面
    if ([self.delegate isKindOfClass:[QBaseViewController class]] &&
        [(QBaseViewController *)self.delegate respondsToSelector:@selector(showErrorView)]) {
        [(QBaseViewController *)self.delegate performSelector:@selector(showErrorView)];
    }
}

#pragma mark -
#pragma mark - Request Method

- (QBaseRequest *)request
{
    return [QBaseRequest sharedQBaseRequest];
}

- (void)getRequest
{
    QBaseRequest *request = [self request];
    
    [request GET:_url
          params:_params
        complete:^(id result, NSError *err) {
        
            [self requestComplete:result error:err];
    }];
}

- (void)postRequest
{
    QBaseRequest *request = [self request];
    
    [request POST:_url
           params:_params
             body:^(id<AFMultipartFormData> formData) {
                 
                 if (_bodyBlock) {
                     _bodyBlock(formData);
                 }
             }
         complete:^(id result, NSError *err) {
            
             [self requestComplete:result error:err];
         }];
}

/**
 *  请求完成统一处理数据结果
 */
- (void)requestComplete:(id)result error:(NSError *)error
{
    if (error) {
        _error = error;
        [self failedCallback];
        return ;
    }
    
    if ([result isKindOfClass:[NSDictionary class]]) {
        _responseData = result;
    }
    
    if (self.isArchiveCache && result && [result isKindOfClass:[NSDictionary class]]) {
        
        NSData * data = [NSKeyedArchiver archivedDataWithRootObject:result];
        
        [data writeToFile:[self.completeURL archiveCachePath]
               atomically:YES];
    }
    
    _dataArray = [self parseResponseData:_responseData];
    
    [self successCallback];
}

#pragma mark -
#pragma mark - Getting

/**
 *  完整的URL路径
 */
- (NSString *)completeURL
{
    NSString *completeURL;
    
    if (self.url && !self.params) {
    
        completeURL = self.url;
    
    }else {
    
        completeURL = [NSString stringWithFormat:@"%@?%@", self.url, [self.params operationURL]];
    }
    
    return completeURL;
}

@end

//
//  QBaseNetOperation.h
//  QBase_Client
//
//  Created by andy on 10/13/14.
//  Copyright (c) 2014 Andy Jin. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "QBaseNetworkObserver.h"
#import "NSString+ArchiveCache.h"
#import "NSDictionary+OperationURL.h"
#import "QBaseNetOperationURLHeader.h"

// 是否全局获取本地文件
#define IS_LOADING_LOCAL_JSON 0

@class QBaseNetOperation;
typedef void (^QBaseHTTPCompleteBlock) (QBaseNetOperation *operation);
typedef void (^QBaseHTTPBodyBlock) (id<AFMultipartFormData>formData);

@class QBaseRequest;
@protocol QBaseNetOperationDelegate <NSObject>

- (void)netOperationDidFinish:(QBaseNetOperation *)operation;
- (void)netOperationDidFailed:(QBaseNetOperation *)operation;

@end

@interface QBaseNetOperation : NSObject
/**
 *  代理
 */
@property (nonatomic, assign) id<QBaseNetOperationDelegate> delegate;

/**
 *  是否读取本地Json数据, 忽略HTTP请求
 */
@property (nonatomic, assign) BOOL isLoadingLocalJson;

/**
 *  本地Json模拟数据
 */
@property (nonatomic, copy) NSString *localJsonPath;

/**
 *  请求服务器URL
 */
@property (nonatomic, copy)   NSString *url;

/**
 *  请求参数
 */
@property (nonatomic, strong) NSDictionary *params;

/**
 *  完整的GET_URL
 */
@property (nonatomic, copy, readonly) NSString *completeURL;

/**
 *  请求方法
 */
@property (nonatomic, copy) NSString *method;

/**
 *  请求体
 */
@property (nonatomic, strong) QBaseHTTPBodyBlock bodyBlock;

/**
 *  请求标识符
 */
@property (nonatomic, assign) NSInteger tag;

/**
 *  请求响应Json字典
 */
@property (nonatomic, strong) NSDictionary *responseData;

/**
 *  返回Json数据源的标签
 */
@property (nonatomic, strong) NSString *responseDataTag;

/**
 *  请求响应解析数组
 */
@property (nonatomic, strong) NSArray *dataArray;

/**
 *  请求报错信息
 */
@property (nonatomic, strong) NSError *error;

/**
 *  是否缓存归档
 */
@property (nonatomic, assign) BOOL isArchiveCache;

/**
 *  是否数据库自动插入数据
 */
@property (nonatomic, assign) BOOL isDatabaseCache;

/**
 *  初始化请求任务对象
 */
+ (id)operationWithDelegate:(id<QBaseNetOperationDelegate>)delegate;

/**
 *  设置请求体内容
 *
 *  @param bodyBlock 请求体内容Block
 */
- (void)setBodyBlock:(QBaseHTTPBodyBlock)bodyBlock;

/**
 *  开始请求任务
 */
- (void)start;

#pragma mark -
#pragma mark 重写函数

/**
 *  重写请求类
 */
- (QBaseRequest *)request;

/**
 *  配置网络请求任务
 */
- (void)configOperation;

@end

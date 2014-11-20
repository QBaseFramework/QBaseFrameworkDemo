//
//  QBaseUserInfo.h
//  QBase_Client
//
//  Created by andy on 10/18/14.
//  Copyright (c) 2014 Andy Jin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QBaseUserInfo : NSObject
DEFINE_SINGLETON_FOR_HEADER(QBaseUserInfo)

/**
 *  是否首次登陆
 */
@property (nonatomic, assign, readonly) BOOL isFirstLogin;

/**
 *  用户信息
 */
@property (nonatomic, strong, readonly) NSDictionary *userInfo;

/**
 *  注册用户信息
 *
 *  @param userInfo 用户信息
 */
- (void)registUserInfo:(NSDictionary *)userInfo;

/**
 *  登出抹除数据
 */
- (void)logout;

@end

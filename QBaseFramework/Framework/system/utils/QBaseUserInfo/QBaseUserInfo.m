//
//  QBaseUserInfo.m
//  QBase_Client
//
//  Created by andy on 10/18/14.
//  Copyright (c) 2014 Andy Jin. All rights reserved.
//

#import "QBaseUserInfo.h"

#define QBASE_USER_INFO_KEY @"QBASE_USER_INFO_KEY"

@implementation QBaseUserInfo
Q_DEFINE_SINGLETON_FOR_CLASS(QBaseUserInfo)

/**
 *  是否首次登陆
 *
 *  @return YES:首次登陆 NO:已经登陆
 */
- (BOOL)isFirstLogin
{
    return [self userInfo] ? YES : NO;
}

/**
 *  注册用户信息
 */
- (void)registUserInfo:(NSDictionary *)userInfo
{
    [[NSUserDefaults standardUserDefaults] setObject:userInfo
                                              forKey:QBASE_USER_INFO_KEY];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

/**
 *  获取用户信息
 *
 *  @return 用户信息
 */
- (NSDictionary *)userInfo
{
    return [[NSUserDefaults standardUserDefaults] objectForKey:QBASE_USER_INFO_KEY];
}


/**
 *  登出抹除数据
 */
- (void)logout
{
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:QBASE_USER_INFO_KEY];
}

@end

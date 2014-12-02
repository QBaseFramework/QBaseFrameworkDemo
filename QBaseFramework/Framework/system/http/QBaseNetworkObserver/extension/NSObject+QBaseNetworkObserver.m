//
//  NSObject+QBaseNetworkObserver.m
//  QBase_Client
//
//  Created by andy on 10/12/14.
//  Copyright (c) 2014 Andy Jin. All rights reserved.
//

#import "NSObject+QBaseNetworkObserver.h"

@implementation NSObject (QBaseNetworkObserver)

/**
 *  注册网络状态变化通知
 */
- (void)registNetStatusNotification
{
    [[QBaseNetworkObserver shareInstance] registNotification:self
                                                    selector:@selector(netStatusChangedCallback:)];
}

/**
 *  移除网络状态变化通知
 */
- (void)removeNetStatusNotification
{
    [[QBaseNetworkObserver shareInstance] removeNotification:self];
}

/**
 *  网络状态变化回调
 */
- (void)netStatusChangedCallback:(NSNotification *)note
{
    
}

@end

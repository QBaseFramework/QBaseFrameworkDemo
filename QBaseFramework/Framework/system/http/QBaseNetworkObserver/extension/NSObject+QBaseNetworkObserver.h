//
//  NSObject+QBaseNetworkObserver.h
//  QBase_Client
//
//  Created by andy on 10/12/14.
//  Copyright (c) 2014 Andy Jin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "QBaseNetworkObserver.h"

@interface NSObject (QBaseNetworkObserver)
/**
 *  注册网络状态变化通知
 */
- (void)registNetStatusNotification;

/**
 *  移除网络状态变化通知
 */
- (void)removeNetStatusNotification;

/**
 *  网络状态变化回调
 */
- (void)netStatusChangedCallback:(NSNotification *)note;

@end

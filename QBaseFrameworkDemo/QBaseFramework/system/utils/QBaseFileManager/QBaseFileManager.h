//
//  QBaseFileManager.h
//  QBase_Client
//
//  Created by andy on 10/18/14.
//  Copyright (c) 2014 Andy Jin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QBaseFileManager : NSObject

// 加载扩展

/**
 *  获取设备剩余空间
 *
 *  @return KB
 */
- (float)freespace;

/**
 *  获取设备总空间
 *
 *  @return KB
 */
- (float)allspace;

@end

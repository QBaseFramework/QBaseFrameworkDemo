//
//  QBaseFileManager.m
//  QBase_Client
//
//  Created by andy on 10/18/14.
//  Copyright (c) 2014 Andy Jin. All rights reserved.
//

#import "QBaseFileManager.h"
#import <sys/param.h>
#import <sys/mount.h>

@implementation QBaseFileManager

#pragma mark -
#pragma mark 共有函数

/**
 *  获取设备剩余空间
 */
- (float)allspace
{
    NSDictionary *fattributes = [[NSFileManager defaultManager] attributesOfFileSystemForPath:NSHomeDirectory() error:nil];
    return [[fattributes objectForKey:NSFileSystemSize] floatValue];
}

/**
 *  获取设备总空间
 */
- (float)freespace
{
    NSDictionary *fattributes = [[NSFileManager defaultManager] attributesOfFileSystemForPath:NSHomeDirectory() error:nil];
    return [[fattributes objectForKey:NSFileSystemFreeSize] floatValue];
}

@end

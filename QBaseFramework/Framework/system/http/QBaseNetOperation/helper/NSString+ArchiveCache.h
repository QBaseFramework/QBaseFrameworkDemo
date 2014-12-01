//
//  NSString+ArchiveCache.h
//  QBase_Client
//
//  Created by andy on 10/12/14.
//  Copyright (c) 2014 Andy Jin. All rights reserved.
//

#import <Foundation/Foundation.h>
#define QBASE_ARCHIVE_CACHE_PATH [NSString stringWithFormat:@"%@/Library/Caches/ArchiveCache", NSHomeDirectory()]

@interface NSString (ArchiveCache)

/**
 *  获取归档缓存文件路径
 */
- (NSString *)archiveCachePath;


/**
 *  根据请求链接查找本地缓存
 *
 *  @return 本地缓存数据
 */
- (NSDictionary *)archiveCache;

@end

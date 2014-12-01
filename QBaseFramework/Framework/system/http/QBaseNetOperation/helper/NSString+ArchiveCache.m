//
//  NSString+ArchiveCache.m
//  QBase_Client
//
//  Created by andy on 10/12/14.
//  Copyright (c) 2014 Andy Jin. All rights reserved.
//

#import "NSString+ArchiveCache.h"

@implementation NSString (ArchiveCache)

- (NSString *)archiveCachePath
{
    // MD5
    NSString *fileName = [self stringByReplacingOccurrencesOfString:@"/" withString:@"|"];
    
    // 归档存放路径
    NSString *filePath = [NSString stringWithFormat:@"%@/%@", QBASE_ARCHIVE_CACHE_PATH, fileName];
    
    return filePath;
}


- (NSDictionary *)archiveCache
{
    NSDictionary *archiveContent = nil;
    
    NSString *filePath = [self archiveCachePath];
    
    // 归档文件是否存在
    BOOL isExist = [[NSFileManager defaultManager] fileExistsAtPath:filePath];
    
    // 如果存在缓存, 读取文件内容
    if (isExist) {
    
        NSData * data = [NSData dataWithContentsOfFile:filePath];
        
        archiveContent = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    }
    
    return archiveContent;
}

@end

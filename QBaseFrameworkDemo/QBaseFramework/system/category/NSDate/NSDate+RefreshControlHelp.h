//
//  NSDate+RefreshControlHelp.h
//  NSDate
//
//  Created by andy on 11/12/14.
//  Copyright (c) 2014 ric. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (RefreshControlHelp)

/**
 *  比较时间（self），获取间隔
 */
- (NSInteger)compareWithDate:(NSDate *)date;

/**
 *  比较时间（当前时间），获取间隔
 */
+ (NSInteger)compareCurrentTimeWithDate:(NSDate *)date;

/**
 *  判断时间是否超时
 */
- (BOOL)isTimeout:(NSDate *)date interval:(NSInteger)interval;

@end

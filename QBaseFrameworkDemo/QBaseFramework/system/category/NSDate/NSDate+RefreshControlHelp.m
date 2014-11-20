//
//  NSDate+RefreshControlHelp.m
//  NSDate
//
//  Created by andy on 11/12/14.
//  Copyright (c) 2014 ric. All rights reserved.
//

#import "NSDate+RefreshControlHelp.h"

@implementation NSDate (RefreshControlHelp)

/**
 *  比较时间（self），获取间隔
 */
- (NSInteger)compareWithDate:(NSDate *)date
{
    return abs([self timeIntervalSinceDate:date]);
}

/**
 *  比较时间（当前时间），获取间隔
 */
+ (NSInteger)compareCurrentTimeWithDate:(NSDate *)date
{
    return [[NSDate date] compareWithDate:date];
}

/**
 *  判断时间是否超时
 */
- (BOOL)isTimeout:(NSDate *)date interval:(NSInteger)interval
{
    return [self compare:date] > interval ? YES : NO;
}


@end

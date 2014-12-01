//
//  QBaseViewController+LocationGeocoder.m
//  Test
//
//  Created by andy on 10/20/14.
//  Copyright (c) 2014 Andy Jin. All rights reserved.
//

#import "QBaseViewController+LocationGeocoder.h"

@implementation QBaseViewController (LocationGeocoder)

/**
 *  获取当前经纬度
 */
- (void)locationCoordinate
{
    [[QBaseLocationGeocoder sharedGeocoder] geocode:^(BOOL success) {
       
        if ([self respondsToSelector:@selector(locationGeocoder:complete:)]) {
            [self locationGeocoder:(QBaseLocationGeocoder *)[QBaseLocationGeocoder sharedGeocoder] complete:success];
        }
    }];
}

/**
 *  获取当前经纬度下的相关信息
 */
- (void)locationDetails
{
    [[QBaseLocationGeocoder sharedGeocoder] reverseGeocode:^(BOOL success) {
        
        if ([self respondsToSelector:@selector(locationGeocoder:complete:)]) {
            [self locationGeocoder:(QBaseLocationGeocoder *)[QBaseLocationGeocoder sharedGeocoder] complete:success];
        }
    }];
}

@end

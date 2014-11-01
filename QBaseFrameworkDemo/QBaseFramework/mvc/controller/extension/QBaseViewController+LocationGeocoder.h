//
//  QBaseViewController+LocationGeocoder.h
//  Test
//
//  Created by andy on 10/20/14.
//  Copyright (c) 2014 Andy Jin. All rights reserved.
//

#import "QBaseViewController.h"

@interface QBaseViewController (LocationGeocoder)

/**
 *  获取当前经纬度
 */
- (void)locationCoordinate;

/**
 *  获取当前经纬度下的详细信息
 */
- (void)locationDetails;

@end

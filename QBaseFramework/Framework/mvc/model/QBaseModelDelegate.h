//
//  QBaseModelDelegate.h
//  QBaseFramework
//
//  Created by andy on 12/1/14.
//  Copyright (c) 2014 Andy Jin. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol QBaseModelDelegate <NSObject>

@optional
/**
 *  唯一索引
 */
@property (nonatomic, readonly) NSString *uniqueIndex;

@end

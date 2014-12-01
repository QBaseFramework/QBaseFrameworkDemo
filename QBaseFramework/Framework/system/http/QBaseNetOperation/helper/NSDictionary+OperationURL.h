//
//  NSDictionary+OperationURL.h
//  QBase_Client
//
//  Created by andy on 10/15/14.
//  Copyright (c) 2014 Andy Jin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (OperationURL)

/**
 *  转化成请求链接形式的URL
 *
 *  @return URL 格式: [key=value&key=value&...]
 */
- (NSString *)operationURL;

@end

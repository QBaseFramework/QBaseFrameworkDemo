//
//  NSDictionary+OperationURL.m
//  QBase_Client
//
//  Created by andy on 10/15/14.
//  Copyright (c) 2014 Andy Jin. All rights reserved.
//

#import "NSDictionary+OperationURL.h"

@implementation NSDictionary (OperationURL)

- (NSString *)operationURL
{
    if (self == nil) {
        return @"_NO_PARAMS";
    }
    
    NSMutableString *url = [NSMutableString string];

    [self enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
    
        if ([key isKindOfClass:[NSString class]] &&
            [obj isKindOfClass:[NSString class]]) {
         
            if (url.length != 0) {
                [url appendString:@"&"];
            }
            
            [url appendString:key];
            [url appendString:@"="];
            [url appendString:obj];
        }
    }];
    
    return url;
}

@end

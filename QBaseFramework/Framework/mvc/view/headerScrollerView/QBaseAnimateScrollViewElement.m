//
//  QBaseAnimateScrollViewElement.m
//  QBaseFrameworkDemo
//
//  Created by andy on 11/3/14.
//  Copyright (c) 2014 Andy Jin. All rights reserved.
//

#import "QBaseAnimateScrollViewElement.h"

@implementation QBaseAnimateScrollViewElement

- (instancetype)initUsedXIB:(BOOL)usedXIB
{
    
    if (usedXIB) {
        return [[self class] initViewFromXIB];
    }
    
    return [[[self class] alloc] init];
}


- (void)setDataModel:(QBaseModel *)dataModel
{    
}

@end

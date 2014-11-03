//
//  QBaseView.m
//  QBaseFrameworkDemo
//
//  Created by andy on 11/3/14.
//  Copyright (c) 2014 Andy Jin. All rights reserved.
//

#import "QBaseView.h"

@implementation QBaseView
/**
 *  加载XIB
 */
+ (instancetype)initViewFromXIB
{
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class])
                                          owner:nil
                                        options:nil] lastObject];
}

@end

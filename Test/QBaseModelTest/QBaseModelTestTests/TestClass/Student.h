//
//  Student.h
//  QBaseModelTest
//
//  Created by andy on 12/1/14.
//  Copyright (c) 2014 Andy Jin. All rights reserved.
//

#import <QBaseFramework/QBaseFramework.h>

@interface Student : QBaseModel

@property (nonatomic, assign) int uid;

#pragma mark -
#pragma mark 基础类型测试
@property (nonatomic, assign) char q_char;
@property (nonatomic, assign) short q_short;
@property (nonatomic, assign) int q_int;
@property (nonatomic, assign) long q_long;
@property (nonatomic, assign) long long q_long_long;
@property (nonatomic, assign) float q_float;
@property (nonatomic, assign) double q_double;

#pragma mark -
#pragma mark 对象类型测试

@property (nonatomic, copy) NSString *q_string;
@property (nonatomic, strong) NSNumber *q_number;
@property (nonatomic, strong) NSArray *q_array;
@property (nonatomic, strong) NSMutableArray *q_m_array;
@property (nonatomic, strong) NSDictionary *q_dictionary;
@property (nonatomic, strong) NSMutableDictionary *q_m_dictionary;

@end

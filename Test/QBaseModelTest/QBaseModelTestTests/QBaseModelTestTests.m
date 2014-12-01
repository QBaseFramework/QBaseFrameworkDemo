//
//  QBaseModelTestTests.m
//  QBaseModelTestTests
//
//  Created by andy on 12/1/14.
//  Copyright (c) 2014 Andy Jin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "Student.h"

@interface QBaseModelTestTests : XCTestCase
{
    Student *_stu;
}
@end

@implementation QBaseModelTestTests

- (void)setUp {
    [super setUp];

    NSDictionary *params = @{
                                @"uid"           : @(1),
                                @"q_char"        : @"c",
                                @"q_short"       : @(1),
                                @"q_int"         : @(2),
                                @"q_long"        : @(3),
                                @"q_long_long"   : @(4),
                                @"q_float"       : @(5.555),
                                @"q_double"      : @(6.666),
                                @"q_string"      : @"string",
                                @"q_number"      : @(7),
                                @"q_array"       : @[@"1",@"2"],
                                @"q_m_array"     : [@[@"1",@"2"] mutableCopy],
                                @"q_dictionary"  : @{@"1":@"2"},
                                @"q_m_dictionary": [@{@"1":@"2"} mutableCopy],
                            };
    _stu = [[Student alloc] initWithDictionary:params error:nil];
}

- (void)tearDown {
    [super tearDown];
}

- (void)testLog
{
    NSLog(@"%@", _stu);
}


@end

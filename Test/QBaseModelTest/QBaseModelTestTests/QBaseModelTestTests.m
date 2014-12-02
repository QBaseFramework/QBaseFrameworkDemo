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

- (void)testInsert
{
    BOOL hasInsert = [_stu insertTable];
    QBASE_LOG(@"插入结果: %d", hasInsert);
}

- (void)testDelete
{
    BOOL hasDelete = [[[_stu selectFromTable] lastObject] deleteFromTable];
    QBASE_LOG(@"删除结果: %d", hasDelete);
}

- (void)testUpdate
{
    _stu = [[_stu selectFromTable] lastObject];
    
    _stu.q_char = 10;
    _stu.q_short = 10;
    _stu.q_int = 10;
    _stu.q_long = 10;
    _stu.q_long_long = 10;
    _stu.q_float = 10.10;
    _stu.q_float = 10.10;
    
    _stu.q_number = @(10);
    _stu.q_string = @"Update";
    _stu.q_array = @[@"Update"];
    _stu.q_m_array = [@[@"Update"] mutableCopy];
    _stu.q_dictionary = @{@"Update":@"Update"};
    _stu.q_m_dictionary = [@{@"Update":@"Update"} mutableCopy];

    [_stu updateTable];
}

- (void)testSelect
{
    NSArray *selectArr = [_stu selectByConditions:@"uid=1"
                                             args:nil
                                       pageNumber:1
                                         pageSize:1
                                            order:nil];
    QBASE_LOG(@"%ld", selectArr.count);
}

- (void)testDrop
{
    BOOL hasDrop = [_stu dropTable];
    QBASE_LOG(@"是否移除表: %d", hasDrop);
}


@end

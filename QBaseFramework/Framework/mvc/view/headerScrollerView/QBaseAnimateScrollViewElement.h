//
//  QBaseAnimateScrollViewElement.h
//  QBaseFrameworkDemo
//
//  Created by andy on 11/3/14.
//  Copyright (c) 2014 Andy Jin. All rights reserved.
//

#import "QBaseView.h"

@interface QBaseAnimateScrollViewElement : QBaseView
{

}
@property (nonatomic, strong) QBaseModel *dataModel;

/**
 *  初始化对象
 *
 *  @param usedXIB 是否通过XIB
 *
 *  @return 返回初始化对象
 */
- (instancetype)initUsedXIB:(BOOL)usedXIB;

@end

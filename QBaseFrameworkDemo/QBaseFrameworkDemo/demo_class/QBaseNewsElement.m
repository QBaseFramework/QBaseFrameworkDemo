//
//  QBaseNewsElement.m
//  QBaseFrameworkDemo
//
//  Created by andy on 11/4/14.
//  Copyright (c) 2014 Andy Jin. All rights reserved.
//

#import "QBaseNewsElement.h"
#import "QBaseNewsModel.h"
@implementation QBaseNewsElement

- (void)setDataModel:(QBaseModel *)dataModel
{
    QBaseNewsModel *newsModel = (QBaseNewsModel *)dataModel;

    self.titleLabel.text = newsModel.imageName;
    [self.img loadImageWithURL:newsModel.path];
}

@end

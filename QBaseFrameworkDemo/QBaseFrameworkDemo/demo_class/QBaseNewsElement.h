//
//  QBaseNewsElement.h
//  QBaseFrameworkDemo
//
//  Created by andy on 11/4/14.
//  Copyright (c) 2014 Andy Jin. All rights reserved.
//

#import "QBaseAnimateScrollViewElement.h"

@interface QBaseNewsElement : QBaseAnimateScrollViewElement
@property (weak, nonatomic) IBOutlet UIImageView *img;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@end

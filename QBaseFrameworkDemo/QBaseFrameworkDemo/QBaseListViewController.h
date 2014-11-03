//
//  QBaseListViewController.h
//  QBaseFrameworkDemo
//
//  Created by andy on 11/3/14.
//  Copyright (c) 2014 Andy Jin. All rights reserved.
//

#import "QBaseViewController.h"

@interface QBaseListViewController : QBaseViewController<UITableViewDelegate, UITableViewDataSource>
{
    NSArray *_dataArray;
}

@end

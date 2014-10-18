//
//  QBaseWaterDropRefreshTableView.m
//  QBaseTableView
//
//  Created by andy on 10/16/14.
//  Copyright (c) 2014 Andy Jin. All rights reserved.
//

#import "QBaseWaterDropRefreshTableView.h"

@implementation QBaseWaterDropRefreshTableView

- (id)initWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
    self = [super initWithFrame:frame style:style];
    if (self) {

        self.refreshControl = [[ODRefreshControl alloc] initInScrollView:self
                                                   activityIndicatorView:nil];
        
        [self.refreshControl addTarget:self
                                action:@selector(dropViewDidBeginRefreshing:)
                      forControlEvents:UIControlEventValueChanged];
    }
    return self;
}

- (void)dropViewDidBeginRefreshing:(ODRefreshControl *)refreshControl
{
    if (self.qbase_delegate && [self.qbase_delegate respondsToSelector:@selector(tableViewBegainRefresh:)]) {
        [self.qbase_delegate performSelector:@selector(tableViewBegainRefresh:) withObject:self];
    }
}

- (void)endRefreshing
{
    [self.refreshControl performSelector:@selector(endRefreshing) withObject:nil afterDelay:1.0f];
}

@end

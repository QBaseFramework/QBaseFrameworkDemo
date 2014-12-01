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
    if (self.qbase_delegate && [self.qbase_delegate respondsToSelector:@selector(tableViewDidBegainRefresh:)]) {
        [self.qbase_delegate tableViewDidBegainRefresh:self];
    }
}

- (void)endRefreshing
{
    [self performSelector:@selector(prepareForEndingRefresh)
               withObject:nil
               afterDelay:1.0];
}

- (void)prepareForEndingRefresh
{
    [self.refreshControl endRefreshing];
    
    if (self.qbase_delegate && [self.qbase_delegate respondsToSelector:@selector(tableViewDidFinishRefresh:)]) {
        [self.qbase_delegate tableViewDidFinishRefresh:self];
    }
}

@end

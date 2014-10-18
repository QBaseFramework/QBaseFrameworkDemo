//
//  QBaseTableView.h
//  QBaseTableView
//
//  Created by andy on 10/16/14.
//  Copyright (c) 2014 Andy Jin. All rights reserved.
//

#import <UIKit/UIKit.h>

@class QBaseTableView;
@protocol QBaseTableViewDelegate <NSObject>

- (void)tableViewBegainRefresh:(QBaseTableView *)tableView;

@end

@interface QBaseTableView : UITableView
{
}

@property (nonatomic, assign) id<QBaseTableViewDelegate> qbase_delegate;

/**
 *  结束刷新
 */
- (void)endRefreshing;

@end

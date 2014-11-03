//
//  QBaseRefreshViewController.m
//  QBaseFrameworkDemo
//
//  Created by andy on 11/3/14.
//  Copyright (c) 2014 Andy Jin. All rights reserved.
//

#import "QBaseRefreshViewController.h"

@interface QBaseRefreshViewController ()

@end

@implementation QBaseRefreshViewController

#pragma mark -
#pragma mark 生命周期

- (void)viewDidLoad
{
    [super viewDidLoad];

    QBaseDemoTableView *t = [[QBaseDemoTableView alloc] initWithFrame:self.view.bounds];
    t.qbase_delegate = self;
    [self.view addSubview:t];
}

- (void)tableViewDidBegainRefresh:(QBaseTableView *)tableView
{
    NSLog(@"开始刷新");
    
    [tableView performSelector:@selector(endRefreshing)
                    withObject:nil
                    afterDelay:1.0];
}

- (void)tableViewDidFinishRefresh:(QBaseTableView *)tableView
{
    NSLog(@"结束刷新");
}

@end

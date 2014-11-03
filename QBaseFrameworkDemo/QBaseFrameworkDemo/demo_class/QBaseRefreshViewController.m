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

    QBaseAnimateScrollView *scrollView = [[QBaseAnimateScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, 300)];
    scrollView.qbase_dataSource = self;
    scrollView.qbase_delegate = self;
    t.tableHeaderView = scrollView;
}

#pragma mark -
#pragma mark QBaseScrollViewDataSource

- (NSInteger)numberOfPageInScrollView:(QBaseAnimateScrollView *)scrollView
{
    return 5;
}

- (QBaseAnimateScrollViewElement *)scrollView:(QBaseAnimateScrollView *)scrollView elementForCurrentIndex:(NSInteger)currentIndex
{
    QBaseAnimateScrollViewElement *e = [[QBaseAnimateScrollViewElement alloc] init];
    e.backgroundColor = currentIndex%2 == 0 ? [UIColor blackColor] : [UIColor redColor];
    return e;
}

#pragma mark -
#pragma mark QBaseScrollViewDelegate

- (void)scrollView:(QBaseAnimateScrollView *)scrollView didChangedCurrentPage:(NSInteger)currentPage
{
    NSLog(@"页码发生变化, 最新一页为%d", currentPage);
}

- (void)scrollView:(QBaseAnimateScrollView *)scrollView didSelectElementViewWithIndex:(NSInteger)index
{
    NSLog(@"元素被点击, 点击元素为第%d页", index);
}

#pragma mark -
#pragma mark Refresh Delegate

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

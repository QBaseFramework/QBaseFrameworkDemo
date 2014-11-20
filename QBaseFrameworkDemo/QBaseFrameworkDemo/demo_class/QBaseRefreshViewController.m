//
//  QBaseRefreshViewController.m
//  QBaseFrameworkDemo
//
//  Created by andy on 11/3/14.
//  Copyright (c) 2014 Andy Jin. All rights reserved.
//

#import "QBaseRefreshViewController.h"
#import "QBaseNewsModel.h"
#import "QBaseNewsOperation.h"

@interface QBaseRefreshViewController ()
{
    QBaseAnimateScrollView *_scrollView;
    
    NSMutableArray *_dataArray;
}
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

    
    
    _scrollView = [[QBaseAnimateScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, 300)];
    _scrollView.usedXIB = YES;
    _scrollView.isLoop = YES;
    _scrollView.animateInterval = 3.0f;
    _scrollView.qbase_delegate = self;
    t.tableHeaderView = _scrollView;
    
    [_scrollView loadFromOperation:[QBaseNewsOperation new] params:nil operationComplete:nil];
}

#pragma mark -
#pragma mark QBaseScrollViewDelegate

- (void)scrollView:(QBaseAnimateScrollView *)scrollView didChangedCurrentIndex:(NSInteger)index
{
    NSLog(@"页码发生变化, 最新一页为%d", index);
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
    
    [_scrollView stopAnimate];
    
    [tableView performSelector:@selector(endRefreshing)
                    withObject:nil
                    afterDelay:1.0];
}

- (void)tableViewDidFinishRefresh:(QBaseTableView *)tableView
{
    [_scrollView startAnimate];
    
    NSLog(@"结束刷新");
}

@end

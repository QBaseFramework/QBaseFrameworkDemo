//
//  QBaseRefreshViewController.m
//  QBaseFrameworkDemo
//
//  Created by andy on 11/3/14.
//  Copyright (c) 2014 Andy Jin. All rights reserved.
//

#import "QBaseRefreshViewController.h"
#import "QBaseNewsModel.h"

@interface QBaseRefreshViewController ()
{
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

    
    
    QBaseAnimateScrollView *scrollView = [[QBaseAnimateScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, 300)];
    scrollView.usedXIB = YES;
    scrollView.isLoop = YES;
    scrollView.animateInterval = 2;
    scrollView.qbase_delegate = self;
    t.tableHeaderView = scrollView;
    
    
    
    NSMutableArray *arr = [NSMutableArray new];
    for (int i = 0; i < 3; i++) {
        
        QBaseNewsModel *newsModel = [[QBaseNewsModel alloc] init];
        
        newsModel.title = [NSString stringWithFormat:@"%d", i];
        newsModel.imgPath = @"http://pic.nipic.com/2007-12-28/20071228114234633_2.jpg";
        
        [arr addObject:newsModel];
    }
    
    scrollView.dataArray = arr;
    [scrollView reloadData];
}

#pragma mark -
#pragma mark QBaseScrollViewDelegate

- (void)scrollView:(QBaseAnimateScrollView *)scrollView didChangedCurrentIndex:(NSInteger)index
{
    NSLog(@"页码发生变化, 最新一页为%ld", index);
}

- (void)scrollView:(QBaseAnimateScrollView *)scrollView didSelectElementViewWithIndex:(NSInteger)index
{
    NSLog(@"元素被点击, 点击元素为第%ld页", index);
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

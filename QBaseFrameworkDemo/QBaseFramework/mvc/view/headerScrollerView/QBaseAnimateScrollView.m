//
//  QBaseAnimateScrollView.m
//  QBaseFrameworkDemo
//
//  Created by andy on 11/3/14.
//  Copyright (c) 2014 Andy Jin. All rights reserved.
//

#import "QBaseAnimateScrollView.h"

@implementation QBaseAnimateScrollView
{

}

#pragma mark - 
#pragma mark Init

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        self.showsHorizontalScrollIndicator = NO;
        self.showsVerticalScrollIndicator = NO;
        
        self.pagingEnabled = YES;

        // 设置代理
        self.delegate = self;
        
        _timeInterval = 5.0f;
        _timer = [NSTimer scheduledTimerWithTimeInterval:_timeInterval
                                                  target:self
                                                selector:@selector(timerEvent:)
                                                userInfo:nil
                                                 repeats:YES];
    }
    
    return self;
}

- (void)timerEvent:(NSTimer *)timer
{
    [self setPage:_page];
}

#pragma mark -
#pragma mark 重置数据, 刷新界面

- (void)reloadData
{
    for (QBaseAnimateScrollViewElement *element in self.subviews) {
        [element removeFromSuperview];
    }
    
    CGRect frame = self.bounds;
    for (int i = 0; i < [self numberOfPages]; i++) {
        
        // 修正坐标
        frame.origin.x = i*CGRectGetWidth(self.bounds);
        
        // 添加元素
        QBaseAnimateScrollViewElement *element = [self.qbase_dataSource scrollView:self elementForCurrentIndex:i];
        element.frame = frame;
        [self addSubview:element];
        self.contentSize = CGSizeMake(self.width * [self numberOfPages],
                                      self.height);
        element.tag = i;

        // 添加手势
        element.userInteractionEnabled = YES;
        UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapRecognizerEvent:)];
        [element addGestureRecognizer:tapRecognizer];
    }
}

- (void)tapRecognizerEvent:(UITapGestureRecognizer *)tapRecognizer
{
    QBaseAnimateScrollViewElement *element = (QBaseAnimateScrollViewElement *)tapRecognizer.view;
    
    if (self.qbase_delegate && [self.qbase_delegate respondsToSelector:@selector(scrollView:didSelectElementViewWithIndex:)]) {
        [self.qbase_delegate scrollView:self didSelectElementViewWithIndex:element.tag];
    }
}

#pragma mark -
#pragma mark Helper

- (NSInteger)numberOfPages
{
    return [self.qbase_dataSource numberOfPageInScrollView:self];
}

#pragma mark -
#pragma mark Setting

- (void)setQbase_dataSource:(id<QBaseAnimateScrollViewDataSource>)qbase_dataSource
{
    _qbase_dataSource = qbase_dataSource;
    
    if (_qbase_dataSource) {
        [self reloadData];
    }
}

- (void)setPage:(NSInteger)page
{
    _page = page;
    
    CGPoint offset = CGPointMake(self.width * _page, 0);
    [self setContentOffset:offset animated:YES];
}

#pragma mark -
#pragma mark UIScrillViewDelegate

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    // 最新页码
    NSInteger currentPage = scrollView.contentOffset.x / self.width + 1;
 
    if (currentPage == _page) {
        return;
    }
    
    _page = currentPage;
    
    if (self.qbase_delegate && [self.qbase_delegate respondsToSelector:@selector(scrollView:didChangedCurrentPage:)]) {
        [self.qbase_delegate scrollView:self didChangedCurrentPage:_page];
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    
}

@end

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
    }
    
    return self;
}


#pragma mark -
#pragma mark 重置数据, 刷新界面

- (void)reloadData
{
    for (QBaseAnimateScrollViewElement *element in self.subviews) {
        [element removeFromSuperview];
    }

    NSInteger currentIndex;
    
    CGRect frame = self.bounds;
    
    NSInteger numberOfPages = (self.isLoop)?
                                            ([self numberOfPages]+2):
                                            ([self numberOfPages]);
    
    for (int i = 0; i < numberOfPages; i++) {
        
        // 修正坐标
        frame.origin.x = i*CGRectGetWidth(self.bounds);
        
        if (i == 0 && self.isLoop)
            currentIndex = [self numberOfPages];
        else if (i == [self numberOfPages]+1 && self.isLoop)
            currentIndex = 1;
        else
            currentIndex = i;
        
        if (self.isLoop) {
            currentIndex--;
        }
        
        // 通过Model, 获取Element的ClassName
        Class ElementClass = [self getElementClassFromModel:[_dataArray objectAtIndex:currentIndex]];
        
        // 添加元素
        QBaseAnimateScrollViewElement *element = [[ElementClass alloc] initUsedXIB:self.usedXIB];
        element.dataModel = [_dataArray objectAtIndex:currentIndex];
        element.frame = frame;
        [self addSubview:element];
        self.contentSize = CGSizeMake(self.width * numberOfPages,
                                      self.height);
        element.tag = currentIndex;

        // 添加手势
        element.userInteractionEnabled = YES;
        UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapRecognizerEvent:)];
        [element addGestureRecognizer:tapRecognizer];
    }
    
    self.contentOffset = self.isLoop ?
                                      CGPointMake(self.width, 0):
                                      CGPointMake(0, 0);
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
    return _dataArray.count;
}

- (NSInteger)adjustNumberOfPage:(NSInteger)currentPage
{
    if (currentPage == 0)
        currentPage = [self numberOfPages] - 1;
    else if (currentPage == [self numberOfPages]+1) {
        currentPage = 0;
    }else {
        currentPage--;
    }
    
    return currentPage;
}

/**
 *  通过Model, 获取Element的ClassName
 *
 *  @param baseModel 数据模型
 *
 *  @return 对应Element的Class
 */
- (Class)getElementClassFromModel:(id)baseModel
{
    Class class = [baseModel class];
    
    NSString *modelClassName = NSStringFromClass(class);
    
    NSString *elementClassName = [modelClassName stringByReplacingOccurrencesOfString:@"Model" withString:@"Element"];
    
    Class ElementClass = NSClassFromString(elementClassName);
    
    return ElementClass;
}

#pragma mark -
#pragma mark Setting

- (void)setPage:(NSInteger)page
{
    _page = page;
    
    if (self.isLoop) {
        CGPoint offset = CGPointMake(self.width * _page, 0);
        [self setContentOffset:offset animated:YES];
    }
}

#pragma mark -
#pragma mark UIScrillViewDelegate

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    // 最新页码
    NSInteger offsetPage = scrollView.contentOffset.x / self.width;
    
    NSInteger currentPage = self.isLoop?
                                        [self adjustNumberOfPage:offsetPage]:
                                        offsetPage;
    
    if (currentPage == _page) {
        return;
    }
    
    _page = currentPage;
    
    if (self.qbase_delegate && [self.qbase_delegate respondsToSelector:@selector(scrollView:didChangedCurrentIndex:)]) {
        [self.qbase_delegate scrollView:self didChangedCurrentIndex:_page];
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (!self.isLoop) {
        return;
    }
    
    CGFloat offsetX = scrollView.contentOffset.x;

    if (offsetX < self.width) {
        
        CGPoint point = self.contentOffset;
        point.x += (self.width * ([self numberOfPages]));
        self.contentOffset = point;
        
    }else if (offsetX > self.width* ([self numberOfPages]+1)) {
    
        CGPoint point = self.contentOffset;
        point.x -= (self.width * ([self numberOfPages]));
        self.contentOffset = point;
    }
}

#pragma mark -
#pragma mark Animate Action

- (void)setAnimateInterval:(NSTimeInterval)animateInterval
{
    if (!self.isLoop) {
        return;
    }
    
    if (animateInterval == 0) {
        [_timer invalidate];
        return;
    }
    
    if (_timeInterval == animateInterval && _timer) {
        [self startAnimate];
        return;
    }
    
    if (_timeInterval != animateInterval && _timer) {
        [_timer invalidate];
    }

    _isAnimate = YES;
    _timeInterval = animateInterval;
    _timer = [NSTimer scheduledTimerWithTimeInterval:_timeInterval
                                              target:self
                                            selector:@selector(timerEvent:)
                                            userInfo:nil
                                             repeats:YES];
}

- (void)timerEvent:(NSTimer *)timer
{
    _page = _page%([self numberOfPages]+1);
    
    if (_page++ == 0) {
        self.contentOffset = CGPointMake(self.width, 0);
        return;
    }
    
    [self setPage:_page];
}


- (void)startAnimate
{
    if (_timer && self.isLoop) {
        _isAnimate = YES;
        [_timer setFireDate:[NSDate distantPast]];
    }
}

- (void)stopAnimate
{
    if (_timer && self.isLoop) {
        _isAnimate = NO;
        [_timer setFireDate:[NSDate distantFuture]];
    }
}

@end

//
//  QBaseAnimateScrollView.h
//  QBaseFrameworkDemo
//
//  Created by andy on 11/3/14.
//  Copyright (c) 2014 Andy Jin. All rights reserved.
//

#import "QBaseScrollView.h"
#import "QBaseAnimateScrollViewElement.h"

@class QBaseAnimateScrollView;
@protocol QBaseAnimateScrollViewDataSource <NSObject>

@required
/**
 *  一共填充多少张图片
 */
- (NSInteger)numberOfPageInScrollView:(QBaseAnimateScrollView *)scrollView;
/**
 *  填充数据
 */
- (QBaseAnimateScrollViewElement *)scrollView:(QBaseAnimateScrollView *)scrollView elementForCurrentIndex:(NSInteger)currentIndex;
@end;

@protocol QBaseAnimateScrollViewDelegate<NSObject>
@optional
/**
 *  点击滚动视图元素, 代理回调
 */
- (void)scrollView:(QBaseAnimateScrollView *)scrollView didSelectElementViewWithIndex:(NSInteger)index;

/**
 *  滚动视图当前视图发生切换回调
 */
- (void)scrollView:(QBaseAnimateScrollView *)scrollView didChangedCurrentPage:(NSInteger)currentPage;

@end

@interface QBaseAnimateScrollView : QBaseScrollView<UIScrollViewDelegate>
{
    NSTimer *_timer;
    NSTimeInterval _timeInterval;
    
    NSInteger _page;
}
/**
 *  数据代理
 */
@property (nonatomic, assign) id<QBaseAnimateScrollViewDataSource> qbase_dataSource;
/**
 *  行为代理
 */
@property (nonatomic, assign) id<QBaseAnimateScrollViewDelegate> qbase_delegate;

/**
 *  刷新数据源
 */
- (void)reloadData;

@end

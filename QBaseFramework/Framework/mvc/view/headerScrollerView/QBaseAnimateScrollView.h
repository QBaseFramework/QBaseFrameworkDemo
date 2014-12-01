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

@protocol QBaseAnimateScrollViewDelegate<NSObject>
@optional
/**
 *  点击滚动视图元素, 代理回调
 */
- (void)scrollView:(QBaseAnimateScrollView *)scrollView didSelectElementViewWithIndex:(NSInteger)index;

/**
 *  滚动视图当前视图发生切换回调
 */
- (void)scrollView:(QBaseAnimateScrollView *)scrollView didChangedCurrentIndex:(NSInteger)currentIndex;
@end

@interface QBaseAnimateScrollView : QBaseScrollView<QBaseNetOperationDelegate,UIScrollViewDelegate>
{
    NSTimer *_timer;
    NSTimeInterval _timeInterval;
    
    NSInteger _page;

    QBaseHTTPCompleteBlock _httpCompleteBlock;
}

/**
 *  数据源
 */
@property (nonatomic, strong) NSArray *dataArray;

/**
 *  元素是否使用XIB生成
 */
@property (nonatomic, assign) BOOL usedXIB;

/**
 *  是否循环播放
 */
@property (nonatomic, assign) BOOL isLoop;

/**
 *  行为代理
 */
@property (nonatomic, assign) id<QBaseAnimateScrollViewDelegate> qbase_delegate;

/**
 *  刷新数据源
 */
- (void)reloadData;

/**
 *   加载数据
 *
 *  @param operation         请求任务
 *  @param params            请求参数
 *  @param httpCompleteBlock 请求回调
 */
- (void)loadFromOperation:(QBaseNetOperation *)operation
                   params:(NSDictionary *)params
        operationComplete:(QBaseHTTPCompleteBlock)httpCompleteBlock;

#pragma mark -
#pragma marl 轮播动画

/**
 *  动画间隔时间
 */
@property (nonatomic, assign) NSTimeInterval animateInterval;

/**
 *  是否正在轮播
 */
@property (nonatomic, assign, readonly) BOOL isAnimate;

/**
 *  开始动画
 */
- (void)startAnimate;

/**
 *  关闭动画
 */
- (void)stopAnimate;

@end

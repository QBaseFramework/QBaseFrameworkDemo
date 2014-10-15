//
//  QBaseViewController.m
//  QBaseViewController
//
//  Created by andy on 10/10/14.
//  Copyright (c) 2014 Andy Jin. All rights reserved.
//

#import "QBaseViewController.h"
#import "QBaseViewController+KeyBoardObserver.h"

@interface QBaseViewController ()

@end

@implementation QBaseViewController

#pragma mark -
#pragma mark - 异常处理

/**
 *  展示异常试图
 */
- (void)showErrorView
{
    if (!self.errorView) {
        self.errorView = [[UIView alloc] initWithFrame:self.view.bounds];
        self.errorView.backgroundColor = [UIColor redColor];
        [self.view addSubview:self.errorView];
    }
    [self.view bringSubviewToFront:_errorView];
    _errorView.hidden = NO;
}

/**
 *  隐藏异常视图
 */
- (void)hiddenErrorView
{
    _errorView.hidden = YES;
}

/**
 *  异常视图点击回调
 */
- (void)errorViewClicked:(UITapGestureRecognizer *)tapGesture
{
    
}

#pragma mark -
#pragma mark - 生命周期

- (void)viewDidLoad
{
    [super viewDidLoad];
 
    self.automaticallyAdjustsScrollViewInsets = YES;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
 
    [self registKeyboardNotification];
    [self registNetStatusNotification];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];

    [self removeKeyboardNotification];
    [self removeNetStatusNotification];
}

#pragma mark -
#pragma mark - Methods Template

- (void)keyboardHeightCallback:(CGFloat)keyboardHeight
{

}

@end

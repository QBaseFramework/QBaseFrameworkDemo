//
//  QBaseViewController.m
//  QBaseViewController
//
//  Created by andy on 10/10/14.
//  Copyright (c) 2014 Andy Jin. All rights reserved.
//

#import "QBaseViewController.h"

@interface QBaseViewController ()

@end

@implementation QBaseViewController

#pragma mark -
#pragma mark 异常处理

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
#pragma mark 生命周期

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
#pragma mark Keybord 键盘回调

- (void)keyboardHeightCallback:(CGFloat)keyboardHeight
{

}

#pragma mark -
#pragma mark ChoosePhoto 相册选择回调

- (void)photoChoose:(UIImagePickerController *)picker originalImage:(UIImage *)originalImage editedImage:(UIImage *)editedImage
{
    
}

#pragma mark -
#pragma mark QBaseNetOperationDelegate

- (void)netOperationDidFinish:(QBaseNetOperation *)operation
{

}
- (void)netOperationDidFailed:(QBaseNetOperation *)operation
{

}

#pragma mark -
#pragma mark QBaseLocationGeocoder 定位回调

- (void)locationGeocoder:(QBaseLocationGeocoder *)geocoder complete:(BOOL)success
{
    
}

@end

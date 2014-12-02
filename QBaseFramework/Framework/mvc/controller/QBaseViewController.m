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
@synthesize errorView;

#pragma mark -
#pragma mark 网络异常 提示处理

/**
 *  展示异常试图
 */
- (void)showErrorView
{
    if (self.errorView) {
        self.errorView.hidden = NO;
        [self.view bringSubviewToFront:self.errorView];
    }
}

/**
 *  隐藏异常视图
 */
- (void)hiddenErrorView
{
    if (self.errorView) {
        self.errorView.hidden = YES;
    }
}

#pragma mark -
#pragma mark 生命周期

- (void)viewDidLoad
{
    [super viewDidLoad];
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
    // 键盘高度发生变化回调
}

#pragma mark -
#pragma mark ChoosePhoto 相册选择回调

- (void)photoChoose:(UIImagePickerController *)picker originalImage:(UIImage *)originalImage editedImage:(UIImage *)editedImage
{
    // 选择相册回调
}


#pragma mark -
#pragma mark QBaseLocationGeocoder 定位回调

- (void)locationGeocoder:(QBaseLocationGeocoder *)geocoder complete:(BOOL)success
{
    // 定位回调
}

@end

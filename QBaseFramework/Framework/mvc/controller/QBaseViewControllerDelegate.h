//
//  QBaseViewControllerDelegate.h
//  QBaseFrameworkDemo
//
//  Created by andy on 11/1/14.
//  Copyright (c) 2014 Andy Jin. All rights reserved.
//

#import <Foundation/Foundation.h>
@class QBaseLocationGeocoder;
@protocol QBaseViewControllerDelegate <NSObject>

#pragma mark -
#pragma mark 键盘

/**
 *  键盘高度发生变化, 回调代理
 */
- (void)keyboardHeightCallback:(CGFloat)keyboardHeight;

#pragma mark -
#pragma mark 选择相册
/**
 *  选择相片
 *
 *  @param picker        选择器
 *  @param originalImage 原图
 *  @param editedImage   编辑图
 */
- (void)photoChoose:(UIImagePickerController *)picker
      originalImage:(UIImage *)originalImage
        editedImage:(UIImage *)editedImage;

#pragma mark -
#pragma mark 定位

/**
 *  定位回调
 *
 *  @param geocoder      定位对象
 *  @param isSuccess     是否定位成功
 */
- (void)locationGeocoder:(QBaseLocationGeocoder *)geocoder
                complete:(BOOL)success;

#pragma mark -
#pragma mark 网络异常处理

/**
 *  异常状态图片
 */
@property (nonatomic, strong) UIView *errorView;

/**
 *  展示、隐藏异常视图
 */
- (void)showErrorView;
- (void)hiddenErrorView;

@end

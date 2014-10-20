//
//  QBaseViewController.h
//  QBaseViewController
//
//  Created by andy on 10/10/14.
//  Copyright (c) 2014 Andy Jin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QBaseNetOperation.h"

@class QBaseLocationGeocoder;
@interface QBaseViewController : UIViewController<QBaseNetOperationDelegate>
/**
 *  异常状态图片
 */
@property (nonatomic, strong) UIView *errorView;

/**
 *  展示/隐藏异常视图
 */
- (void)showErrorView;
- (void)hiddenErrorView;


/**
 *  键盘高度发生变化, 回调代理
 */
- (void)keyboardHeightCallback:(CGFloat)keyboardHeight;

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

/**
 *  定位回调
 *
 *  @param geocoder      定位对象
 *  @param isSuccess     是否定位成功
 */
- (void)locationGeocoder:(QBaseLocationGeocoder *)geocoder
                complete:(BOOL)success;
@end


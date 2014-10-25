//
//  QBaseViewController+Photo.h
//  TTT
//
//  Created by andy on 10/18/14.
//  Copyright (c) 2014 Andy Jin. All rights reserved.
//

#import "QBaseViewController.h"

@interface QBaseViewController (Photo)<UIActionSheetDelegate, UIImagePickerControllerDelegate,
    UINavigationControllerDelegate>

/**
 *  选择器展示页面
 */
- (void)photoChooseShowActionSheetInView:(UIView *)view;

/**
 *  Action代理回调内部调用
 */
- (void)photoChooseWithActionSheet:(UIActionSheet *)actionSheet
              clickedButtonAtIndex:(NSInteger)buttonIndex;

@end

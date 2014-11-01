//
//  QBaseViewController.h
//  QBaseViewController
//
//  Created by andy on 10/10/14.
//  Copyright (c) 2014 Andy Jin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QBaseViewControllerDelegate.h"
@interface QBaseViewController : UIViewController<QBaseViewControllerDelegate>

@end

#pragma mark -
#pragma QBaseViewController Category 扩展函数

#import "QBaseViewController+KeyBoardObserver.h"
#import "QBaseViewController+Photo.h"
#import "QBaseViewController+LocationGeocoder.h"
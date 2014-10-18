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

- (void)photoChoose;

@end

//
//  QBaseViewController+Photo.m
//  QBaseViewFramework
//
//  Created by andy on 10/18/14.
//  Copyright (c) 2014 Andy Jin. All rights reserved.
//

#import "QBaseViewController+Photo.h"
#import <objc/message.h>

#define SET_PICKER_SOURCE_TYPE(__picker, __sourceType) \
if ([UIImagePickerController isSourceTypeAvailable:__sourceType]) {\
    __picker.sourceType = __sourceType;\
}

@implementation QBaseViewController (Photo)

- (void)photoChoose
{
    UIActionSheet *_sheet = [[UIActionSheet alloc] initWithTitle:nil
                                                        delegate:self
                                               cancelButtonTitle:@"取消"
                                          destructiveButtonTitle:nil
                                               otherButtonTitles:@"拍照",@"相册", nil];
    
    [_sheet showInView:[[UIApplication sharedApplication] delegate].window];
}

#pragma mark -
#pragma mark UIActionSheet Delegate

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 2) {
        NSLog(@"取消选择");
        return;
    }
    
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    
    switch (buttonIndex) {
        case 0:
            SET_PICKER_SOURCE_TYPE(picker, UIImagePickerControllerSourceTypeCamera);
            break;
        case 1:
            SET_PICKER_SOURCE_TYPE(picker, UIImagePickerControllerSourceTypePhotoLibrary);
            break;
    }  
    
    [self presentViewController:picker animated:YES completion:^{
        
        // 模态推送完成回调
        
    }];
}


#pragma mark -
#pragma mark UIImagePickerControllerDelegate

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    // 原图
    UIImage *originalImage = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
    
    // 编辑图
    UIImage *editedImage = [info objectForKey:@"UIImagePickerControllerEditedImage"];
    
    objc_msgSend(self, @selector(photoChoose:originalImage:editedImage:), picker, originalImage, editedImage);
    
    [picker dismissViewControllerAnimated:YES completion:nil];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [picker dismissViewControllerAnimated:YES completion:nil];
}

@end



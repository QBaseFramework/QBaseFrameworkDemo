//
//  HomeViewController.m
//  QBaseViewControllerTest
//
//  Created by andy on 12/1/14.
//  Copyright (c) 2014 Andy Jin. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

#pragma mark -
#pragma mark 生命周期

- (void)viewDidLoad
{
    [super viewDidLoad];

}

#pragma mark -
#pragma mark 相册管理

- (void)actionChoosePhone
{
    [self photoChoose];
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    [self photoChooseWithActionSheet:actionSheet clickedButtonAtIndex:buttonIndex];
}

- (void)photoChoose:(UIImagePickerController *)picker originalImage:(UIImage *)originalImage editedImage:(UIImage *)editedImage
{
    QBASE_LOG(@"原始照片%@", originalImage);
    QBASE_LOG(@"编辑照片%@", editedImage);
}

#pragma mark -
#pragma mark 定位功能

int location_flag = 0;
- (void)actionLocation
{
    switch (location_flag) {
        case 0:
            [self locationDetails];
            break;
        case 1:
            [self locationCoordinate];
            break;
    }
}

- (void)locationGeocoder:(QBaseLocationGeocoder *)geocoder complete:(BOOL)success
{
    if (success) {
        NSLog(@"< %f : %f >", geocoder.location.coordinate.latitude,
                              geocoder.location.coordinate.longitude);
    }else {
        NSLog(@"定位失败");
    }
}

#pragma mark -
#pragma mark 键盘检测

- (void)keyboardHeightCallback:(CGFloat)keyboardHeight
{
    NSLog(@"%f", keyboardHeight);
}

@end

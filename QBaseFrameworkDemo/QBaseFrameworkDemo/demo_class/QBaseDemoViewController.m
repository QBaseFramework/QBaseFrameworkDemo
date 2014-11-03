//
//  QBaseDemoViewController.m
//  QBaseFrameworkDemo
//
//  Created by andy on 11/1/14.
//  Copyright (c) 2014 Andy Jin. All rights reserved.
//

#import "QBaseDemoViewController.h"

@interface QBaseDemoViewController ()

@end

@implementation QBaseDemoViewController

- (void)createUI
{
    UITextView *tv = [[UITextView alloc] initWithFrame:CGRectMake(0, 66, 100, 100)];
    tv.layer.borderColor = [[UIColor darkGrayColor] CGColor];
    tv.layer.borderWidth = 1.0f;
    [self.view addSubview:tv];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self createUI];
    
    [self locationCoordinate];
    [self locationDetails];

    [self photoChoose];

}
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
    
    [self photoChoose];
}

#pragma mark -
#pragma mark 键盘高度回调

- (void)keyboardHeightCallback:(CGFloat)keyboardHeight
{
    QBASE_LOG(@"当前键盘高度发生变化 最新键盘高度为%f", keyboardHeight);
}

#pragma mark -
#pragma mark 定位功能

- (void)locationGeocoder:(QBaseLocationGeocoder *)geocoder complete:(BOOL)success
{
    if (!success) {
        QBASE_LOG(@"");
    }
    
    CLLocationCoordinate2D coordinate = geocoder.location.coordinate;
    CGFloat lat = coordinate.latitude;
    CGFloat lon = coordinate.longitude;
    QBASE_LOG(@"纬度：%@", @"经度：%@", lat, lon);
}

#pragma mark -
#pragma mark 相册

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    // 防止出现ActionSheet还需要操作其他功能，因此换了一种调用方式
    [self photoChooseWithActionSheet:actionSheet clickedButtonAtIndex:buttonIndex];
}

- (void)photoChoose:(UIImagePickerController *)picker originalImage:(UIImage *)originalImage editedImage:(UIImage *)editedImage
{
    QBASE_LOG(@"选取相册操作");
}

#pragma mark -
#pragma mark 网络检测

- (void)netStatusChangedCallback:(NSNotification *)note
{
    QBaseNetworkObserver *observer = (QBaseNetworkObserver *)note.object;
    switch (observer.status) {
        case QBaseNetStatus_None:
            QBASE_LOG(@"当前网络状态暂无信号");
            break;

        case QBaseNetStatus_WiFi:
            QBASE_LOG(@"当前网络状态Wifi");
            break;
            
        case QBaseNetStatus_WWAN:
            QBASE_LOG(@"当前网络状态3G");
            break;
            
        default:
            break;
    }
}


@end

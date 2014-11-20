//
//  UIImageView+LoadImage.h
//  QBase_Client
//
//  Created by andy on 10/18/14.
//  Copyright (c) 2014 Andy Jin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (LoadImage)

/**
 *  加载图片
 *
 *  @param url 图片加载链接
 */
- (void)loadImageWithURL:(NSString *)url;

/**
 *  加载图片 附加默认图片
 *
 *  @param url              图片加载链接
 *  @param placeholderImage 默认图片
 */
- (void)loadImageWithURL:(NSString *)url
    placeholderImage:(UIImage *)placeholderImage;

@end

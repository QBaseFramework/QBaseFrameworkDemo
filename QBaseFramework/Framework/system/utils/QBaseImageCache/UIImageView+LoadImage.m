//
//  UIImageView+LoadImage.m
//  QBase_Client
//
//  Created by andy on 10/18/14.
//  Copyright (c) 2014 Andy Jin. All rights reserved.
//

#import "UIImageView+LoadImage.h"
#import "UIImageView+WebCache.h"

@implementation UIImageView (LoadImage)

- (void)loadImageWithURL:(NSString *)url
{
    [self sd_setImageWithURL:[NSURL URLWithString:url]];
}

- (void)loadImageWithURL:(NSString *)url placeholderImage:(UIImage *)placeholderImage
{
    [self sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:placeholderImage];
};


@end

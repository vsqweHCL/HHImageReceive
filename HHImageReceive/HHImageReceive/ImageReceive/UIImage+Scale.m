//
//  UIImage+Scale.m
//  HHImageReceive
//
//  Created by HCL黄 on 16/11/14.
//  Copyright © 2016年 HCL黄. All rights reserved.
//

#import "UIImage+Scale.h"

@implementation UIImage (Scale)

// 根据宽高比重新绘制图片  性能优化
- (UIImage *)imageWithScale:(CGFloat)width
{
    // 1.根据宽度计算高度
    CGFloat height = width * self.size.height / self.size.width;
    
    // 2.按照宽高比绘制一张新的图片
    CGSize currenSize = CGSizeMake(width, height);
    UIGraphicsBeginImageContext(currenSize);
    [self drawInRect:CGRectMake(0, 0, currenSize.width, currenSize.height)];
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}

@end

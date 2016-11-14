//
//  UIImage+Scale.h
//  HHImageReceive
//
//  Created by HCL黄 on 16/11/14.
//  Copyright © 2016年 HCL黄. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Scale)

// 根据宽高比重新绘制图片  性能优化
- (UIImage *)imageWithScale:(CGFloat)width;
@end

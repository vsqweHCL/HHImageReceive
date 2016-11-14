//
//  HHImageReceiveViewCell.h
//  HHImageReceive
//
//  Created by HCL黄 on 16/11/14.
//  Copyright © 2016年 HCL黄. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HHImageReceiveViewCell;

@protocol HHImageReceiveViewCellDelegate <NSObject>

- (void)imageDidAddSelector:(HHImageReceiveViewCell *)cell;
- (void)imageDidRemoveSelector:(HHImageReceiveViewCell *)cell;
@end

@interface HHImageReceiveViewCell : UICollectionViewCell

@property (nonatomic, weak) id<HHImageReceiveViewCellDelegate> imageCellDelegate;
@property (nonatomic, strong) UIImage *image;
@end

//
//  HHImageReceiveViewCell.m
//  HHImageReceive
//
//  Created by HCL黄 on 16/11/14.
//  Copyright © 2016年 HCL黄. All rights reserved.
//

#import "HHImageReceiveViewCell.h"
@interface HHImageReceiveViewCell ()

@property (nonatomic, strong) UIButton *addButton;
@property (nonatomic, strong) UIButton *removeButton;
@end

@implementation HHImageReceiveViewCell
- (UIButton *)removeButton
{
    if (_removeButton == nil) {
        _removeButton = [[UIButton alloc] init];
        [_removeButton setBackgroundImage:[UIImage imageNamed:@"compose_photo_close"] forState:0];
        [_removeButton addTarget:self action:@selector(removeClick) forControlEvents:(UIControlEventTouchUpInside)];
    }
    return _removeButton;
}

- (void)removeClick
{
    if ([self.imageCellDelegate respondsToSelector:@selector(imageDidRemoveSelector:)]) {
        [self.imageCellDelegate imageDidRemoveSelector:self];
    }
}
- (UIButton *)addButton
{
    if (_addButton == nil) {
        _addButton = [[UIButton alloc] init];
        [_addButton setBackgroundImage:[UIImage imageNamed:@"compose_pic_add"] forState:0];
        [_addButton addTarget:self action:@selector(addClick) forControlEvents:(UIControlEventTouchUpInside)];
        _addButton.imageView.contentMode = UIViewContentModeScaleAspectFill;
    }
    return _addButton;
}
- (void)addClick
{
    if ([self.imageCellDelegate respondsToSelector:@selector(imageDidAddSelector:)]) {
        [self.imageCellDelegate imageDidAddSelector:self];
    }
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self.contentView addSubview:self.addButton];
        [self.contentView addSubview:self.removeButton];
    }
    return self;
}

- (void)setImage:(UIImage *)image
{
    _image = image;
    if (image != nil) {
        self.removeButton.hidden = NO;
        [self.addButton setBackgroundImage:image forState:0];
        self.addButton.userInteractionEnabled = NO;
    }
    else {
        self.removeButton.hidden = YES;
        [self.addButton setBackgroundImage:[UIImage imageNamed:@"compose_pic_add"] forState:0];
        self.addButton.userInteractionEnabled = YES;
        
    }
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.addButton.frame = self.bounds;
    
    CGFloat removeWH = 24;
    self.removeButton.frame = CGRectMake(self.frame.size.width - removeWH - 2, 2, removeWH, removeWH);
}

@end

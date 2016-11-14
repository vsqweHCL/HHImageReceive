//
//  HHImageReceiveViewController.m
//  HHImageReceive
//
//  Created by HCL黄 on 16/11/14.
//  Copyright © 2016年 HCL黄. All rights reserved.
//

#import "HHImageReceiveViewController.h"
#import "HHImageReceiveViewCell.h"
#import "UIImage+Scale.h"

@interface HHImageReceiveViewController ()<UICollectionViewDataSource,HHImageReceiveViewCellDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) NSMutableArray *pictureImages;

@end
NSString * const identifier = @"imageSelectorCell";

@implementation HHImageReceiveViewController

/** 懒加载数组 */
- (NSMutableArray *)pictureImages
{
    if (_pictureImages == nil) {
        _pictureImages = [NSMutableArray array];
    }
    return _pictureImages;
}
- (UICollectionView *)collectionView
{
    if (_collectionView == nil) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.itemSize = CGSizeMake(80, 80);
        layout.minimumLineSpacing = 10;
        layout.minimumInteritemSpacing = 10;
        layout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        [_collectionView registerClass:[HHImageReceiveViewCell class] forCellWithReuseIdentifier:identifier];
        _collectionView.dataSource = self;
        _collectionView.backgroundColor = [UIColor orangeColor];
    }
    return _collectionView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.collectionView];
    self.collectionView.frame = self.view.bounds;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.pictureImages.count + 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    HHImageReceiveViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    
    cell.image = (self.pictureImages.count == indexPath.item) ? nil : self.pictureImages[indexPath.item];
    cell.imageCellDelegate = self;
    return cell;
}

- (void)imageDidAddSelector:(HHImageReceiveViewCell *)cell
{
    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) {
        NSLog(@"不能打开相册");
        return;
    }
    // 判断是否超过9张
    if (self.pictureImages.count > 8) {
        NSLog(@"超过9张了");
        return;
    }
    
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    [self presentViewController:picker animated:YES completion:nil];
    
}
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(NSDictionary<NSString *,id> *)editingInfo
{
    UIImage *newImage = [image imageWithScale:300];
    [self.pictureImages addObject:newImage];
    [self.collectionView reloadData];
    
    [picker dismissViewControllerAnimated:YES completion:nil];
}
- (void)imageDidRemoveSelector:(HHImageReceiveViewCell *)cell
{
    NSIndexPath *indexP = [self.collectionView indexPathForCell:cell];
    [self.pictureImages removeObjectAtIndex:indexP.item];
    
    [self.collectionView reloadData];
}


@end

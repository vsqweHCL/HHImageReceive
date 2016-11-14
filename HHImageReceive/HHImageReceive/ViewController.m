//
//  ViewController.m
//  HHImageReceive
//
//  Created by HCL黄 on 16/11/14.
//  Copyright © 2016年 HCL黄. All rights reserved.
//

#import "ViewController.h"
#import "HHImageReceiveViewController.h"

@interface ViewController ()

@property (nonatomic, strong) HHImageReceiveViewController *imageSelectorVC;
@end

@implementation ViewController
- (HHImageReceiveViewController *)imageSelectorVC
{
    if (_imageSelectorVC == nil) {
        _imageSelectorVC = [[HHImageReceiveViewController alloc] init];
    }
    return _imageSelectorVC;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addChildViewController:self.imageSelectorVC];
    [self.view addSubview:self.imageSelectorVC.view];
    self.imageSelectorVC.view.frame = CGRectMake(0, self.view.frame.size.height - 350, self.view.frame.size.width, 350);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

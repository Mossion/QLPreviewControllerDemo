//
//  SecondViewController.m
//  QLPreviewControllerDemo
//
//  Created by Mossion on 16/10/15.
//  Copyright © 2016年 Mossion. All rights reserved.
//

#import "SecondViewController.h"
#import <QuickLook/QuickLook.h>

@interface SecondViewController ()<QLPreviewControllerDataSource>

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self configViews];
}

- (void)configViews{
    // 将QLPreviewControler  添加到本控制器上
    QLPreviewController *HPQLController = [[QLPreviewController alloc] init];
    HPQLController.dataSource = self;
    [self addChildViewController:HPQLController];
    [HPQLController didMoveToParentViewController:self];
    [self.view addSubview:HPQLController.view];
    HPQLController.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
}

#pragma mark - QLPreviewControllerDataSource
- (NSInteger)numberOfPreviewItemsInPreviewController:(QLPreviewController *)controller{
    return 1;
}

- (id<QLPreviewItem>)previewController:(QLPreviewController *)controller previewItemAtIndex:(NSInteger)index{
    NSString *pathString = [[NSBundle mainBundle] pathForResource:@"GCD (1)" ofType:@"pdf"];
    NSURL *url = [NSURL fileURLWithPath:pathString];
    return url;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

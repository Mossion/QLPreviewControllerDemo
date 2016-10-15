//
//  ViewController.m
//  QLPreviewControllerDemo
//
//  Created by Mossion on 16/10/15.
//  Copyright © 2016年 Mossion. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"
#import <QuickLook/QuickLook.h>

@interface ViewController ()<QLPreviewControllerDataSource>{
    
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *present = [UIButton buttonWithType:UIButtonTypeCustom];
    [present setTitle:@"present" forState:UIControlStateNormal];
    [present setFrame:CGRectMake(50, 200, 100, 50)];
    [present setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [present addTarget:self action:@selector(presentQLPreviewContrller:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:present];
    
    
    UIButton *push = [UIButton buttonWithType:UIButtonTypeCustom];
    [push setTitle:@"push" forState:UIControlStateNormal];
    [push setFrame:CGRectMake(150, 200, 100, 50)];
    [push setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [push addTarget:self action:@selector(pushNavController:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:push];
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


- (IBAction)presentQLPreviewContrller:(id)sender {
    QLPreviewController *QLVC = [[QLPreviewController alloc] init];
    QLVC.dataSource = self;
//    [self presentViewController:QLVC animated:YES completion:nil];
    [self.navigationController pushViewController:QLVC animated:YES];
}
- (IBAction)pushNavController:(id)sender {
    SecondViewController *secondVC = [[SecondViewController alloc] init];
    [self.navigationController pushViewController:secondVC animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


@end

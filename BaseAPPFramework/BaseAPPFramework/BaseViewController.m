//
//  BaseViewController.m
//  BaseAPPFramework
//
//  Created by mac on 2019/4/2.
//  Copyright © 2019 Robinson. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController
#pragma mark ------ 这个适合新项目打印当前控制器名称 ------
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSString *className = NSStringFromClass([self class]);
    NSLog(@"适合新项目 显示 当前控制器名称 = %@", className);
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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

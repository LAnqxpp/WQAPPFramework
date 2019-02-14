//
//  ViewController.m
//  BaseAPPFramework
//
//  Created by mac on 2019/1/10.
//  Copyright © 2019年 Robinson. All rights reserved.
//

#import "ViewController.h"
#import "WQQToolsKit/NSAttributedString/WQDifferentStringHeader.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(10, 100, 100, 43)];
    [self.view addSubview:label];
    label.text = @"adgfagas";
  //    label.attributedText.attributedFont  = 43;
    
    // Do any additional setup after loading the view, typically from a nib.
}


@end

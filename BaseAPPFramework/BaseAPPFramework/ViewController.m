//
//  ViewController.m
//  BaseAPPFramework
//
//  Created by mac on 2019/1/10.
//  Copyright © 2019年 Robinson. All rights reserved.
//

#import "ViewController.h"
#import "WQQToolsKit/NSAttributedString/WQDifferentStringHeader.h"
#import "LTTestTableViewCell.h"
#import <WebKit/WebKit.h>
@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic ,strong)WKWebView *webView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(10, 100, 100, 43)];
    [self.view addSubview:label];
    label.text = @"adgfagas";
  //    label.attributedText.attributedFont  = 43;
    
    
//    [self.view addSubview:self.tableView];
    
    self.webView = [[WKWebView alloc] initWithFrame:CGRectMake(1, 1, 300, 300)];
//    self.webView.navigationDelegate = self;
    NSURL *url = [NSURL URLWithString:@"https://www.baidu.com"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
    [self.view addSubview:self.webView];
    // Do any additional setup after loading the view, typically from a nib.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 12;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    /*第一种方法
     LTTestTableViewCell *cell = [LTTestTableViewCell cellWithTableview:tableView];
     cell.glt_indexPath = indexPath;
     */
    
    //第二种方法
    LTTestTableViewCell *cell = [LTTestTableViewCell cellWithTableview:tableView indexPath:indexPath];
    
    [cell glt_didSelectParamtersIndexBlock:^(NSIndexPath *indexPath, NSInteger index, NSObject *paramters) {
        switch (index) {
            case LTButtonTypeFirst:NSLog(@"index0 ---> %ld",index);break;
            case LTButtonTypeSecond:NSLog(@"index1 ---> %ld",index);break;
            case LTButtonTypeThird:NSLog(@"index2 ---> %ld",index);break;
            case LTButtonTypeForth:NSLog(@"index3 ---> %ld",index);break;
            default:break;
        }
        NSLog(@"indexPath.row ---> %ld",indexPath.row);
        NSLog(@"paramters ---> %@",paramters);
    }];
    
    
//     [cell glt_didSelectIndexBlock:^(NSIndexPath *indexPath, NSInteger index) {
//         NSLog(@"swdfr");
//     }];
    
    
    /*2
     [cell glt_didSelectBlock:^(NSIndexPath *indexPath) {
     
     }];
     */
    
    /*3
     [cell glt_didSelectParamtersBlock:^(NSIndexPath *indexPath, NSObject *paramters) {
     
     }];
     */
    
    return cell;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [LTTestTableViewCell returnHeight];
    //    return [LTTestTableViewCell returnHeightWithModel:model];
}

#pragma mark - init方法
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView=[[UITableView alloc] initWithFrame:CGRectMake(0, 20, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 20) style:UITableViewStylePlain];
        _tableView.delegate=self;
        _tableView.dataSource=self;
        _tableView.backgroundColor= [UIColor clearColor];
    }
    return _tableView;
}

@end

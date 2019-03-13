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
@interface ViewController ()<UITableViewDelegate, UITableViewDataSource,UIWebViewDelegate>
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic ,strong)UIWebView *webView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(10, 100, 100, 43)];
//    [self.view addSubview:label];
//    label.text = @"adgfagas";
//  //    label.attributedText.attributedFont  = 43;
//
//
    [self.view addSubview:self.tableView];
//
//    self.webView = [[WKWebView alloc] initWithFrame:CGRectMake(1, 1, 300, 300)];
////    self.webView.navigationDelegate = self;
//    NSURL *url = [NSURL URLWithString:@"https://www.baidu.com"];
//    NSURLRequest *request = [NSURLRequest requestWithURL:url];
//    [self.webView loadRequest:request];
//    [self.view addSubview:self.webView];
    
    
    _webView = [[UIWebView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 1)];
    _webView.delegate = self;
    _webView.scrollView.scrollEnabled = NO;
    //预先加载url
    [self.webView loadRequest:[[NSURLRequest alloc] initWithURL:[NSURL URLWithString:@"http://pre.www.yijiazhuang.cn/h5/foreman/task-progress?decoration_task_id=415"]]];
    
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
//    return 12;
//}
//
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
//
//    /*第一种方法
//     LTTestTableViewCell *cell = [LTTestTableViewCell cellWithTableview:tableView];
//     cell.glt_indexPath = indexPath;
//     */
//
//    //第二种方法
//    LTTestTableViewCell *cell = [LTTestTableViewCell cellWithTableview:tableView indexPath:indexPath];
//
//    [cell glt_didSelectParamtersIndexBlock:^(NSIndexPath *indexPath, NSInteger index, NSObject *paramters) {
//        switch (index) {
//            case LTButtonTypeFirst:NSLog(@"index0 ---> %ld",index);break;
//            case LTButtonTypeSecond:NSLog(@"index1 ---> %ld",index);break;
//            case LTButtonTypeThird:NSLog(@"index2 ---> %ld",index);break;
//            case LTButtonTypeForth:NSLog(@"index3 ---> %ld",index);break;
//            default:break;
//        }
//        NSLog(@"indexPath.row ---> %ld",indexPath.row);
//        NSLog(@"paramters ---> %@",paramters);
//    }];
//
//
////     [cell glt_didSelectIndexBlock:^(NSIndexPath *indexPath, NSInteger index) {
////         NSLog(@"swdfr");
////     }];
//
//
//    /*2
//     [cell glt_didSelectBlock:^(NSIndexPath *indexPath) {
//
//     }];
//     */
//
//    /*3
//     [cell glt_didSelectParamtersBlock:^(NSIndexPath *indexPath, NSObject *paramters) {
//
//     }];
//     */
//
//    return cell;
//}
//
//
//-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    return [LTTestTableViewCell returnHeight];
//    //    return [LTTestTableViewCell returnHeightWithModel:model];
//}
//
//#pragma mark - init方法
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView=[[UITableView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height )style:UITableViewStylePlain];
        _tableView.delegate=self;
        _tableView.dataSource=self;
        _tableView.backgroundColor= [UIColor clearColor];
    }
    return _tableView;
}
#pragma mark - TableViewDelegate & TableViewDatasource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return  3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 1){
        static NSString *identifier = @"cell";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (!cell){
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
            [cell.contentView addSubview:_webView];
            /* 忽略点击效果 */
            [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        }
        return cell;
    }else{
        static NSString *identifier = @"cell";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (!cell){
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        }
        cell.textLabel.text = [NSString stringWithFormat:@"index====%ld",(long)indexPath.row];
        return cell;
    }
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    if(indexPath.row == 1){
        /* 通过webview代理获取到内容高度后,将内容高度设置为cell的高 */
        return _webView.frame.size.height;
    }else{
        return 100;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - UIWebView Delegate Methods
-(void)webViewDidFinishLoad:(UIWebView *)webView
{
    
    
     CGFloat height = [[webView stringByEvaluatingJavaScriptFromString:@"document.getElementById(\"content\").offsetHeight;"] floatValue];
    //获取到webview的高度
//    CGFloat height = [[self.webView stringByEvaluatingJavaScriptFromString:@"document.body.offsetHeight"] floatValue];
    NSLog(@"-------%f",height);
    self.webView.frame = CGRectMake(self.webView.frame.origin.x,self.webView.frame.origin.y, [UIScreen mainScreen].bounds.size.width, height+700);
    [self.tableView reloadData];
}
- (void)webViewDidStartLoad:(UIWebView *)webView
{
    NSLog(@"webViewDidStartLoad");
}
//- (void)webView:(UIWebView *)webView didFailLoadWithError:(nullable NSError *)error
//{
//    NSLog(@"didFailLoadWithError===%@", error);
//}
@end

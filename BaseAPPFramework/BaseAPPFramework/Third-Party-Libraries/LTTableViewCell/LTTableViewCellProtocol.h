//
//  LTTableViewCellProtocol.h
//  WeiYouDuoBao
//
//  Created by 高刘通 on 17/4/27.
//  Copyright © 2017年 LT. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^glt_didSelectBlock)(NSIndexPath *indexPath);
typedef void (^glt_didSelectIndexBlock)(NSIndexPath *indexPath, NSInteger index);
typedef void (^glt_didSelectParamtersBlock)(NSIndexPath *indexPath, NSObject *paramters);
typedef void (^glt_didSelectIndexParamtersBlock)(NSIndexPath *indexPath, NSInteger index, NSObject *paramters);


@protocol LTTableViewCellProtocol <NSObject>

@optional


/**
 NSIndexPath indexPath
 */
@property(strong, nonatomic) NSIndexPath *glt_indexPath;


/**
 点击事件，仅获取NSIndexPath
 */
@property(copy, nonatomic) glt_didSelectBlock glt_didSelectBlock;

/**
 点击事件，获取NSIndexPath 以及 子view中的第几个view事件
 */
@property(copy, nonatomic) glt_didSelectIndexBlock glt_didSelectIndexBlock;


/**
 点击事件，获取NSIndexPath 以及 要传递的参数
 */
@property(copy, nonatomic) glt_didSelectParamtersBlock glt_didSelectParamtersBlock;

/**
 点击事件，获取NSIndexPath 以及 子view中的第几个view事件 以及 要传递的参数
 */
@property(copy, nonatomic) glt_didSelectIndexParamtersBlock glt_didSelectIndexParamtersBlock;


/**
 配置子视图
 */
-(void)glt_configSubviews;


/**
 配置cell

 @param tableView 传递tableView
 @return cell
 */
+(instancetype)cellWithTableview:(UITableView *)tableView;



/**
 配置cell indexPath

 @param tableView tableView
 @param indexPath indexPath
 @return cell
 */
+(instancetype)cellWithTableview:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath;

/**
 @return 返回cell的高度
 */
+(CGFloat)returnHeight;


/**
 @return  通过模型计算并返回cell高度
 */
+(CGFloat)returnHeightWithModel:(NSObject *)model;


#pragma mark - 点击事件方法调用
-(void)glt_didSelectBlock:(glt_didSelectBlock)didSelectBlock;
-(void)glt_didSelectIndexBlock:(glt_didSelectIndexBlock)didSelectBlock;
-(void)glt_didSelectParamtersBlock:(glt_didSelectParamtersBlock)didSelectBlock;
-(void)glt_didSelectParamtersIndexBlock:(glt_didSelectIndexParamtersBlock)didSelectBlock;

@end

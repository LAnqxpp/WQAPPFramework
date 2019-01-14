//
//  UIColor+Gradient.h
//  BaseAPPFramework
//
//  Created by mac on 2019/1/14.
//  Copyright © 2019年 Robinson. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (Gradient)
/**
 *  渐变颜色
 *
 *  @param fromColor    开始颜色
 *  @param toColor      结束颜色
 *  @param height       渐变高度
 *
 *  @return 渐变颜色
 */
+ (UIColor*)gradientColorFromColor:(UIColor*)fromColor toColor:(UIColor*)toColor withHeight:(int)height;
@end

NS_ASSUME_NONNULL_END

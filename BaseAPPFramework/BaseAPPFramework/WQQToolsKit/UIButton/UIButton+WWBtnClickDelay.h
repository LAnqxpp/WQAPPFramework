//
//  UIButton+WWBtnClickDelay.h
//  UIBtnClickDelay
//
//  Created by mac on 2018/12/12.
//  Copyright © 2018年 Robinson. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
#define defaultInterval 1  //默认时间间隔

@interface UIButton (WWBtnClickDelay)
/**设置点击时间间隔*/
@property (nonatomic, assign) NSTimeInterval timeInterval;
/**
 *  用于设置单个按钮不需要被hook
 */
@property (nonatomic, assign) BOOL isIgnore;
@end

NS_ASSUME_NONNULL_END

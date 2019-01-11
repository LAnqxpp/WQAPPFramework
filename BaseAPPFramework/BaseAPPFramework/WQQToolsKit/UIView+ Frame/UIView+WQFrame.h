//
//  UIView+WQFrame.h
//  BaseAPPFramework
//
//  Created by mac on 2019/1/11.
//  Copyright © 2019年 Robinson. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (WQFrame)
@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;

@property (nonatomic,assign,readonly) CGFloat maxY;
@property (nonatomic,assign,readonly) CGFloat minY;
@property (nonatomic,assign,readonly) CGFloat maxX;
@property (nonatomic,assign,readonly) CGFloat minX;
@end

NS_ASSUME_NONNULL_END

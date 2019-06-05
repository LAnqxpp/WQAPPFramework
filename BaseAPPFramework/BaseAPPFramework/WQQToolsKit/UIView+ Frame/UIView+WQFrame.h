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
@property (nonatomic) CGFloat jt_left;        ///< Shortcut for frame.origin.x.
@property (nonatomic) CGFloat jt_top;         ///< Shortcut for frame.origin.y
@property (nonatomic) CGFloat jt_right;       ///< Shortcut for frame.origin.x + frame.size.width
@property (nonatomic) CGFloat jt_bottom;      ///< Shortcut for frame.origin.y + frame.size.height
@property (nonatomic) CGFloat jt_width;       ///< Shortcut for frame.size.width.
@property (nonatomic) CGFloat jt_height;      ///< Shortcut for frame.size.height.
@property (nonatomic) CGFloat jt_centerX;     ///< Shortcut for center.x
@property (nonatomic) CGFloat jt_centerY;     ///< Shortcut for center.y
@property (nonatomic) CGPoint jt_origin;      ///< Shortcut for frame.origin.
@property (nonatomic) CGSize  jt_size;        ///< Shortcut for frame.size.
@end

NS_ASSUME_NONNULL_END

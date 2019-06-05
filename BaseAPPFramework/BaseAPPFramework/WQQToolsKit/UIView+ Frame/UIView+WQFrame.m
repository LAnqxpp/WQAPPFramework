//
//  UIView+WQFrame.m
//  BaseAPPFramework
//
//  Created by mac on 2019/1/11.
//  Copyright © 2019年 Robinson. All rights reserved.
//

#import "UIView+WQFrame.h"

@implementation UIView (WQFrame)
- (CGFloat)jt_left {
    return self.frame.origin.x;
}

- (void)setJt_left:(CGFloat)x {
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (CGFloat)jt_top {
    return self.frame.origin.y;
}

- (void)setJt_top:(CGFloat)y {
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat)jt_right {
    return self.frame.origin.x + self.frame.size.width;
}

- (void)setJt_right:(CGFloat)right {
    CGRect frame = self.frame;
    frame.origin.x = right - frame.size.width;
    self.frame = frame;
}

- (CGFloat)jt_bottom {
    return self.frame.origin.y + self.frame.size.height;
}

- (void)setJt_bottom:(CGFloat)bottom {
    CGRect frame = self.frame;
    frame.origin.y = bottom - frame.size.height;
    self.frame = frame;
}

- (CGFloat)jt_width {
    return self.frame.size.width;
}

- (void)setJt_width:(CGFloat)width {
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (CGFloat)jt_height {
    return self.frame.size.height;
}

- (void)setJt_height:(CGFloat)height {
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (CGFloat)jt_centerX {
    return self.center.x;
}

- (void)setJt_centerX:(CGFloat)centerX {
    self.center = CGPointMake(centerX, self.center.y);
}

- (CGFloat)jt_centerY {
    return self.center.y;
}

- (void)setJt_centerY:(CGFloat)centerY {
    self.center = CGPointMake(self.center.x, centerY);
}

- (CGPoint)jt_origin {
    return self.frame.origin;
}

- (void)setJt_origin:(CGPoint)origin {
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}

- (CGSize)size {
    return self.frame.size;
}

- (void)setSize:(CGSize)size {
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

- (CGSize)jt_size {
    return self.frame.size;
}

- (void)setJt_size:(CGSize)jt_size {
    CGRect frame = self.frame;
    frame.size = jt_size;
    self.frame = frame;
}

- (UIEdgeInsets)jt_safeAreaInsets {
    UIEdgeInsets inset = UIEdgeInsetsZero;
    if (@available(iOS 11, *)) {
        inset = self.safeAreaInsets;
    }
    return inset;
}

- (UIViewController *)jt_viewController {
    for (UIView *view = self; view; view = view.superview) {
        UIResponder *nextResponder = [view nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)nextResponder;
        }
    }
    return nil;
}
@end

//
//  UIView+WQFrame.m
//  BaseAPPFramework
//
//  Created by mac on 2019/1/11.
//  Copyright © 2019年 Robinson. All rights reserved.
//

#import "UIView+WQFrame.h"

@implementation UIView (WQFrame)
- (void)setX:(CGFloat)x {
    self.frame = CGRectMake(x, self.y, self.width, self.height);
}

- (CGFloat)x {
    return self.frame.origin.x;
}

- (void)setY:(CGFloat)y {
    self.frame = CGRectMake(self.x, y, self.width, self.height);
}

- (CGFloat)y {
    return self.frame.origin.y;
}

- (void)setWidth:(CGFloat)width {
    self.frame = CGRectMake(self.x, self.y, width, self.height);
}

- (CGFloat)width {
    return self.frame.size.width;
}

- (void)setHeight:(CGFloat)height {
    self.frame = CGRectMake(self.x, self.y, self.width, height);
}

- (CGFloat)height {
    return self.frame.size.height;
}
- (void)setWq_origin:(CGPoint)wq_origin
{
    CGRect frame = self.frame;
    frame.origin = wq_origin;
    self.frame = frame;
}

- (void)setWq_center:(CGPoint)wq_center
{
    CGRect frame = self.frame;
    frame.origin.x = wq_center.x - frame.size.width * 0.5;
    frame.origin.y = wq_center.y - frame.size.width * 0.5;
    self.frame = frame;
}

- (CGPoint)wq_center
{
    return CGPointMake(self.frame.origin.x + self.frame.size.width * 0.5, self.frame.origin.y + self.frame.size.height * 0.5);
}

- (CGPoint)wq_origin
{
    return self.frame.origin;
}

- (void)setCenterX:(CGFloat)centerX {
    self.center = CGPointMake(centerX, self.centerY);
}

- (CGFloat)centerX {
    return self.center.x;
}

- (void)setCenterY:(CGFloat)centerY {
    self.center = CGPointMake(self.centerX, centerY);
}

- (CGFloat)centerY {
    return self.center.y;
}

- (CGFloat)maxX {
    return CGRectGetMaxX(self.frame);
}

- (CGFloat)minX {
    return CGRectGetMinX(self.frame);
}

- (CGFloat)maxY {
    return CGRectGetMaxY(self.frame);
}

- (CGFloat)minY {
    return CGRectGetMinY(self.frame);
}
@end

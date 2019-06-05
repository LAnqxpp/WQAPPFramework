//
//  UIView+TapAction.h
//  LeancloudDemo
//
//  Created by LAnqxpp on 2019/5/30.
//  Copyright © 2019 Robinson. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (TapAction)

- (void)addTapBlock:(void(^)(id obj))tapAction;

/**
 Attaches the given block for a long press action to the receiver.
 @param block The block to execute.
 */
- (void)setLongPressActionWithBlock:(void (^)(void))block;
@end

NS_ASSUME_NONNULL_END

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
@end

NS_ASSUME_NONNULL_END

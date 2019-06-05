//
//  UIView+TapAction.m
//  LeancloudDemo
//
//  Created by LAnqxpp on 2019/5/30.
//  Copyright © 2019 Robinson. All rights reserved.
//

#import "UIView+TapAction.h"
#import <objc/runtime.h>
static const void* tagValue = &tagValue;

static char kDTActionHandlerLongPressBlockKey;
static char kDTActionHandlerLongPressGestureKey;
@interface UIView ()
@property (nonatomic, copy) void(^tapAction)(id);
@end
@implementation UIView (TapAction)
- (void)tap{
    if (self.tapAction) {
        self.tapAction(self);
    }
}
- (void)addTapBlock:(void(^)(id obj))tapAction{
    self.tapAction = tapAction;
    if (![self gestureRecognizers]) {
        self.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap)];
        [self addGestureRecognizer:tap];
    }
}

-(void)setTapAction:(void (^)(id))tapAction {
    objc_setAssociatedObject(self, tagValue, tapAction, OBJC_ASSOCIATION_COPY_NONATOMIC);
}
-(void (^)(id))tapAction {
    return objc_getAssociatedObject(self, tagValue);
}

- (void)setLongPressActionWithBlock:(void (^)(void))block
{
    UILongPressGestureRecognizer *gesture = objc_getAssociatedObject(self, &kDTActionHandlerLongPressGestureKey);
    
    if (!gesture)
    {
        gesture = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(__handleActionForLongPressGesture:)];
        [self addGestureRecognizer:gesture];
        objc_setAssociatedObject(self, &kDTActionHandlerLongPressGestureKey, gesture, OBJC_ASSOCIATION_RETAIN);
    }
    
    objc_setAssociatedObject(self, &kDTActionHandlerLongPressBlockKey, block, OBJC_ASSOCIATION_COPY);
}

- (void)__handleActionForLongPressGesture:(UITapGestureRecognizer *)gesture
{
    if (gesture.state == UIGestureRecognizerStateBegan)
    {
        void(^action)(void) = objc_getAssociatedObject(self, &kDTActionHandlerLongPressBlockKey);
        
        if (action)
        {
            action();
        }
    }
}


@end

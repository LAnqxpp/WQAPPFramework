//
//  ZREdgeInsetsCustomerButton.h
//  UIButtonEdgeInsets
//
// github地址:https://github.com/Jerryisme/UIButtonEdgeInsets
// 简书地址:https://www.jianshu.com/p/cfd589b5a0d9
// 简书个人主页:https://www.jianshu.com/u/281c41cc90bc

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, ZRButtonEdgeInsetsStyle) {
    ZRButtonEdgeInsetsStyleImageTop,
    ZRButtonEdgeInsetsStyleImageLeft,
    ZRButtonEdgeInsetsStyleImageBottom,
    ZRButtonEdgeInsetsStyleImageRight
};

@interface ZREdgeInsetsCustomerButton : UIButton

@property (nonatomic) ZRButtonEdgeInsetsStyle edgeInsetsStyle;

@property (nonatomic) IBInspectable CGFloat imageTitleSpace;

@end

NS_ASSUME_NONNULL_END

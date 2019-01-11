//
//  WQLoadingView.h
//  BaseAPPFramework
//
//  Created by mac on 2019/1/10.
//  Copyright © 2019年 Robinson. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef enum : NSUInteger {
    WQLoadingViewSuccess,  // 加载成功
    WQLoadingViewError,    // 加载失败，请检查网络
    WQLoadingViewLoading,  // 加载中...
    WQLoadingViewNoEmpty,  // 暂无数据
} XLoadingViewState;

@protocol WQLoadingViewDelegate <NSObject>
// 点击事件
-(BOOL)loadingViewShouldEnableTap:(UIView *)wqloadingView;
-(void)loadingViewDidTapped:(UIView *)wqloadingView;
// 设置提示
-(UIImage *)loadingViewPromptImage:(UIView *)wqloadingView;
-(NSAttributedString *)loadingViewPromptText:(UIView *)wqloadingView;

@end
@interface WQLoadingView : UIView

@property (nonatomic ,weak) id <WQLoadingViewDelegate> wqdelegate;

@end

NS_ASSUME_NONNULL_END

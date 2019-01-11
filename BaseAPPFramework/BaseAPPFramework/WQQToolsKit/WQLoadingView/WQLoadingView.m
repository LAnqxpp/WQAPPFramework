//
//  WQLoadingView.m
//  BaseAPPFramework
//
//  Created by mac on 2019/1/10.
//  Copyright © 2019年 Robinson. All rights reserved.
//

#import "WQLoadingView.h"
#import "UIView+WQFrame.h"
@interface WQLoadingView ()
@property (nonatomic ,strong)UIView *loadingView;
@property (nonatomic ,strong)UIImageView *loadingImageView;
@property (nonatomic ,strong)UIImageView *loadingShadowImageView;

@property (nonatomic ,strong)UIView *contentView;
@property (nonatomic ,strong)UIImageView *promptImageView;
@property (nonatomic ,strong)UILabel *promptLabel;

@property (nonatomic ,strong)CADisplayLink *time;
@property (nonatomic ,assign)BOOL isUp;

@property (nonatomic ,strong)UITapGestureRecognizer *tapGesture;

@end


@implementation WQLoadingView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        self.isUp = YES;
        [self addSubview:self.contentView];
        [self addSubview:self.loadingView];
        
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.contentView.frame = self.bounds;
    CGFloat pmx = (self.contentView.width - self.promptImageView.width)/2;
    CGFloat pmy = (self.contentView.height - self.promptImageView.height)/2 -10;
    self.promptImageView.frame = CGRectMake(pmx, pmy, self.promptImageView.width, self.promptImageView.height);
    
    self.promptLabel.frame = CGRectMake(0, self.promptImageView.y + self.promptImageView.height, self.contentView.width, 20);
    
    self.loadingView.frame = CGRectMake((self.width - 40)/2, (self.height -80)/2, 40, 80);
    
    CGFloat lx = (self.loadingView.width - self.loadingShadowImageView.width)/2;
    CGFloat ly = (self.loadingView.height - self.loadingShadowImageView.height);
    self.loadingShadowImageView.frame = CGRectMake(lx, ly, self.loadingShadowImageView.width, self.loadingShadowImageView.height);
    
    CGFloat lmx = (self.loadingView.width - self.loadingImageView.width)/2;
    CGFloat lmy = (self.loadingView.height - self.loadingImageView.height);
    self.loadingShadowImageView.frame = CGRectMake(lmx, lmy, self.loadingImageView.width, self.loadingImageView.height);
    
}

// 加载
- (UIView *)loadingView {
    if (!_loadingView) {
        _loadingView = [[UIView alloc]init];
        [_loadingView addSubview:_loadingImageView];
        [_loadingView addSubview:_loadingShadowImageView];
    }
    return _loadingView;
}
- (UIImageView *)loadingImageView {
    NSString *resourcePath = [[NSBundle mainBundle] resourcePath];
    if (!_loadingImageView) {
        _loadingImageView = [[UIImageView alloc]init];
        _loadingImageView.frame = CGRectMake(0, 0, 24, 24);
        _loadingImageView.image = [UIImage imageWithContentsOfFile: [resourcePath stringByAppendingString:@""]];
        _loadingImageView.contentMode = UIViewContentModeScaleAspectFit;

    }
    return _loadingImageView;
}
- (UIImageView *)loadingShadowImageView {
    NSString *resourcePath = [[NSBundle mainBundle] resourcePath];
    if (!_loadingShadowImageView) {
        _loadingShadowImageView = [[UIImageView alloc]init];
        _loadingShadowImageView.frame = CGRectMake(0, 0, 24, 24);
         _loadingShadowImageView.image = [UIImage imageWithContentsOfFile: [resourcePath stringByAppendingString:@""]];
        _loadingImageView.contentMode = UIViewContentModeScaleAspectFit;
    }
    return _loadingShadowImageView;
}

// 提示
-(UIView *)contentView {
    if (!_contentView) {
        _contentView = [[UIView alloc]init];
        [_contentView addSubview:_promptImageView];
        [_contentView addSubview:_promptLabel];
    }
    return _contentView;
}

- (UIImageView *)promptImageView {
    NSString *resourcePath = [[NSBundle mainBundle] resourcePath];
    if (!_promptImageView) {
        _promptImageView = [[UIImageView alloc]init];
        _promptImageView.frame = CGRectMake(0, 0, 120, 120);
        _promptImageView.image = [UIImage imageWithContentsOfFile: [resourcePath stringByAppendingString:@""]];
        _promptImageView.contentMode = UIViewContentModeScaleAspectFit;
    }
    return _promptImageView;
}

-(UILabel *)promptLabel {
    if (!_promptLabel) {
        _promptLabel = [[UILabel alloc]init];
        _promptLabel.textColor = [UIColor darkGrayColor];
        _promptLabel.adjustsFontSizeToFitWidth = YES;
        _promptLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _promptLabel;
}

-(CADisplayLink *)time {
    if (!_time) {
        _time = [CADisplayLink displayLinkWithTarget:self selector:@selector(animate)];
    }
    [_time addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
  
    if (@available(iOS 10.0, *)) {
        _time.preferredFramesPerSecond = 40;
    } else {
        // Fallback on earlier versions
         _time.frameInterval = 40;
    }
   
    return _time;
}

- (UITapGestureRecognizer *)tapGesture {
    if (!_tapGesture) {
        _tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction)];
    }
    return _tapGesture;
}

- (id<WQLoadingViewDelegate>)wqdelegate {
    
    if (self.wqdelegate && [self.wqdelegate respondsToSelector:@selector(loadingViewShouldEnableTap:)]) {
       BOOL isbool =  [self.wqdelegate loadingViewShouldEnableTap:self];
        if (!isbool) {
            [self.contentView addGestureRecognizer:self.tapGesture];
        }
    }
    
    
    if (self.wqdelegate && [self.wqdelegate respondsToSelector:@selector(loadingViewPromptImage:)]) {
      
      UIImage *image =   [self.wqdelegate loadingViewPromptImage:self];
      self.promptImageView.image = image;
        
    }
    
    return self.wqdelegate;
}

- (void)tapAction {
    
    if (self.wqdelegate && [self.wqdelegate respondsToSelector:@selector(loadingViewDidTapped:)]) {
        [self.wqdelegate loadingViewDidTapped:self];
    }
    
}


- (void) animate {
    
    CGFloat step = 10;
    
    if (@available(iOS 10.0, *)) {
        
        step = (self.loadingView.height - self.loadingShadowImageView.height)/ (CGFloat)(self.time.preferredFramesPerSecond *1.5);
        
    } else {
        // Fallback on earlier versions
       step = (self.loadingView.height - self.loadingShadowImageView.height)/ (CGFloat)(self.time.frameInterval *1.5);
    }
    
    self.loadingImageView.y =  self.loadingImageView.y + (self.isUp ? -step : step);
    
    CGFloat scale = self.loadingImageView.y /(self.loadingView.height - self.loadingShadowImageView.height - self.loadingImageView.height)/2;
    self.loadingShadowImageView.transform = CGAffineTransformMakeTranslation(0.7+ scale, 0.7 + scale);
    if (self.loadingImageView.y > 0 ) {
        self.isUp = YES;
    } else if (self.loadingImageView.y > self.loadingView.height - self.loadingShadowImageView.height - self.loadingImageView.height){
        self.isUp = NO;
    }
    
}

@end

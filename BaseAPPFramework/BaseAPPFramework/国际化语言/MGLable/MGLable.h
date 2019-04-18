//
//  MGLable.h
//  MGLableExample
//
//  Created by Memet on 7/28/16.
//  Copyright © 2016 Memet. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MGLable : UIView

@property(nonatomic,assign) NSWritingDirection writingDirection; //决定文字的编写方向 (例如：RTL【从右到左】 和 LTR【从左到右】)

@property(nonatomic,copy) NSString *text; //Label文本内容

@property(nonatomic,strong) UIFont *font; //控制字体

@property(nonatomic,strong) UIColor *textColor; //控制字体颜色

@property(nonatomic,strong) UIColor *shadowColor; //文字的阴影

@property(nonatomic,assign) CGSize shadowOffset; //文字的阴影偏移

@property(nonatomic,assign) NSTextAlignment textAlignment; //对齐方式

@property(nonatomic,assign) NSLineBreakMode lineBreakMode; //不够用时 末尾显示方式abc...

@property(nonatomic,assign) NSInteger numberOfLines; //文本的行数

@property(nonatomic,assign) CGFloat firstLineHeadIndent; //首行缩进



@end

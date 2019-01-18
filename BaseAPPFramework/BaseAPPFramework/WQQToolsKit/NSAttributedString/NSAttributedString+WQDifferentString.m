//
//  NSAttributedString+WQDifferentString.m
//  BaseAPPFramework
//
//  Created by mac on 2019/1/18.
//  Copyright © 2019年 Robinson. All rights reserved.
//

#import "NSAttributedString+WQDifferentString.h"
#import <objc/runtime.h>
#import "WQDifferentStringHeader.h"
@implementation NSAttributedString (WQDifferentString)
// 获取带有不同样式的文字内容
//stringArray 字符串数组
//attributeAttay 样式数组
+ (NSAttributedString *)attributedText:(NSArray*)stringArray attributeAttay:(NSArray *)attributeAttay{
    // 定义要显示的文字内容
    NSString * string = [stringArray componentsJoinedByString:@""];//拼接传入的字符串数组
    // 通过要显示的文字内容来创建一个带属性样式的字符串对象
    NSMutableAttributedString * result = [[NSMutableAttributedString alloc] initWithString:string];
    for(NSInteger i = 0; i < stringArray.count; i++){
        // 将某一范围内的字符串设置样式
//        [result setAttributes:attributeAttay[i] range:[string rangeOfString:stringArray[i]]];
        [result setAttributes:[self attributeAttArray:attributeAttay][i] range:[string rangeOfString:stringArray[i]]];
        
     
    }
    
    // 返回已经设置好了的带有样式的文字
    return [[NSAttributedString alloc] initWithAttributedString:result];
}

+ (NSMutableArray *)attributeAttArray:(NSArray *)attributeAttay{
    NSMutableArray *array = [NSMutableArray array];
    NSLog(@"=====%@",attributeAttay);
    for (NSInteger i = 0; i< array.count; i++) {
     
    }
    
//    [dict setValue:@{NSFontAttributeName:[UIFont systemFontOfSize:15]} forKey:@"1"];
////    [dict setValue:[self attributesFont] forKey:@"2"];
//    [dict setValue:@{NSFontAttributeName:[UIFont systemFontOfSize:25]} forKey:@"3"];
    return array;
}

- (void)setAttributedfont:(CGFloat)attributedFont{
    objc_setAssociatedObject(self, WQ_NSAttributedString_Font, @(attributedFont), OBJC_ASSOCIATION_ASSIGN);
}
- (CGFloat)attributedfont {
    return [objc_getAssociatedObject(self, WQ_NSAttributedString_Font) doubleValue];
}


/* 1> NSFontAttributeName(字体)
      该属性所对应的值是一个 UIFont 对象。该属性用于改变一段文本的字体。如果不指定该属性，则默认为12-point Helvetica(Neue)。
 */
+ (NSDictionary *)attributesFont:(UIFont *)font
{
    NSDictionary *dic = @{NSFontAttributeName:font};
    return dic;
}
/* 2> NSParagraphStyleAttributeName(段落)
    该属性所对应的值是一个 NSParagraphStyle 对象。该属性在一段文本上应用多个属性。如果不指定该属性，则默认为 NSParagraphStyle 的defaultParagraphStyle 方法返回的默认段落属性。
 */
- (NSDictionary *)attributesParagraphStyle:(NSParagraphStyle *)paragraphStyle
{
    NSDictionary *dic = @{NSParagraphStyleAttributeName:paragraphStyle};
    return dic;
}

/*
 3> NSForegroundColorAttributeName(字体颜色)
    该属性所对应的值是一个 UIColor 对象。该属性用于指定一段文本的字体颜色。如果不指定该属性，则默认为黑色。
*/
+ (NSDictionary *)attributesColor:(UIColor *)color
{
    NSDictionary *dic = @{NSForegroundColorAttributeName:color};
    return dic;
}
/* 4> NSBackgroundColorAttributeName(字体背景色)
    该属性所对应的值是一个 UIColor 对象。该属性用于指定一段文本的背景颜色。如果不指定该属性，则默认无背景色。
 */
- (NSDictionary *)attributesbgColor:(UIColor *)bgColor
{
    NSDictionary *dic = @{NSBackgroundColorAttributeName:bgColor};
    return dic;
}
/* 5> NSLigatureAttributeName(连字符)
    该属性所对应的值是一个 NSNumber 对象(整数)。连体字符是指某些连在一起的字符，它们采用单个的图元符号。0 表示没有连体字符。1 表示使用默认的连体字符。2表示使用所有连体符号。默认值为 1（注意，iOS 不支持值为 2）。
 */
- (NSDictionary *)attributesLigature:(NSNumber *)isLigature
{
    NSDictionary *dic = @{NSLigatureAttributeName:isLigature};
    return dic;
}

/* 6> NSKernAttributeName(字间距)
    该属性所对应的值是一个 NSNumber 对象(整数)。字母紧排指定了用于调整字距的像素点数。字母紧排的效果依赖于字体。值为 0 表示不使用字母紧排。默认值为0。
 */
- (NSDictionary *)attributesKern:(NSNumber *)isKern
{
    NSDictionary *dic = @{NSKernAttributeName:isKern};
    return dic;
}

/* 7> NSStrikethroughStyleAttributeName(删除线)
    该属性所对应的值是一个 NSNumber 对象(整数)。该值指定是否在文字上加上删除线，该值参考“Underline Style Attributes”。默认值是NSUnderlineStyleNone。
 */
- (NSDictionary *)attributesStrikethroughStyle:(NSNumber *)strikethroughStyle
{
    NSDictionary *dic = @{NSKernAttributeName:strikethroughStyle};
    return dic;
}
/* 8> NSUnderlineStyleAttributeName(下划线)
    该属性所对应的值是一个 NSNumber 对象(整数)。该值指定是否在文字上加上下划线，该值参考“Underline Style Attributes”。默认值是NSUnderlineStyleNone。
 */
- (NSDictionary *)attributesUnderlineStyle:(NSNumber *)underlineStyle
{
    NSDictionary *dic = @{NSKernAttributeName:underlineStyle};
    return dic;
}

/* 9> NSStrokeColorAttributeName(边线颜色)
 该属性所对应的值是一个 UIColor 对象。如果该属性不指定（默认），则等同于 NSForegroundColorAttributeName。否则，指定为删除线或下划线颜色。更多细节见“Drawing attributedstrings that are both filled and stroked”。
 */
- (NSDictionary *)attributesStrokeColor:(UIColor *)strokeColor
{
    NSDictionary *dic = @{NSKernAttributeName:strokeColor};
    return dic;
}

/* 10> NSStrokeWidthAttributeName(边线宽度)
     该属性所对应的值是一个 NSNumber 对象(小数)。该值改变描边宽度（相对于字体size 的百分比）。默认为 0，即不改变。正数只改变描边宽度。负数同时改变文字的描边和填充宽度。例如，对于常见的空心字，这个值通常为3.0。
 */
- (NSDictionary *)attributesStrokeWidth:(NSNumber *)strokeWidth
{
    NSDictionary *dic = @{NSStrokeWidthAttributeName:strokeWidth};
    return dic;
}

/* 11>  NSShadowAttributeName(阴影)
     该属性所对应的值是一个 NSShadow 对象。默认为 nil。
 */
- (NSDictionary *)attributesShadow:(NSShadow *)shadow
{
    NSDictionary *dic = @{NSVerticalGlyphFormAttributeName:shadow};
    return dic;
}

/* 12> NSVerticalGlyphFormAttributeName(横竖排版)
     该属性所对应的值是一个 NSNumber 对象(整数)。0 表示横排文本。1 表示竖排文本。在 iOS 中，总是使用横排文本，0 以外的值都未定义。
 */
- (NSDictionary *)attributesVerticalGlyph:(NSNumber *)isVH
{
    NSDictionary *dic = @{NSVerticalGlyphFormAttributeName:isVH};
    return dic;
}


@end

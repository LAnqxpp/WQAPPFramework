//
//  NSAttributedString+WQDifferentString.h
//  BaseAPPFramework
//
//  Created by mac on 2019/1/18.
//  Copyright © 2019年 Robinson. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface NSAttributedString (WQDifferentString)
@property (nonatomic ,assign)CGFloat attributedFont;
//@property (nonatomic ,strong)NSString *attributedColor;
//@property (nonatomic ,retain)NSParagraphStyle *paragraphStyle;
+ (NSAttributedString *)attributedText:(NSArray*)stringArray attributeAttay:(NSArray *)attributeAttay;
@end

NS_ASSUME_NONNULL_END

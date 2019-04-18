//
//  MGLable.m
//  MGLableExample
//
//  Created by Memet on 7/28/16.
//  Copyright © 2016 Memet. All rights reserved.
//

#import "MGLable.h"


@implementation MGLable

-(instancetype)initWithFrame:(CGRect)frame{
    
    if ([super initWithFrame:frame]) {
        
        //设定属性的默认值
        [self setDefaultValues];
    }
    return self;
}

-(void)setDefaultValues{

    self.writingDirection = NSWritingDirectionRightToLeft;
    
    self.text = @"MGLable";
    
    self.font = [UIFont systemFontOfSize:17];
    
    self.textColor = [UIColor blackColor];
    
    self.shadowColor = [UIColor clearColor];
    
    self.shadowOffset = CGSizeZero;
    
    self.textAlignment = NSTextAlignmentJustified;
    
    self.lineBreakMode = NSLineBreakByWordWrapping;
    
    self.firstLineHeadIndent = 0.001;
    
    self.backgroundColor = [UIColor whiteColor];
    
}

-(void)drawRect:(CGRect)rect{
    
    //段落样式设定
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    
    paragraphStyle.alignment = self.textAlignment;
    
    paragraphStyle.lineBreakMode = self.lineBreakMode;
    
    paragraphStyle.baseWritingDirection = self.writingDirection;
    
    paragraphStyle.firstLineHeadIndent = self.firstLineHeadIndent;
    
    //阴影
    NSShadow *shadow = [[NSShadow alloc] init];
    
    shadow.shadowColor = self.shadowColor;
    
    shadow.shadowOffset = self.shadowOffset;
    
    //指定绘制标准
    [self.text drawInRect:rect withAttributes:@{
                                                   NSFontAttributeName:self.font,
                                                   
                                                   NSParagraphStyleAttributeName:paragraphStyle,
                                                   
                                                   NSForegroundColorAttributeName:self.textColor,
                                                   
                                                   NSShadowAttributeName:shadow,
                                                   
                                                   }];
}


@end

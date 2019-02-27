//
//  LTTestTableViewCell.h
//  LTTableViewCell
//
//  Created by 高刘通 on 17/5/27.
//  Copyright © 2017年 1282990794@qq.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LTTableViewCell.h"

typedef NS_ENUM(NSUInteger, LTButtonType) {
    LTButtonTypeFirst,
    LTButtonTypeSecond,
    LTButtonTypeThird,
    LTButtonTypeForth
};

@interface LTTestTableViewCell : LTTableViewCell

@property(assign, nonatomic) LTButtonType buttonType;

@end

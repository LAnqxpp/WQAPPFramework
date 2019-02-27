//
//  LTTestTableViewCell.m
//  LTTableViewCell
//
//  Created by 高刘通 on 17/5/27.
//  Copyright © 2017年 1282990794@qq.com. All rights reserved.
//

#import "LTTestTableViewCell.h"

@implementation LTTestTableViewCell


-(void)glt_configSubviews{
    
    UIButton *btn1 = [self createBtnWithFrame:CGRectMake(15, 10, 60, 40) title:@"button1" buttonType:LTButtonTypeFirst];
    
    UIButton *btn2 = [self createBtnWithFrame:CGRectMake(btn1.frame.size.width + btn1.frame.origin.x + 10, 10, 60, 40) title:@"button2" buttonType:LTButtonTypeSecond];
    
    UIButton *btn3 = [self createBtnWithFrame:CGRectMake(btn2.frame.size.width + btn2.frame.origin.x + 10, 10, 60, 40) title:@"button3" buttonType:LTButtonTypeThird];
    
    [self createBtnWithFrame:CGRectMake(btn3.frame.size.width + btn3.frame.origin.x + 10, 10, 60, 40) title:@"button4" buttonType:LTButtonTypeForth];
}

-(void)selectClick:(UIButton *)btn{
    if (self.glt_didSelectIndexParamtersBlock) {
        self.glt_didSelectIndexParamtersBlock(self.glt_indexPath, btn.tag, @{@"paramters":@"自定义内容"});
    }
    
    
//    if (self.glt_didSelectIndexBlock) {
//        self.glt_didSelectIndexBlock(self.glt_indexPath, btn.tag);
//    }
    
    
    /*
    if (self.glt_didSelectBlock) {
        self.glt_didSelectBlock(self.glt_indexPath);
    }
     */
    
     /*
    if (self.glt_didSelectParamtersBlock) {
        self.glt_didSelectParamtersBlock(self.glt_indexPath, @{@"paramters":@"自定义内容"});
    }
       */
}

-(UIButton *)createBtnWithFrame:(CGRect)rect title:(NSString *)title buttonType:(LTButtonType)type{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = rect;
    btn.backgroundColor = [UIColor redColor];
    [btn addTarget:self action:@selector(selectClick:) forControlEvents:UIControlEventTouchUpInside];
    btn.tag = type;
    btn.titleLabel.font = [UIFont systemFontOfSize:14];
    [btn setTitle:title forState:UIControlStateNormal];
    [self.contentView addSubview:btn];
    return btn;
}

+(CGFloat)returnHeight{
    return 60.0f;
}

+(CGFloat)returnHeightWithModel:(NSObject *)model{
    return 60.0f;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

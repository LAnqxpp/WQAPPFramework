//
//  LTTableViewCell.m
//  WeiYouDuoBao
//
//  Created by 高刘通 on 17/4/27.
//  Copyright © 2017年 LT. All rights reserved.
//

#import "LTTableViewCell.h"

@implementation LTTableViewCell

@synthesize glt_indexPath, glt_didSelectBlock, glt_didSelectIndexBlock, glt_didSelectParamtersBlock, glt_didSelectIndexParamtersBlock;

+(instancetype)cellWithTableview:(UITableView *)tableView{
    NSString * const reuseId= [NSString stringWithUTF8String:object_getClassName([self class])];
    LTTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:reuseId];
    if (!cell) {
        cell=[[self alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseId];
    }
    return cell;
}

+(instancetype)cellWithTableview:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath{
    NSString * const reuseId= [NSString stringWithUTF8String:object_getClassName([self class])];
    LTTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:reuseId];
    if (!cell) {
        cell=[[self alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseId];
    }
    cell.glt_indexPath = indexPath;
    return cell;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self glt_configSubviews];
    }
    return self;
}

-(void)glt_configSubviews{};

+(CGFloat)returnHeight{
    return 0.0f;
}

+(CGFloat)returnHeightWithModel:(NSObject *)model{
    return 0.0f;
}

-(void)glt_didSelectBlock:(glt_didSelectBlock)didSelectBlock{
    self.glt_didSelectBlock = [didSelectBlock copy];
}

-(void)glt_didSelectIndexBlock:(glt_didSelectIndexBlock)didSelectBlock{
    self.glt_didSelectIndexBlock = [didSelectBlock copy];
}

-(void)glt_didSelectParamtersBlock:(glt_didSelectParamtersBlock)didSelectBlock{
    self.glt_didSelectParamtersBlock = [didSelectBlock copy];
}

-(void)glt_didSelectParamtersIndexBlock:(glt_didSelectIndexParamtersBlock)didSelectBlock{
    self.glt_didSelectIndexParamtersBlock = [didSelectBlock copy];
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

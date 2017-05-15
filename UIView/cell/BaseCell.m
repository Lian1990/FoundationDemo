//
//  BaseCell.m
//  FlyUpCloud
//
//  Created by LIAN on 16/10/12.
//  Copyright © 2016年 com.Alice. All rights reserved.
//

#import "BaseCell.h"

@implementation BaseCell

@synthesize index = _index;

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self buildStage];
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
    
}
-(void)buildStage{
    
}

- (void)awakeFromNib {
    // Initialization code
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (id)initWithCellIdentifier:(NSString *)cellID{
    return [self initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
}
+(NSString *)cellIdentifier{
    return NSStringFromClass([self class]);
}
+(id)cellForTableView:(UITableView *)tableView{
    NSString *cellID = [self cellIdentifier];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[self alloc]initWithCellIdentifier:cellID];
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    }
    return cell;
}

@end

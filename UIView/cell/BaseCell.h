//
//  BaseCell.h
//  FlyUpCloud
//
//  Created by LIAN on 16/10/12.
//  Copyright © 2016年 com.Alice. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseCell : UITableViewCell

@property (nonatomic,assign) int index;

+ (id)cellForTableView:(UITableView *)tableView;
+ (NSString *)cellIdentifier;

- (id)initWithCellIdentifier:(NSString *)cellID;
- (void)buildStage;

@end

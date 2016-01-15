//
//  GPStatusCell.h
//  05-微博界面
//
//  Created by MS on 15-8-20.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GPStatus.h"

@interface GPStatusCell : UITableViewCell

@property(nonatomic,strong)GPStatus * status;

@property(nonatomic, assign) CGFloat cellHeight;
+ (instancetype)statusCellWithTableView:(UITableView *)tableView;

@end

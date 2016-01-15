//
//  SJCustomCellVC.m
//  SJTableViewDemo
//
//  Created by SPIREJ on 16/1/15.
//  Copyright © 2016年 SPIREJ. All rights reserved.
//

#import "SJCustomCellVC.h"
#import "GPStatus.h"
#import "GPStatusCell.h"

#define kDeviceWidth  [UIScreen mainScreen].bounds.size.width
#define kDeviceHeight  [UIScreen mainScreen].bounds.size.height

@interface SJCustomCellVC ()<UITableViewDelegate, UITableViewDataSource>
@property(nonatomic, strong) UITableView *tableView;
@property(nonatomic,strong)NSArray * statuses; //数据源


@end

@implementation SJCustomCellVC
- (NSArray *)statuses
{
    if (_statuses == nil) {
        //1.
        NSString * path = [[NSBundle mainBundle]pathForResource:@"statuses.plist" ofType:nil];
        NSArray * dicts = [NSArray arrayWithContentsOfFile:path];
        
        NSMutableArray * objs = [NSMutableArray array];
        //2.
        for (NSDictionary * dic in dicts) {
            GPStatus * status = [GPStatus statusWithDict:dic];
            [objs addObject:status];
        }
        //3.
        _statuses = objs;
    }
    return _statuses;
}

- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] init];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.frame = CGRectMake(0, 0, kDeviceWidth, kDeviceHeight);
        [self.view addSubview:_tableView];
    }
    return _tableView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"简单的微博界面示例";
    
    [self tableView];
    [self statuses];
}
//每组显示多少行cell数据
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _statuses.count;
}
//cell内容设置，属性设置
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifily = @"cellIdentifily";
    GPStatusCell *cell = [tableView dequeueReusableCellWithIdentifier:identifily];
    if (cell == nil) {
        cell = [[GPStatusCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifily];
    }
    cell.status = self.statuses[indexPath.row];
    return cell;
}

// Variable height support
//cell 的高度（每组可以不一样）
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifily = @"cellIdentifily";
    GPStatusCell *cell = [tableView dequeueReusableCellWithIdentifier:identifily];
    if (cell == nil) {
        cell = [[GPStatusCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifily];
    }
    cell.status = self.statuses[indexPath.row];
    return cell.cellHeight;
}


@end

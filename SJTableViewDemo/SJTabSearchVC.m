//
//  SJTabSearchVC.m
//  SJTableViewDemo
//
//  Created by SPIREJ on 16/1/15.
//  Copyright © 2016年 SPIREJ. All rights reserved.
//

#import "SJTabSearchVC.h"

#define kDeviceWidth  [UIScreen mainScreen].bounds.size.width
#define kDeviceHeight  [UIScreen mainScreen].bounds.size.height
#define cellHeight 60

#define kItems @[@[@"HiBOasd",@"Hasdhjbaj",@"Hsjhdyw"],@[@"Jsjdak",@"Jack"],@[@"Miasd",@"Masdhjbaj",@"Money",@"Msoshyw"], @[@"Ssanat", @"Sdouua"], @[@"Wangjiba"]]

@interface SJTabSearchVC ()<UITableViewDelegate, UITableViewDataSource>
@property(nonatomic, strong) UITableView *tableView;
@property(nonatomic, copy)NSMutableArray *titleArray;

@end

@implementation SJTabSearchVC
- (NSMutableArray *)titleArray{
    if (!_titleArray) {
        _titleArray = [NSMutableArray arrayWithArray:kItems];
    }
    return _titleArray;
}
- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame: CGRectMake(0, 0, kDeviceWidth, kDeviceHeight) style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [self.view addSubview:_tableView];
    }
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"UITableView右侧索引";
    
    [self tableView];
    [self titleArray];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 5;
}
//每组显示多少行cell数据
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    switch (section) {
        case 0:
            return 3;
            break;
        case 1:
            return 2;
            break;
        case 2:
            return 4;
            break;
        case 3:
            return 2;
            break;
        case 4:
            return 1;
            break;

        default:
            break;
    }
    return 3;
}
//cell内容设置，属性设置
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifily = @"cellIdentifily";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifily];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifily];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    cell.textLabel.text = _titleArray[indexPath.section][indexPath.row];
    
    return cell;
}

// Variable height support
//cell 的高度（每组可以不一样）
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return cellHeight;
}

@end

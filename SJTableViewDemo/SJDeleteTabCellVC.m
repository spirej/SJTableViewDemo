//
//  SJDeleteTabCellVC.m
//  SJTableViewDemo
//
//  Created by SPIREJ on 16/1/18.
//  Copyright © 2016年 SPIREJ. All rights reserved.
//


#import "SJDeleteTabCellVC.h"

#define kDeviceWidth  [UIScreen mainScreen].bounds.size.width
#define kDeviceHeight  [UIScreen mainScreen].bounds.size.height
#define cellHeight 60

#define kItems @[@[@"HiBOasd",@"Hasdhjbaj",@"Hsjhdyw"],@[@"Jsjdak",@"Jack"],@[@"Miasd",@"Masdhjbaj",@"Money",@"Msoshyw"], @[@"Ssanat", @"Sdouua"], @[@"Wangjiba"]]

#define kDetialLabText   @[@[@"18613376888",@"18613376888",@"18613376888"],@[@"18613376888",@"18613376888"],@[@"18613376888",@"18613376888",@"18613376888",@"18613376888"], @[@"18613376888", @"18613376888"], @[@"18613376888"]]

#define kHeaderTitle  @[@"H",@"J",@"M",@"S",@"W"]
#define kFooterTitle   @[@"H footer title",@"J footer title",@"M footer title",@"S footer title",@"W footer title"]

@interface SJDeleteTabCellVC ()<UITableViewDelegate, UITableViewDataSource>
@property(nonatomic, strong) UITableView *tableView;
@property(nonatomic, strong)NSMutableArray *titleArray;
@property(nonatomic, strong)NSMutableArray *detailArray;

@end

@implementation SJDeleteTabCellVC
- (NSMutableArray *)titleArray{
    if (!_titleArray) {
        _titleArray = [NSMutableArray arrayWithArray:kItems];
    }
    return _titleArray;
}
- (NSMutableArray *)detailArray{
    if (!_detailArray) {
        _detailArray = [NSMutableArray arrayWithArray:kDetialLabText];
    }
    return _detailArray;
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
    
    self.navigationItem.title = @"UITableView删除操作";
    
    [self tableView];
    [self titleArray];
    [self detailArray];
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
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifily];
//        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    cell.textLabel.text = _titleArray[indexPath.section][indexPath.row];
//    cell.detailTextLabel.text = _detailArray[indexPath.section][indexPath.row];
    return cell;
}

// Variable height support
//cell 的高度（每组可以不一样）
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return cellHeight;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return kHeaderTitle[section];
}
- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
    return kFooterTitle[section];
}
#pragma mark - 返回每组标题索引
- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView{
    NSMutableArray *indexs = [[NSMutableArray alloc] init];
    for (int i = 0; i < kHeaderTitle.count; i++) {
        [indexs addObject:kHeaderTitle[i]];
    }
    return indexs;
}
//删除
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [_titleArray removeObject:_titleArray[indexPath.section][indexPath.row]];
        [_detailArray removeObject:_detailArray[indexPath.section][indexPath.row]];
//        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationBottom];
        [tableView reloadData];
        
    }
}
//排序
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath{
    
}

@end

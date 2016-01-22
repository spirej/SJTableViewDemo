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

#define kItems @[@"HiBOasd",@"Hasdhjbaj",@"Hsjhdyw",@"Jsjdak",@"Jack",@"Miasd",@"Masdhjbaj",@"Money",@"Msoshyw", @"Ssanat", @"Sdouua", @"Wangjiba"]
#define kDetails @[@"18613376888",@"18613376888",@"18613376888",@"18613376888",@"18613376888",@"18613376888",@"18613376888",@"18613376888",@"18613376888", @"18613376888", @"18613376888", @"18613376888"]

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
        _detailArray = [NSMutableArray arrayWithArray:kDetails];
    }
    return _detailArray;
}
- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame: CGRectMake(0, 0, kDeviceWidth, kDeviceHeight) style:UITableViewStylePlain];
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
    return 1;
}
//每组显示多少行cell数据
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _titleArray.count;
}
//cell内容设置，属性设置
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifily = @"cellIdentifily";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifily];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifily];
//        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    cell.textLabel.text = _titleArray[indexPath.row];
//    cell.detailTextLabel.text = _detailArray[indexPath.row];
    return cell;
}

// Variable height support
//cell 的高度（每组可以不一样）
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return cellHeight;
}


//删除
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [_titleArray removeObject:_titleArray[indexPath.row]];
//        [_detailArray removeObject:_detailArray[indexPath.row]];

        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationBottom];
    }
}
//排序
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath{
    
}

@end

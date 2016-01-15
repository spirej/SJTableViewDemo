//
//  ViewController.m
//  SJTableViewDemo
//
//  Created by SPIREJ on 16/1/15.
//  Copyright © 2016年 SPIREJ. All rights reserved.
//

#import "ViewController.h"
#import "SJBasicTableView.h"
#import "SJCustomCellVC.h"
#import "SJTabSearchVC.h"

#define kDeviceWidth  [UIScreen mainScreen].bounds.size.width
#define kDeviceHeight  [UIScreen mainScreen].bounds.size.height
#define cellHeight 70

#define kLabelTitles @[@"1- TableView基本代理方法，属性",@"2- 纯代码自定义类似微博界面cell",@"3- TableView右侧的索引栏示例"]
#define kDetialLabelText @[@"SJBasicTableView",@"SJCustomCellVC",@"SJTabSearchVC.h"]

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>
@property(nonatomic, strong) UITableView *tableView;
@property(nonatomic, copy)NSMutableArray *labelTextArray;
@property(nonatomic, copy)NSMutableArray *DetailLabelTextArray;

@end

@implementation ViewController

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
- (NSMutableArray *)labelTextArray{
    if (!_labelTextArray) {
        _labelTextArray = [NSMutableArray arrayWithArray:kLabelTitles];
    }
    return _labelTextArray;
}
- (NSMutableArray *)DetailLabelTextArray{
    if (!_DetailLabelTextArray) {
        _DetailLabelTextArray = [NSMutableArray arrayWithArray:kDetialLabelText];
    }
    return _DetailLabelTextArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"UITableView 详解";

    [self tableView];
    [self labelTextArray];
    [self DetailLabelTextArray];
}
//每组显示多少行cell数据
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _labelTextArray.count;
}
//cell内容设置，属性设置
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifily = @"cellIdentifily";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifily];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifily];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }
    cell.textLabel.text = _labelTextArray[indexPath.row];
    cell.detailTextLabel.text = _DetailLabelTextArray[indexPath.row];
    return cell;
}

// Variable height support
//cell 的高度（每组可以不一样）
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 70.f;
}

//选中cell时调用
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    switch (indexPath.row) {
        case 0:
        {
            SJBasicTableView *basicVC = [[SJBasicTableView alloc] init];
            [self.navigationController pushViewController:basicVC animated:YES];
        }
            break;
        case 1:
        {
            SJCustomCellVC *customcellVC = [[SJCustomCellVC alloc] init];
            [self.navigationController pushViewController:customcellVC animated:YES];
        }
            break;
        case 2:
        {
            SJTabSearchVC *tabSearchVC = [[SJTabSearchVC alloc] init];
            [self.navigationController pushViewController:tabSearchVC animated:YES];
        }
            break;

        default:
            break;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

//
//  SJBasicTableView.m
//  SJTableViewDemo
//
//  Created by SPIREJ on 16/1/15.
//  Copyright © 2016年 SPIREJ. All rights reserved.
//

#import "SJBasicTableView.h"

#define kDeviceWidth  [UIScreen mainScreen].bounds.size.width
#define kDeviceHeight  [UIScreen mainScreen].bounds.size.height
#define cellHeight 70

@interface SJBasicTableView ()<UITableViewDelegate, UITableViewDataSource>
@property(nonatomic, strong) UITableView *tableView;
@end

@implementation SJBasicTableView

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
    
    [self tableView];
    
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kDeviceWidth, 200)];
    headerView.backgroundColor = [UIColor orangeColor];
    _tableView.tableHeaderView = headerView;
    UIView *footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kDeviceWidth, 200)];
    footerView.backgroundColor = [UIColor cyanColor];
    _tableView.tableFooterView = footerView;
}
//有多少组（默认为1）
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 5;
}
//每组显示多少行cell数据
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}
//cell内容设置，属性设置
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifily = @"cellIdentifily";
    static NSString *identKey = @"identkey";
    UITableViewCell *cell;
    if (indexPath.section == 0 && indexPath.row == 0) {
        cell = [tableView dequeueReusableCellWithIdentifier:identKey];
    }else{
        cell = [tableView dequeueReusableCellWithIdentifier:identifily];
    }
    if (cell == nil) {
        if (indexPath.section == 0 && indexPath.row == 0) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identKey];
            UISwitch *sw = [[UISwitch alloc] init];
            [sw addTarget:self action:@selector(switchValueChange:) forControlEvents:UIControlEventValueChanged];
            cell.accessoryView = sw;
        }else{
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifily];
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }
    }
    cell.textLabel.text = [NSString stringWithFormat:@"textLabel.text %ld",indexPath.row];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"detailTextLabel.text %ld",indexPath.row];
    cell.imageView.image = [UIImage imageNamed:@"hello.jpg"];
    /*
     UITableViewCellAccessoryNone,
     UITableViewCellAccessoryDisclosureIndicator,
     UITableViewCellAccessoryDetailDisclosureButton __TVOS_PROHIBITED,
     UITableViewCellAccessoryCheckmark,
     UITableViewCellAccessoryDetailButton NS_ENUM_AVAILABLE_IOS(7_0)  __TVOS_PROHIBITED
     */
    return cell;
}
//每个cell将要加载时调用
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"willDisplayCell");
}
//加载组头标题时调用
- (void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)sectio{
    NSLog(@"willDisplayHeaderView");
}
//加载尾头标题时调用
- (void)tableView:(UITableView *)tableView willDisplayFooterView:(UIView *)view forSection:(NSInteger)section{
    NSLog(@"willDisplayFooterView");
}
//滑动时，cell消失时调用
- (void)tableView:(UITableView *)tableView didEndDisplayingCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath*)indexPath{
    NSLog(@"didEndDisplayingCell");
}
//组头标题消失时调用
- (void)tableView:(UITableView *)tableView didEndDisplayingHeaderView:(UIView *)view forSection:(NSInteger)section{
    NSLog(@"didEndDisplayingHeaderView");
}
//组尾标题消失时调用
- (void)tableView:(UITableView *)tableView didEndDisplayingFooterView:(UIView *)view forSection:(NSInteger)section{
    NSLog(@"didEndDisplayingFooterView");
}

// Variable height support
//cell 的高度（每组可以不一样）
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 70.f;
}
//group 风格的cell的组头部标题部分高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 15.0f;
}
//group 风格的cell的尾部标题部分的高度
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 15.0f;
}

//————————————————————————/
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return [NSString stringWithFormat:@"headerGroup%ld",section];
}
- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
    return [NSString stringWithFormat:@"footerGroup%ld",section];
}
//选中cell时调用
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSLog(@"didSelectRowAtIndexPath");
}
//离开选中状态时调用（即选中另一个cell时，第一个cell会调用它的这个方法）
- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"didDeselectRowAtIndexPath");
}


#pragma mark - 辅助方法
- (void)switchValueChange:(UISwitch *)sw{
    NSLog(@"UISwitch value is %i",sw.on);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

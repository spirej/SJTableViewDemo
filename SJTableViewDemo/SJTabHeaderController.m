//
//  SJTabHeaderController.m
//  SJTableViewDemo
//
//  Created by SPIREJ on 16/1/21.
//  Copyright © 2016年 SPIREJ. All rights reserved.
//

#import "SJTabHeaderController.h"

#define kDeviceWidth  [UIScreen mainScreen].bounds.size.width
#define kDeviceHeight  [UIScreen mainScreen].bounds.size.height
#define cellHeight 60

#define kItems @[@"HiBOasd",@"Hasdhjbaj",@"Hsjhdyw",@"Jsjdak",@"Jack",@"Miasd",@"Masdhjbaj",@"Money",@"Msoshyw", @"Ssanat", @"Sdouua", @"Sdouua", @"Sdouua", @"Sdouua", @"Sdouua", @"Sdouua", @"Sdouua", @"Wangjiba"]

const CGFloat backGroupHeight = 200;
const CGFloat headImageHeight = 80;

@interface SJTabHeaderController ()<UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate>
{
    UIImageView *imageBg;

    UILabel *titleLb;
    
//    UIButton *leftBtn;
//    UIButton *rightBtn;
}



@property(nonatomic, strong) UITableView *tableView;
@property(nonatomic, strong)NSMutableArray *titleArray;

@end

@implementation SJTabHeaderController
- (NSMutableArray *)titleArray{
    if (!_titleArray) {
        _titleArray = [NSMutableArray arrayWithArray:kItems];
    }
    return _titleArray;
}
- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame: CGRectMake(0, 0, kDeviceWidth, kDeviceHeight) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.contentInset = UIEdgeInsetsMake(backGroupHeight - 64, 0, 0, 0);
        [self.view addSubview:_tableView];
    }
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self tableView];
    [self titleArray];
    [self setUpUI];
}

- (void)setUpUI{
    imageBg = [[UIImageView alloc] initWithFrame:CGRectMake(0, -backGroupHeight, kDeviceWidth, backGroupHeight)];
    imageBg.image = [UIImage imageNamed:@"bg_header.png"];
    [_tableView addSubview:imageBg];
    
    titleLb = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 30)];
    titleLb.textColor = [UIColor colorWithRed:255 green:255 blue:255 alpha:0];
    titleLb.text = @"Header效果测试";
    titleLb.textAlignment = NSTextAlignmentCenter;
    self.navigationItem.titleView = titleLb;
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
    }
    cell.textLabel.text = _titleArray[indexPath.row];
    return cell;
}

// Variable height support
//cell 的高度（每组可以不一样）
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return cellHeight;
}

#define mark - scrollView delegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat yOffset = scrollView.contentOffset.y;
    CGFloat xOffset = (yOffset + backGroupHeight)/2;
    
    if (yOffset < -backGroupHeight) {
        CGRect rect = imageBg.frame;
        rect.origin.y = yOffset;
        rect.size.height = -yOffset;
        rect.origin.x = xOffset;
        rect.size.width = kDeviceWidth + fabs(xOffset)*2;
        
        imageBg.frame = rect;
    }
    CGFloat alpha = (yOffset + backGroupHeight)/backGroupHeight;
    [self.navigationController.navigationBar setBackgroundImage:[self imageWithColor:[[UIColor orangeColor] colorWithAlphaComponent:alpha]] forBarMetrics:UIBarMetricsDefault];
    titleLb.textColor = [UIColor colorWithRed:255 green:255 blue:255 alpha:alpha];
}

- (UIImage *)imageWithColor:(UIColor *)color{
    //描述矩形
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    //开启位图上下文
    UIGraphicsBeginImageContext(rect.size);
    //获取位图上下文
    CGContextRef content = UIGraphicsGetCurrentContext();
    //使用color演示填充上下文
    CGContextSetFillColorWithColor(content, [color CGColor]);
    //渲染上下文
    CGContextFillRect(content, rect);
    //从上下文中获取图片
    UIImage *currentImage = UIGraphicsGetImageFromCurrentImageContext();
    //结束上下文
    UIGraphicsEndImageContext();
    return currentImage;
}

@end

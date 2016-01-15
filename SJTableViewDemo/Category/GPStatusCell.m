//
//  GPStatusCell.m
//  05-微博界面
//
//  Created by MS on 15-8-20.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "GPStatusCell.h"

@interface GPStatusCell ()

@property(nonatomic, weak) UIImageView * iconView;
@property(nonatomic, weak) UILabel * nameView;
@property(nonatomic, weak) UILabel * textView;
@property(nonatomic, weak) UIImageView * pictureView;
@property(nonatomic, weak) UIImageView * vipView;
/**
 *  cell 的总高度
 */

@end

@implementation GPStatusCell

+ (instancetype)statusCellWithTableView:(UITableView *)tableView
{
    //1.
    NSString * className = NSStringFromClass([self class]);
    UINib * nib = [UINib nibWithNibName:className bundle:nil];
    
    [tableView registerNib:nib forCellReuseIdentifier:className];
    
    //2.
    return [tableView dequeueReusableCellWithIdentifier:className];
}

/**
 *  构造方法 
 *  一般在这个方法中添加需要显示的子控件
 */
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        //头像
        UIImageView * iconView = [[UIImageView alloc] init];
        [self.contentView addSubview:iconView];
        self.iconView = iconView;
        //昵称
        UILabel * nameView = [[UILabel alloc] init];
        [self.contentView addSubview:nameView];
        
        self.nameView = nameView;
        
        //图标
        UIImageView * vipView = [[UIImageView alloc] init];
        [self.contentView addSubview:vipView];
        self.vipView = vipView;
        
        //
        UILabel * textView = [[UILabel alloc] init];
        [self addSubview:textView];
        self.textView = textView;
        
        //
        UIImageView * pictureView = [[UIImageView alloc] init];
        [self.contentView addSubview:pictureView];
        self.pictureView = pictureView;
    }
    
    return self;
}

/**
 *  在这个方法中设置子控件的 frame 和 显示数据
 */
- (void)setStatus:(GPStatus *)status
{
    _status = status;
    
    //设置数据
    [self setingData];
    
    //设置frame
    [self setingFrame];
}

/**
 *  设置数据
 */
- (void)setingData
{
    self.iconView.image = [UIImage imageNamed:self.status.icon];
    self.pictureView.image = [UIImage imageNamed:self.status.picture];
    self.textView.text = self.status.text;
    self.nameView.text = self.status.name;
    self.vipView.image = [UIImage imageNamed:@"vip"];
}

/**
 *  设置 frame
 */
- (void)setingFrame
{
    //控件间的间隔
    CGFloat padding = 10;
    /**
     *  头像 frame
     */
    CGFloat iconX = padding;
    CGFloat iconY = padding;
    CGFloat iconW = 40;
    CGFloat iconH = 40;
    
    self.iconView.frame = CGRectMake(iconX, iconY, iconW,iconH);
    
    /**
     *  昵称 frame
     */
    
    CGFloat nameX = CGRectGetMaxX(self.iconView.frame)+padding;
    CGFloat nameY = iconH/2;
    CGFloat nameH = 20;
    //动态计算name 的长
    CGSize size1 = CGSizeMake(nameH, CGFLOAT_MAX);
    NSDictionary * dic = @{NSFontAttributeName:[UIFont systemFontOfSize:13]};
    size1 = [self.nameView.text boundingRectWithSize:size1 options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil].size;
    CGFloat nameW = size1.height;
    self.nameView.font = [UIFont systemFontOfSize:13];
    
    self.nameView.frame = CGRectMake(nameX, nameY, nameW,nameH);
    
    /**
     *  VIP frame
     */
    CGFloat vipX = CGRectGetMaxX(self.nameView.frame);
    CGFloat vipY = nameY;
    CGFloat vipW = 15;
    CGFloat vipH = 15;
    
    self.vipView.frame = CGRectMake(vipX, vipY, vipW, vipH);
    
    
    /**
     *  正文 frame
     */
    CGFloat textX = padding;
    CGFloat textY = CGRectGetMaxY(self.iconView.frame);
    CGFloat textW = 355;
    
    //动态计算高度的参考值
    CGSize size = CGSizeMake(textW, CGFLOAT_MAX);
    
    //动态计算文字高度
    NSDictionary * attributes = @{NSFontAttributeName:[UIFont systemFontOfSize:17]};
    size = [self.textView.text boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil].size;
    CGFloat textH = size.height;
    self.textView.numberOfLines = 0;
    self.textView.frame = CGRectMake(textX, textY, textW,textH);
    
    
    /**
     *  配图 frame
     */
    CGFloat pictureX = padding;
    CGFloat pictureY = CGRectGetMaxY(self.textView.frame);
    CGFloat pictureW = 80;
    CGFloat pictureH = 60;
    
    self.pictureView.frame = CGRectMake(pictureX, pictureY, pictureW,pictureH);
    
    /**
     *  cell 的总高度
     */
    if (self.status.picture == nil) {
        self.cellHeight = CGRectGetMaxY(self.textView.frame);
    }
    else
        self.cellHeight = CGRectGetMaxY(self.pictureView.frame);
}

@end

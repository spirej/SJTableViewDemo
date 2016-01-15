//
//  GPStatus.h
//  05-微博界面
//
//  Created by MS on 15-8-20.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GPStatus : NSObject

@property(nonatomic,copy) NSString * picture;
@property(nonatomic,copy) NSString * text;
@property(nonatomic,copy) NSString * icon;
@property(nonatomic,copy) NSString * name;
//@property(nonatomic,copy) NSString * id;
@property(nonatomic,copy) NSString * tempId;
@property(nonatomic,assign) BOOL vip;

+ (instancetype) statusWithDict:(NSDictionary *)dict;
- (instancetype) initWithDict:(NSDictionary *)dict;

@end

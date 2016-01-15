//
//  GPStatus.m
//  05-微博界面
//
//  Created by MS on 15-8-20.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "GPStatus.h"

@implementation GPStatus

+ (instancetype)statusWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}

- (instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}
- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    if ([key isEqualToString:@"id"]) {
        self.tempId = value;
    }
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"icon= %@, name= %@, text= %@", _icon, _name, _text];
}
@end

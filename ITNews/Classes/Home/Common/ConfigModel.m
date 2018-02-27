//
//  ConfigModel.m
//  ITNews
//
//  Created by lisongtao on 2018/2/27.
//  Copyright © 2018年 lisongtao. All rights reserved.
//

#import "ConfigModel.h"
@implementation CateModel

@end

@implementation ConfigModel
+ (NSDictionary *)mj_objectClassInArray {
    return @{
             @"menu":[CateModel class]
             };
}
@end

//
//  INConfig.h
//  ITNews
//
//  Created by lisongtao on 2018/2/24.
//  Copyright © 2018年 lisongtao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ConfigModel.h"
@interface INConfig : NSObject
+ (instancetype)manager;
+ (void)setupConfig;
@property (nonatomic, strong) ConfigModel *config;
@end

//
//  ConfigModel.h
//  ITNews
//
//  Created by lisongtao on 2018/2/27.
//  Copyright © 2018年 lisongtao. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface CateModel : NSObject
@property (nonatomic, copy) NSString *cate_id;
@property (nonatomic, copy) NSString *cate_name;
@end

@interface ConfigModel : NSObject
@property (nonatomic, strong) NSArray *menu;
@end

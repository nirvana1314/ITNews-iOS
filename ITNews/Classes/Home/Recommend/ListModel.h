//
//  ListModel.h
//  ITNews
//
//  Created by lisongtao on 2018/2/11.
//  Copyright © 2018年 lisongtao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ListModel : NSObject
@property (nonatomic, copy) NSString *cid;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *thumb;
@property (nonatomic, copy) NSString *cate_id;
@property (nonatomic, copy) NSString *cate_name;
@property (nonatomic, copy) NSString *text;
@end

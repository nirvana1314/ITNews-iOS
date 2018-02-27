//
//  INNetworkMgr.h
//  ITNews
//
//  Created by lisongtao on 2018/2/24.
//  Copyright © 2018年 lisongtao. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef enum : NSUInteger {
    INHttpMethodPost,
    INHttpMethodGet
} INHttpMethod;
@interface INNetworkMgr : NSObject
+ (instancetype)manager;
/**
 *  网络请求的主方法
 *
 *  @param url         url地址
 *  @param httpMethod  请求方式
 *  @param params      请求参数
 *  @param success     请求成功的回调(网络任务, 原始的二进制数据, 当做json解析好的对象, 返回的code码)
 *  @param failure     请求失败的回调(网络任务, 错误NSError)
 */
- (void)requestWithUrl:(NSString *)url
            httpMethod:(INHttpMethod)httpMethod
                params:(NSDictionary *)params
               success:(void (^)(NSURLSessionDataTask *task, NSData *originalData, NSDictionary *jsonDict, NSString *code))success
               failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure;
@end

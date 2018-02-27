//
//  INNetworkMgr.m
//  ITNews
//
//  Created by lisongtao on 2018/2/24.
//  Copyright © 2018年 lisongtao. All rights reserved.
//

#import "INNetworkMgr.h"
#define kTimeOutTime 30
@implementation INNetworkMgr
+ (instancetype)manager{
    static INNetworkMgr *_defaultManager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _defaultManager = [[INNetworkMgr alloc] init];
    });
    return _defaultManager;
}

- (void)requestWithUrl:(NSString *)url
            httpMethod:(INHttpMethod)httpMethod
                params:(NSDictionary *)param
               success:(void (^)(NSURLSessionDataTask *, NSData *, NSDictionary *, NSString *))success
               failure:(void (^)(NSURLSessionDataTask *, NSError *))failure{
    
    /** 1.处理参数(params是用于拼query串的参数字典, param才是真正用于post请求的真实数据字典) */
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithDictionary:param];
    /** 2.发送网络请求 */
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html",nil];
    manager.requestSerializer.timeoutInterval = kTimeOutTime;
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    if (httpMethod == INHttpMethodPost) {
        
        [manager POST:url parameters:param progress:nil success:^(NSURLSessionDataTask *task, NSData *data) {
            NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
            if (jsonDict == nil) {
                NSString *str = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
                NSLog(@"返回类型不是JSON responseString = %@", str);
            }
            if (success) {
                success(task, data, jsonDict, jsonDict[@"code"]);
            }
        } failure:^(NSURLSessionDataTask *task, NSError *error) {
            if (failure) {
                failure(task, error);
            }
        }];
    }else{
        
        [manager GET:url parameters:params progress:nil success:^(NSURLSessionDataTask *task, NSData *data) {
            NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
            if (jsonDict == nil) {
                NSString *str = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
                NSLog(@"返回类型不是JSON responseString = %@", str);
            }
            if (success) {
                success(task, data, jsonDict, jsonDict[@"code"]);
            }
        } failure:^(NSURLSessionDataTask *task, NSError *error) {
            if (failure) {
                failure(task, error);
            }
        }];
    }
}
@end

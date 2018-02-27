//
//  INConfig.m
//  ITNews
//
//  Created by lisongtao on 2018/2/24.
//  Copyright © 2018年 lisongtao. All rights reserved.
//

#import "INConfig.h"

@implementation INConfig
+ (instancetype)manager{
    static INConfig *_defaultManager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _defaultManager = [[INConfig alloc] init];
    });
    return _defaultManager;
}

+ (void)setupConfig {
    /** SDWebImage配置 */
    [[SDWebImageDownloader sharedDownloader] setValue:@"http://api.m123.me/" forHTTPHeaderField:@"Referer"];
    
    INConfig *manager = [INConfig manager];
    [manager configSetting];
}

- (void)configSetting {
    /** 初始化配置请求 */
    INNetworkMgr *mgr = [INNetworkMgr manager];
    [mgr requestWithUrl:MAKE_REQUEST_URL(@"home/init") httpMethod:(INHttpMethodGet) params:nil success:^(NSURLSessionDataTask *task, NSData *originalData, NSDictionary *jsonDict, NSString *code) {
        if (code.integerValue > 0) {
            NSDictionary *data = jsonDict[@"data"];
            self.config = [ConfigModel mj_objectWithKeyValues:data];
        }
        
        [kNotificationCenter postNotificationName:kOnlineConfigCompletionNotification object:nil];
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
    }];
}
@end

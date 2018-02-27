//
//  Const.h
//  DiaoBao
//
//  Created by lisongtao on 2017/7/20.
//  Copyright © 2017年 lst. All rights reserved.
//

#define RunTimeSysVersion       ([[UIDevice currentDevice].systemVersion floatValue])
#define IS_IOS_7                (RunTimeSysVersion >= 7.0f)
#define IS_IOS_8                (RunTimeSysVersion >= 8.0f)
#define IS_IOS_9                (RunTimeSysVersion >= 9.0f)
#define IS_IOS_92               (RunTimeSysVersion >= 9.2f)
#define IS_IOS_11               (RunTimeSysVersion >= 11.0f)
#define IS_IOS_12               (RunTimeSysVersion >= 12.0f)


/**
 *  设置环境 0-测试 1-线上
 */
#define IsOnline 0

/**
 *  app版本号
 */
#define kApiVersion @"1.0"


#if IsOnline

#define API_Prefix  API_Release

#else

#define API_Prefix  API_Test

#endif
/** m123.me */
#define API_Test @"http://api.m123.me/"
#define API_Release @"https://api.m123.me/"

#define MAKE_REQUEST_URL(module) [NSString stringWithFormat:@"%@%@", API_Prefix, module]

#define XcodeAppVersion [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]


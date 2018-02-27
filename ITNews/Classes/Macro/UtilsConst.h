//
//  UtilsConst.h
//  DiaoBao
//
//  Created by lisongtao on 2017/7/20.
//  Copyright © 2017年 lst. All rights reserved.
//

/** BundleID */
#define kAppBundleID [[[NSBundle mainBundle] infoDictionary] objectForKey:(__bridge NSString *)kCFBundleIdentifierKey]
// 主目录
#define kPathRoot           [NSString stringWithFormat:@"%@/Library/aimdev", NSHomeDirectory()]
// 文件缓存目录
#define kPathCache          [NSString stringWithFormat:@"%@/cache", kPathRoot]

#define theAppDelegate ((AppDelegate*)[[UIApplication sharedApplication] delegate])
#define CurrentNavigation   [theAppDelegate currentNavigation]

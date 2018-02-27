//
//  HomeVC.m
//  ITNews
//
//  Created by lisongtao on 2018/2/9.
//  Copyright © 2018年 lisongtao. All rights reserved.
//

#import "HomeVC.h"
#import "RecommendVC.h"
#include "INConfig.h"
@interface HomeVC ()

@end

@implementation HomeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [kNotificationCenter addObserver:self selector:@selector(configComplete) name:kOnlineConfigCompletionNotification object:nil];
    self.title = @"M123.me";
    
    /** loading */
    [MBProgressHUD showHUDAddedTo:self.navigationController.view animated:YES];
}

- (void)setup {
    // 添加所有子控制器
    [self setUpAllViewController];
    
    // 设置标题字体
    [self setUpTitleEffect:^(UIColor *__autoreleasing *titleScrollViewColor, UIColor *__autoreleasing *norColor, UIColor *__autoreleasing *selColor, UIFont *__autoreleasing *titleFont, CGFloat *titleHeight, CGFloat *titleWidth) {
        // 设置标题字体
        *titleFont = kFont32px;
        *norColor = kColor33;
        *selColor = kColor06a3F9;
        
        *titleHeight = 40.0;
    }];
    
    // 推荐方式（设置下标）
    [self setUpUnderLineEffect:^(BOOL *isUnderLineDelayScroll, CGFloat *underLineH, UIColor *__autoreleasing *underLineColor, BOOL *isUnderLineEqualTitleWidth) {
        *underLineColor = kColor06a3F9;
    }];
    
    // 设置内容frame
    [self setUpContentViewFrame:^(UIView *contentView) {
        contentView.frame = CGRectMake(0, kNavigationBarHeight, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - kNavigationBarHeight);
    }];
}

- (void)configComplete {
    [self setup];
    [self refreshDisplay];
}

- (void)setUpAllViewController {
    NSArray *cateArray = [INConfig manager].config.menu;
    for (NSInteger i = 0 ; i < cateArray.count; i++) {
        CateModel *model = cateArray[i];
        RecommendVC *vc = [[RecommendVC alloc] init];
        vc.title = model.cate_name;
        vc.cate_id = model.cate_id;
        [self addChildViewController:vc];
    }
}

- (void)dealloc {
    [kNotificationCenter removeObserver:self];
}

@end

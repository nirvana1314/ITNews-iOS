//
//  RecommendVC.m
//  ITNews
//
//  Created by lisongtao on 2018/2/9.
//  Copyright © 2018年 lisongtao. All rights reserved.
//

#import "RecommendVC.h"
#import "ListCell.h"
#import "ListModel.h"
#import "DetailVC.h"
@interface RecommendVC ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, weak) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataSource;
@property (nonatomic, copy) NSString *nextPage;
@end

@implementation RecommendVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setup];
}

- (void)setup {
    
    self.title = @"推荐";
    
    [self tableView];
    
    [self loadData];
}

- (void)loadData {
    [self loadNewDataWithPullDown];
}

#pragma mark - private
- (void)loadNewDataWithPullUp {
    NSLog(@"loadNewDataWithPullUp");
    kWeakSelf
    INNetworkMgr *mgr = [INNetworkMgr manager];
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:self.cate_id forKey:@"cate_id"];
    [params setValue:self.nextPage forKey:@"page"];
    [mgr requestWithUrl:MAKE_REQUEST_URL(@"contents/contentlist") httpMethod:(INHttpMethodGet) params:params success:^(NSURLSessionDataTask *task, NSData *originalData, NSDictionary *jsonDict, NSString *code) {
        if (code.integerValue > 0) {
            NSDictionary *data = [jsonDict objectForKey:@"data"];
            NSArray *arr = [ListModel mj_objectArrayWithKeyValuesArray:data[@"list"]];
            self.nextPage = data[@"nextPage"];
            if (arr.count) {
                [self.dataSource addObjectsFromArray:arr];
                [weakSelf.tableView.mj_footer endRefreshing];
            }else {
                [weakSelf.tableView.mj_footer endRefreshingWithNoMoreData];
            }
            
            [self.tableView reloadData];
        }
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"failure-%@", error);
        [weakSelf.tableView.mj_footer endRefreshing];
    }];
}

- (void)loadNewDataWithPullDown {
    MBProgressHUD *hud = [MBProgressHUD HUDForView:self.navigationController.view];
    kWeakSelf
    INNetworkMgr *mgr = [INNetworkMgr manager];
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:self.cate_id forKey:@"cate_id"];
    [mgr requestWithUrl:MAKE_REQUEST_URL(@"contents/contentlist") httpMethod:(INHttpMethodGet) params:params success:^(NSURLSessionDataTask *task, NSData *originalData, NSDictionary *jsonDict, NSString *code) {
        if (code.integerValue > 0) {
            NSDictionary *data = [jsonDict objectForKey:@"data"];
            self.nextPage = data[@"nextPage"];
            self.dataSource = [ListModel mj_objectArrayWithKeyValuesArray:data[@"list"]];
            [self.tableView reloadData];
        }
        [weakSelf.tableView.mj_header endRefreshing];
        [hud hideAnimated:YES];
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"failure-%@", error);
        [weakSelf.tableView.mj_header endRefreshing];
        [hud hideAnimated:YES];
    }];
}

#pragma mark - lazy
- (UITableView *)tableView {
    if (_tableView == nil) {
        UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:(UITableViewStylePlain)];
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.rowHeight = 93;
        tableView.contentInset = UIEdgeInsetsMake(0, 0, 64, 0);
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        MJRefreshAutoNormalFooter *footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadNewDataWithPullUp)];
        [footer setTitle:@"" forState:(MJRefreshStateIdle)];
        [footer setTitle:@"就这么多了" forState:(MJRefreshStateNoMoreData)];
        [footer setTitle:@"正在载入..." forState:(MJRefreshStateRefreshing)];
        tableView.mj_footer = footer;
        
        MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewDataWithPullDown)];
        [header setTitle:@"" forState:(MJRefreshStateIdle)];
        [header setTitle:@"就这么多了" forState:(MJRefreshStateNoMoreData)];
        [header setTitle:@"正在载入..." forState:(MJRefreshStateRefreshing)];
        tableView.mj_header = header;
        
        _tableView = tableView;
        [self.view addSubview:tableView];
    }
    return _tableView;
}

- (NSMutableArray *)dataSource {
    if (_dataSource == nil) {
        _dataSource = [NSMutableArray array];
    }
    return _dataSource;
}

#pragma mark - TableViewMethod
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID = @"listCell";
    ListCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[ListCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:ID];
    }
    cell.model = self.dataSource[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    DetailVC *vc = [DetailVC new];
    ListModel *model = self.dataSource[indexPath.row];
    vc.cid = model.cid;
    [self.navigationController pushViewController:vc animated:YES];
}
@end

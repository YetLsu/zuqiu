//
//  NFVideoViewController.m
//  footballnews
//
//  Created by jason.cao on 2018/5/25.
//  Copyright © 2018年 niefan. All rights reserved.
//

#import "NFVideoViewController.h"
#import "NFVideoViewCell.h"
#import "NFVideoModel.h"
#import "XLVideoPlayer.h"

@interface NFVideoViewController ()<UITableViewDelegate,UITableViewDataSource,NFVideoViewCellDelegate>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *datasource;
@property (nonatomic, strong) XLVideoPlayer *player;

@property (nonatomic, strong) NSIndexPath *currentIndexpath;
@end

static NSString *VideoViewCellId = @"VideoViewCellId";
@implementation NFVideoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self requestData];
    [self setupTableview];
}

- (NSMutableArray *)datasource{
    if (_datasource == nil) {
        _datasource = [NSMutableArray array];
    }
    return _datasource;
}

- (void)requestData{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"videolist" ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:path];
    NSDictionary *dataDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
    NSArray *videos = dataDict[@"video"];
    [self.tableView.mj_footer beginRefreshing];
    if (self.datasource.count > 0) {
        [self performSelector:@selector(setUI) withObject:nil afterDelay:0.5];
        return;
    }
    for (NSDictionary *dict in videos) {
        NFVideoModel *model = [NFVideoModel mj_objectWithKeyValues:dict];
        [self.datasource addObject:model];
    }
    
}
- (void)setUI{
    [self.tableView.mj_header endRefreshing];
    [self.tableView.mj_footer endRefreshingWithNoMoreData];
}

- (void)setupTableview{
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.rowHeight = 300.f;
    [_tableView registerNib:[UINib nibWithNibName:@"NFVideoViewCell" bundle:nil] forCellReuseIdentifier:VideoViewCellId];
    [self.view addSubview:_tableView];
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(requestData)];
    [self.tableView.mj_header beginRefreshing];
    self.tableView.mj_footer = [MJRefreshAutoFooter footerWithRefreshingTarget:self refreshingAction:@selector(requestData)];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _datasource.count;
}

- (void)tableView:(UITableView *)tableView didEndDisplayingCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    if (_currentIndexpath == indexPath) {
        [_player destroyPlayer];
        _player = nil;
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NFVideoViewCell *cell = [tableView dequeueReusableCellWithIdentifier:VideoViewCellId forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.model = self.datasource[indexPath.row];
    cell.delegate = self;
    return cell;
}

- (void)videoViewCell:(NFVideoViewCell *)videoViewCell playVideo:(NFVideoModel *)model{
    [_player destroyPlayer];
    _player = nil;
    NSUInteger index = [self.datasource indexOfObject:model];
    NSIndexPath *indexpath = [NSIndexPath indexPathForRow:index inSection:0];
    _currentIndexpath = indexpath;
    _player = [[XLVideoPlayer alloc] init];
    _player.videoUrl = model.mp4_url;
    [_player playerBindTableView:self.tableView currentIndexPath:indexpath];
    _player.frame = videoViewCell.postImageView.frame;
    [videoViewCell.contentView addSubview:_player];
    _player.completedPlayingBlock = ^(XLVideoPlayer *player) {
        [player destroyPlayer];
        _player = nil;
    };
}

- (void)viewWillDisappear:(BOOL)animated{
    [_player destroyPlayer];
    _player = nil;
}

- (void)dealloc{
    [_player destroyPlayer];
    _player = nil;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

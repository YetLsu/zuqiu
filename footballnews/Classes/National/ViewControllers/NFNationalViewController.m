//
//  NFNationalViewController.m
//  footballnews
//
//  Created by jason.cao on 2018/5/25.
//  Copyright © 2018年 niefan. All rights reserved.
//

#import "NFNationalViewController.h"
#import "NFBaseTableViewController.h"
#import "CenterViewController.h"

@interface NFNationalViewController ()<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (nonatomic, strong) UICollectionView *collectionView;
//@property (nonatomic, strong) NFPageIndecatorView *pageIndecator;
@property (nonatomic, strong) UIView *pageIndecator;

@property (nonatomic, strong) UIButton *lastBtn;

@end

static NSString *NationalCollectionCellId = @"NationalCollectionCellId";
@implementation NFNationalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)setTitles:(NSArray *)titles{
    if (_titles != titles) {
        _titles = titles;
        [self setupTop];
        [self setupContent];
        [self setupChildVc];
    }
}

- (void)setupChildVc{

    NSArray *mids = @[@"1029",@"1022",@"1024",@"1026",@"1023"];

    for (int i=0; i<_titles.count; i++) {
        NFBaseTableViewController *baseTable = [[NFBaseTableViewController alloc] init];
        baseTable.type = mids[i];
        [self addChildViewController:baseTable];
    }
}

- (void)setupTop{
    
    _pageIndecator = [[UIView alloc] initWithFrame:CGRectMake(0, kStatusBarHeight + kNavBarHeight, kScreenWidth, 50)];
    
    CGFloat btnW = kScreenWidth/_titles.count;
    CGFloat btnH = _pageIndecator.height - 10;
    for (int i=0; i<_titles.count; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setTitle:_titles[i] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor colorWithHexString:@"#9A9A9A"] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor colorWithHexString:@"#13227A"] forState:UIControlStateSelected];
        btn.frame = CGRectMake(i*btnW, 0, btnW, btnH);
        [btn addTarget:self action:@selector(itemChoose:) forControlEvents:UIControlEventTouchUpInside];
        btn.tag = i;
        if (i==0) {
            btn.selected = YES;
            _lastBtn = btn;
        }
        [_pageIndecator addSubview:btn];
        
    }
    
    UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, _pageIndecator.height - 10, _pageIndecator.width, 10)];
    line.backgroundColor = [UIColor colorWithHexString:@"#f5f5f5"];
    [_pageIndecator addSubview:line];
    
    [self.view addSubview:_pageIndecator];
}

- (void)itemChoose:(UIButton *)button{
    if (button.selected) {
        //刷新请求数据
        
        return;
    }
    _lastBtn.selected = NO;
    button.selected = YES;
    _lastBtn = button;
    [_collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:button.tag inSection:0] atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
    //刷新数据请求
    
}

- (void)setupContent{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.itemSize = CGSizeMake(kScreenWidth, kScreenHeight - kStatusBarHeight - kNavBarHeight - _pageIndecator.height - kTabBarHeight);
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    layout.minimumLineSpacing = 0;
    layout.minimumInteritemSpacing = 0;
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, _pageIndecator.bottom, kScreenWidth, kScreenHeight - kStatusBarHeight - kNavBarHeight - _pageIndecator.height - kTabBarHeight) collectionViewLayout:layout];
    _collectionView.backgroundColor = [UIColor clearColor];
    _collectionView.pagingEnabled = YES;
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
//    _collectionView.bounces = NO;
    [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:NationalCollectionCellId];
    [self.view addSubview:_collectionView];
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 5;
    
}
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NationalCollectionCellId forIndexPath:indexPath];
    UIView *subView = [self.childViewControllers[indexPath.row] view];
    subView.size = CGSizeMake(kScreenWidth, _collectionView.height);
    [cell.contentView addSubview: subView];
    return cell;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (scrollView.contentOffset.x < 0) {
        [self.mm_drawerController openDrawerSide:MMDrawerSideLeft animated:YES completion:nil];
        return;
    }
    NSInteger page = (NSInteger)scrollView.contentOffset.x/kScreenWidth;
    if (page != _lastBtn.tag) {
        UIButton *btn = _pageIndecator.subviews[page];
        _lastBtn.selected = NO;
        btn.selected = YES;
        _lastBtn = btn;
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

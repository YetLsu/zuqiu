//
//  NFCollectionController.m
//  footballnews
//
//  Created by jason.cao on 2018/5/29.
//  Copyright © 2018年 niefan. All rights reserved.
//

#import "NFCollectionController.h"
#import "NFCollectionCell.h"

@interface NFCollectionController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *datasource;
@end

static NSString *CollectionCellID = @"CollectionCellID";
@implementation NFCollectionController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupTableView];
}

- (NSMutableArray *)datasource{
    if (_datasource == nil) {
        _datasource = [NSMutableArray arrayWithObjects:@"",@"",@"", nil];
    }
    return _datasource;
}

- (void)setupTableView{
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.rowHeight = 100.f;
    [_tableView registerNib:[UINib nibWithNibName:@"NFCollectionCell" bundle:nil] forCellReuseIdentifier:CollectionCellID];
    
    [self.view addSubview:_tableView];
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.datasource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NFCollectionCell *cell = [tableView dequeueReusableCellWithIdentifier:CollectionCellID forIndexPath:indexPath];
    return cell;
}

-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{

    return UITableViewCellEditingStyleDelete;
}
/*改变删除按钮的title*/
-(NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath{
    return @"删除";
}
/*删除用到的函数*/
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.datasource removeObjectAtIndex:indexPath.row];
        [tableView reloadData];
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

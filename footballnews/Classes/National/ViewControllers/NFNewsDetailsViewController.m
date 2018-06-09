//
//  NFNewsDetailsViewController.m
//  footballnews
//
//  Created by jason.cao on 2018/5/28.
//  Copyright © 2018年 niefan. All rights reserved.
//

#import "NFNewsDetailsViewController.h"
#import "NFDetailViewHeader.h"
#import "NFDetailLikeView.h"
#import "NFDetailCommentCell.h"
#import "NFCommentModel.h"

@interface NFNewsDetailsViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic, strong) UITableView *tableView;
@property(nonatomic, strong) NSMutableArray *datasource;
@property(nonatomic, strong) NFDetailLikeView *likeView;
@property(nonatomic, strong) UIView *textFiledView;
@property(nonatomic, strong) UIButton *commentBtn;
@property(nonatomic, strong) UITextField *commentTF;
@end

static NSString *NFDetailCommentCellId = @"NFDetailCommentCellId";
@implementation NFNewsDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self requestData];
    [self setupTableView];
    [self setupCommentTextFiled];
    [self setupKeyBoardEvent];
}

- (NSMutableArray *)datasource{
    if (_datasource == nil) {
        _datasource = [NSMutableArray array];
    }
    return _datasource;
}

- (void)requestData{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"detail" ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:path];
    NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
    NSArray *dataArray = dictionary[@"datasource"];
    for (NSDictionary *dict in dataArray) {
        NFCommentModel *model = [NFCommentModel mj_objectWithKeyValues:dict];
        [self.datasource addObject:model];
    }
    [_tableView reloadData];
}
- (void)setupKeyBoardEvent{
    // 键盘弹出的通知
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWasShown:) name:UIKeyboardDidShowNotification object:nil];
    // 键盘消失的通知
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillBeHiden:) name:UIKeyboardWillHideNotification object:nil];
}
- (void)keyboardWasShown:(NSNotification *)notification{
    // 获取键盘的高度
//    _isBoardShow = YES;
    CGRect frame = [[[notification userInfo] objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
    CGFloat height = frame.size.height;
//    _boardHeight = height;
    
    _textFiledView.y = _textFiledView.y - height;
}
- (void)keyboardWillBeHiden:(NSNotification *)notification{
//    _isBoardShow = NO;
    CGRect frame = [[[notification userInfo] objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
    CGFloat height = frame.size.height;
//    _boardHeight = height;
    _textFiledView.y = _textFiledView.y + height;
}

- (void)setupTableView{
    self.view.backgroundColor = [UIColor whiteColor];
    NFDetailViewHeader *header = [[[NSBundle mainBundle] loadNibNamed:@"NFDetailViewHeader" owner:nil options:nil] firstObject];
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight - kTabBarHeight) style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.tableHeaderView = header;
    _tableView.rowHeight = 60;
    [_tableView registerClass:[NFDetailCommentCell class] forCellReuseIdentifier:NFDetailCommentCellId];
    [self.view addSubview:_tableView];
}


- (void)setupCommentTextFiled{
    _textFiledView = [[UIView alloc] initWithFrame:CGRectMake(0, self.view.height - kTabBarHeight, kScreenWidth, 50)];
    _textFiledView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_textFiledView];
    
    _commentBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _commentBtn.frame = CGRectMake(kScreenWidth - 60 - 10, 5, 60, 40);
    [_textFiledView addSubview:_commentBtn];
    [_commentBtn setTitle:@"发表" forState:UIControlStateNormal];
    [_commentBtn setTitleColor:[UIColor colorWithHexString:@"#EBA30B"] forState:UIControlStateNormal];
    [_commentBtn addTarget:self action:@selector(commentClick:) forControlEvents:UIControlEventTouchUpInside];
    _commentBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    
    _commentTF = [[UITextField alloc] initWithFrame:CGRectMake(20, 7, kScreenWidth - 20 - _commentBtn.width - 10, 35)];
    [_textFiledView addSubview:_commentTF];
    
    _commentTF.borderStyle = UITextBorderStyleNone;
    _commentTF.leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 35)];
    _commentTF.leftViewMode = UITextFieldViewModeAlways;
    _commentTF.backgroundColor = [UIColor colorWithHexString:@"#E5E5E5"];
    _commentTF.textColor = [UIColor colorWithHexString:@""];
    _commentTF.placeholder = @"说说你的感想...";
    _commentTF.layer.cornerRadius = 15.;
    _commentTF.layer.masksToBounds = YES;
    _commentTF.font = [UIFont systemFontOfSize:15];
}

- (void)commentClick:(UIButton *)button{
    _commentTF.text = @"";
    [self.view endEditing:YES];
    [self.tableView reloadData];
}


- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *header = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 40)];
    header.backgroundColor = [UIColor whiteColor];
    
    UIView *grayLine = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 10)];
    grayLine.backgroundColor = [UIColor colorWithHexString:@"#f5f5f5"];
    [header addSubview:grayLine];
    
    UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, kScreenWidth - 20, 30)];
    title.font = [UIFont systemFontOfSize:17];
    title.textColor = [UIColor colorWithHexString:@"#333333"];
    if (section == 0) {
        title.text = @"赞";
    }else if(section == 1){
        title.text = @"评论";
    }
    [header addSubview:title];
    return header;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 40;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if (section == 0) {
        return 0.0001;
    }else{
        return 44;
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    if(section == 0){
        return nil;
    }else{
        UIView *footer = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 44)];
        footer.backgroundColor = [UIColor whiteColor];
        UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 44)];
        title.font = [UIFont systemFontOfSize:17];
        title.textAlignment = NSTextAlignmentCenter;
        title.text = @"暂无更多评论";
        title.textColor = [UIColor colorWithHexString:@"#333333"];
        [footer addSubview:title];
        
        return footer;
    }
    
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if(section==0){
        return 1;
    }
    return _datasource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.section == 0){
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"id"];
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"id"];
            _likeView = [[NFDetailLikeView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 60)];
            [cell.contentView addSubview:_likeView];
            _likeView.datasource =  @[@"person1",@"person2",@"person3",@"person4",@"person5",@"person6",@"person7",@"person8",@"person9",@"person10"];
            
        }
        
        return cell;
    }else{
        NFDetailCommentCell *cell = [tableView dequeueReusableCellWithIdentifier:NFDetailCommentCellId forIndexPath:indexPath];
        cell.model = _datasource[indexPath.row];
        return cell;
    }
   
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return 60;
    }else{
        NFCommentModel *model = _datasource[indexPath.row];
        return 10 + 40 + 10 + model.contentHeight;
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

//
//  NFUserInfoViewController.m
//  footballnews
//
//  Created by jason.cao on 2018/5/31.
//  Copyright © 2018年 niefan. All rights reserved.
//

#import "NFUserInfoViewController.h"
#import "NFProfileViewController.h"

@interface NFUserInfoViewController ()<UITableViewDelegate,UITableViewDataSource,UIImagePickerControllerDelegate,UINavigationControllerDelegate>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *titles;
@property (nonatomic, strong) UIImagePickerController *imagePicker;
@property (nonatomic, strong) UIImage *image;
@property (nonatomic, copy) NSString *userName;
@property (nonatomic, strong) MBProgressHUD *hud;
@end
static NSString *userInfoIdentifierId = @"userInfoIdentifierId";
@implementation NFUserInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupTableView];
    [self setupNavi];
}
- (void)setupNavi{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 0, 50, 40);
    [btn setTitle:@"更新" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:15];
    [btn addTarget:self action:@selector(updateInfo) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
    self.navigationItem.rightBarButtonItem = rightItem;
}

- (void)updateInfo{
    [_hud showAnimated:YES];
    [_hud hideAnimated:YES afterDelay:2];
    [[NSUserDefaults standardUserDefaults] setObject:_userName forKey:@"username"];
    
//    NSData *data = UIImagePNGRepresentation(_image);
    
    NSData *data = UIImageJPEGRepresentation(_image, 0.1);
    [[NSUserDefaults standardUserDefaults] setObject:data forKey:@"userimage"];
    NFProfileViewController *pro = (NFProfileViewController *)self.mm_drawerController.leftDrawerViewController;
    [pro refresh];
    [self.navigationController performSelector:@selector(popViewControllerAnimated:) withObject:@"YES" afterDelay:2];
}






- (void)setupTableView{
    _imagePicker = [[UIImagePickerController alloc] init];
    _imagePicker.allowsEditing = YES;
    _imagePicker.delegate = self;
    NSData *data = [[NSUserDefaults standardUserDefaults] dataForKey:@"userimage"];
    _image = [UIImage imageWithData:data];
    _userName = [[NSUserDefaults standardUserDefaults] stringForKey:@"username"];;
    _titles = @[@"头像",@"昵称"];
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.rowHeight = 60.f;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_tableView];
    
    _hud = [[MBProgressHUD alloc] initWithView:self.view];
    [self.view addSubview:_hud];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _titles.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:userInfoIdentifierId];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:userInfoIdentifierId];
        UIView *line = [[UIView alloc] initWithFrame:CGRectMake(10, 59, kScreenWidth-20, 1)];
        line.backgroundColor = [UIColor colorWithHexString:@"#efefef"];
        [cell.contentView addSubview:line];
    }
    if (indexPath.row == 0) {
        cell.imageView.image = _image;
        cell.detailTextLabel.text = @"头像";
    }else if (indexPath.row == 1) {
        cell.textLabel.text = _userName;
        cell.detailTextLabel.text = @"昵称";
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.row == 0) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"选择上传头像方式"
                                                                       message:nil preferredStyle: UIAlertControllerStyleActionSheet];
        UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"拍照" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            _imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
            [self presentViewController:_imagePicker animated:YES completion:nil];
        }];
        UIAlertAction *action2 = [UIAlertAction actionWithTitle:@"本地图片上传"
                                                          style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                                                              
            _imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
            [self presentViewController:_imagePicker animated:YES completion:nil];
                                                              
        }];
        UIAlertAction *action3 = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            
        }];
        [alert addAction:action1];
        [alert addAction:action2];
        [alert addAction:action3];
        [self presentViewController:alert animated:YES completion:nil];
    }else{
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"修改昵称"
                                                                       message:nil preferredStyle: UIAlertControllerStyleAlert];
        [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
            
        }];
        
        UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            UITextField *textField = alert.textFields.firstObject;
            if (![textField.text isEqualToString:@""]) {
                _userName = textField.text;
                [_tableView reloadData];
            }
            
        }];
        UIAlertAction *action2 = [UIAlertAction actionWithTitle:@"取消"
                                                          style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                                                              
                                                          }];
        [alert addAction:action1];
        [alert addAction:action2];
        [self presentViewController:alert animated:YES completion:nil];
    }
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    [_imagePicker dismissViewControllerAnimated:YES completion:nil];
    UIImage *image = info[UIImagePickerControllerOriginalImage];
    UIImage *newImage = [UIImage resizeImage:image size:CGSizeMake(40, 40)];
    _image = newImage;
    [_tableView reloadData];
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

//
//  GpsController.m
//  ZhuHaiJx
//
//  Created by 冯学仕 on 16/11/8.
//  Copyright © 2016年 rooten. All rights reserved.
//

#import "GpsController.h"
#import "Masonry.h"
#import "SearchUrl.h"
#import "SecVC.h"
#import "AppDelegate.h"
@interface GpsController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic, strong)UITableView *tableView;

@property(nonatomic, retain) UIView *headView;

@property(nonatomic, retain) UIImageView *userImg;

@property(nonatomic,retain) UILabel *nameLabel;

@property (nonatomic, retain) UILabel *jgLabel;

@end



@implementation GpsController

- (void)viewDidLoad {
    [super viewDidLoad];
      // [self setupConstaints];
   
    self.headView = [[UIView alloc] initWithFrame:CGRectMake(20, 105, self.view.frame.size.width, 60)];
    
    
    [self.view addSubview:self.headView];
    [self userImg];
    [self nameLabel];
    [self jgLabel];
    NSUserDefaults *userdefault = [NSUserDefaults standardUserDefaults];
    NSString *userName = [userdefault valueForKey:@"username"];
    NSString *jgmc     = [userdefault valueForKey:@"jgmc"];
    NSLog(@"------jgmc%@",jgmc);
    _nameLabel.text = userName;
    _jgLabel.text   = jgmc;
    [self setup];
    self.tableView = ({
        UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(20, (self.view.frame.size.height - 84 * 3) / 2.0f, self.view.frame.size.width, 54 * 3) style:UITableViewStylePlain];
        tableView.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleWidth;
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.opaque = NO;
        tableView.backgroundColor = [UIColor clearColor];
        tableView.backgroundView = nil;
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        tableView.bounces = NO;
        tableView;
    });
    
    [self.view addSubview:self.tableView];

   
}

- (UIImageView *)userImg
{
    if (_userImg == nil) {
        _userImg = [[UIImageView alloc ] initWithImage:[UIImage imageNamed:@"头像.png"]];
        
        [self.headView addSubview:_userImg];
    }
    return _userImg;
    
}

- (UILabel *)nameLabel
{
    if (_nameLabel == nil) {
        _nameLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _nameLabel.font = [UIFont fontWithName:@"HoeflerText-BlackItalic" size:24];
        _nameLabel.textColor = [UIColor lightTextColor];
        [self.headView addSubview:_nameLabel];
    }
    return _nameLabel;
}

-(UILabel *)jgLabel
{
    if (_jgLabel == nil) {
        _jgLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _jgLabel.font = [UIFont systemFontOfSize:22];
        _jgLabel.textColor = [UIColor lightTextColor];
        [self.headView addSubview:_jgLabel];
    }
    return _jgLabel;
}



- (void)setup
{
    [_userImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.headView).offset(20);
        make.top.equalTo(self.headView.mas_top).offset(4);
        make.bottom.equalTo(self.headView.mas_bottom);
        make.width.mas_equalTo(_userImg.mas_height);
    }];
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.userImg.mas_right).offset(20);
        make.centerY.mas_equalTo(self.userImg.mas_centerY);
        make.width.mas_equalTo(200);
        make.height.mas_equalTo(30);
    }];
    [self.jgLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.userImg.mas_right).offset(20);
        make.top.equalTo(self.nameLabel.mas_bottom).offset(10);
        make.width.mas_equalTo(200);
        make.height.mas_equalTo(30);
    }];
}




- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 54;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)sectionIndex
{
    return 2;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        cell.backgroundColor = [UIColor clearColor];
        cell.textLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:21];
        cell.textLabel.textColor = [UIColor whiteColor];
        cell.textLabel.highlightedTextColor = [UIColor lightGrayColor];
        cell.selectedBackgroundView = [[UIView alloc] init];
    }
    
    UIView *gapView = [[UIView alloc] init];
    gapView.frame = CGRectMake(0, 30, self.view.frame.size.width, 20);
    [cell.contentView addSubview:gapView];
    NSArray *titles = @[@"关于", @"退出登录"];
    NSArray *images = @[@"设置.png", @"登录退出.png"];
    [cell setLayoutMargins:UIEdgeInsetsMake(30,0,0,0)];
    [cell.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(cell.contentView).offset(20);
        make.width.mas_equalTo(30);
        make.height.mas_equalTo(30);
        make.top.equalTo(cell.contentView).offset(4);
    }];
    [cell.textLabel mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(cell.imageView.mas_right).offset(20);
        
        make.centerY.equalTo(cell.imageView.mas_centerY);
    }];
    cell.textLabel.font = [UIFont systemFontOfSize:14];
    cell.textLabel.text = titles[indexPath.row];
    cell.imageView.image = [UIImage imageNamed:images[indexPath.row]];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView reloadData];

    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    switch (indexPath.row) {
        case 0:
            [self  settingInfo:tableView];
            
        case 1:
            [self logout:tableView];
        default:
            break;
    }
    
}

- (void)settingInfo:(UITableView *)tableview
{
    SecVC *sec = [[SecVC alloc] init];
    sec.view.backgroundColor = [UIColor whiteColor];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:sec];
    
    [self presentViewController:nav animated:YES completion:^{
        [tableview reloadData];
    }];
}

- (void)logout:(UITableView *)tableView
{
    UIAlertController *alertController=[UIAlertController alertControllerWithTitle:@"珠海警讯" message:@"确定退出？" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancelAction =[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [tableView reloadData];
    }];
    NSUserDefaults *userdefault = [NSUserDefaults standardUserDefaults];
    NSString *acToken  = [userdefault valueForKey:@"apnsToken"];
    NSString *user = _nameLabel.text;
    
    UIAlertAction *sureAction=[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [tableView reloadData];
        [SearchUrl logOutZhuhaiJxWithUsername:user token:acToken device:@"ios" completion:^(NSString *jsonResult, BOOL finished) {
            if (finished) {
                NSLog(@"------logOutZhuhaiJxWithUsername%@------",jsonResult);
            }
        }];
        exit(0);
        
    }];
    [alertController addAction:cancelAction];
    [alertController addAction:sureAction];
    [self presentViewController:alertController animated:YES completion:nil];
    
}
- (void)introduceViewShow:(UITableView *)tableView
{
    [tableView reloadData];
}

-(void)exitCurrentViewController
{
   // [self dismissViewControllerAnimated:YES completion:nil];
    
    [UIView animateWithDuration:1 animations:^{
        self.view.frame = CGRectMake(-200, 50, 200, self.view.superview.frame.size.height-50);
    }];
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end

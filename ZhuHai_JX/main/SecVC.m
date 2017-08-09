//
//  SecVC.m
//  ZhuHaiJx
//
//  Created by 冯学仕 on 16/12/7.
//  Copyright © 2016年 rooten. All rights reserved.
//

#import "SecVC.h"
#import "Utilities.h"
#import "Masonry.h"

@interface SecVC ()

@property (nonatomic, strong) UINavigationController *navc;

@end

@implementation SecVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setTitle:@"帮助"];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(pop)];
    [self addView];
    
}

- (void)addView
{
    [self headView];
    [self infoLabel];
    [self iconImage];
    [self banbenLabel];
    [self helpInfo];
    [self descLabel];
    [self footLabel];
    [self setup];
}

- (void)pop
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (UIView *)headView
{
    if (_headView == nil) {
        _headView = [[UIView alloc] initWithFrame:CGRectMake(0, 60,self.view.frame.size.width ,80)];
        _headView.layer.borderWidth = 1.0;
        [self.view addSubview: _headView];
    }
    return _headView;
}

- (UIImageView *) iconImage
{
    if (_iconImage == nil) {
        _iconImage = [[UIImageView alloc] initWithFrame:CGRectMake(5, 5, 70, 70)];
        _iconImage.image = [UIImage imageNamed:@"ic_launcher.png"];
        [self.headView addSubview:_iconImage];
    }
    return _iconImage;
}

- (UILabel *) infoLabel
{
    if (_infoLabel == nil) {
        _infoLabel = [[UILabel alloc] initWithFrame:CGRectMake(80, 10, 80, 35)];
        _infoLabel.text = @"珠海警讯";
        _infoLabel.textAlignment = NSTextAlignmentLeft;
        _infoLabel.font = [UIFont fontWithName:@"" size:20];
        [self.headView addSubview:_infoLabel];
    }
    return _infoLabel;
}

- (UILabel *) banbenLabel
{
    if (_banbenLabel == nil) {
        _banbenLabel = [[UILabel alloc] initWithFrame:CGRectMake(80, 48, 120, 30)];
        _banbenLabel.text = @"版本号：2.0.1";
        _banbenLabel.textAlignment = NSTextAlignmentLeft;
        _banbenLabel.font = [UIFont systemFontOfSize:17];
        _banbenLabel.textColor = [UIColor lightGrayColor];
        [self.headView addSubview:_banbenLabel];
    }
    return _banbenLabel;
}

- (UILabel *)helpInfo
{
    if (_helpInfo == nil) {
        _helpInfo = [[UILabel alloc] initWithFrame:CGRectMake(0, 140, self.view.frame.size.width, 35)];
        _helpInfo.text = @"  使用帮助:";
        _helpInfo.layer.borderWidth = 1.0;
        _helpInfo.textAlignment = NSTextAlignmentLeft;
        _helpInfo.font = [UIFont fontWithName:@"" size:18];
        _helpInfo.textColor = [UIColor lightGrayColor];
        [self.view addSubview:_helpInfo];
    }
    return _helpInfo;
}

- (UILabel *) descLabel
{
    if (_descLabel == nil) {
        _descLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _descLabel.numberOfLines = 0;
        _descLabel.adjustsFontSizeToFitWidth = YES;
        _descLabel.layer.borderWidth = 1.0;
        _descLabel.text = @" “110警讯“ 将110指挥中心短信直接推送警务通，完全由警务通110警讯模块来替代领导接收、读取、回复、删除";
        _descLabel.font = [UIFont fontWithName:@"" size:18];
        [self.view addSubview:_descLabel];
    }
    return _descLabel;
}

- (UILabel *)footLabel
{
    if (_footLabel == nil) {
        _footLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _footLabel.layer.borderWidth = 1.0;
        _footLabel.text = @" 苏州路腾软件有限公司";
        _footLabel.font = [UIFont fontWithName:@"" size:18];
        [self.view addSubview:_footLabel];
    }
    return _footLabel;
}




- (void) setup
{
    CGSize  size = CGSizeMake(self.view.frame.size.width, CGFLOAT_MAX);
    CGSize desSize = [Utilities measureText:_descLabel.text withFont:[UIFont systemFontOfSize:18] andMaxSize:size];
    [self.descLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view);
        make.width.mas_equalTo(self.view.frame.size.width);
        make.top.equalTo(self.helpInfo.mas_bottom);
        make.height.mas_equalTo(desSize.height);
    }];
    
    [self.footLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.view);
        make.width.mas_equalTo (self.view.frame.size.width);
        make.height.mas_equalTo(50);
    }];
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

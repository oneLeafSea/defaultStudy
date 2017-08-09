//
//  DetailVC.m
//  ZhuHaiJx
//
//  Created by 冯学仕 on 17/7/31.
//  Copyright © 2017年 rooten. All rights reserved.
//

#import "DetailVC.h"
#import "CommentData.h"
#import "ComentDetailCell.h"
#import "Masonry.h"
#import "Utilities.h"
#import "ReplyInputView.h"
#import "SearchUrl.h"
#import "AppDelegate.h"
#import "FontAwesomeKit.h"
#import "CommentCenter.h"
#import "ContextViewController.h"

@interface DetailVC ()
@property (weak, nonatomic) IBOutlet UILabel *l_time;
@property (weak, nonatomic) IBOutlet UILabel *l_target;
@property (weak, nonatomic) IBOutlet UILabel *l_content;
@property (weak, nonatomic) IBOutlet UILabel *l_num;
@property (weak, nonatomic) IBOutlet UIButton *b_comment;
@property (weak, nonatomic) IBOutlet UIImageView *img_comment;
@property (weak, nonatomic) IBOutlet UIButton *b_delBtn;


@property (weak, nonatomic) ReplyInputView *detail_inputView;
@property (retain, nonatomic) NSMutableDictionary *frameDic;

//数据源
@property (nonatomic, retain) NSMutableArray <CommentData *>* detailDatas;

@end

@implementation DetailVC

- (NSMutableArray<CommentData *> *)detailDatas {
    if (_detailDatas == nil) {
        _detailDatas = [[NSMutableArray alloc] init];
    }
    return _detailDatas;
}

- (NSMutableDictionary *)frameDic {
    if (_frameDic == nil) {
        _frameDic = [[NSMutableDictionary alloc] init];
    }
    return  _frameDic;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = _detai_ZhInfo.mTypeName;
    [self initChild];
    [self setData];
    [self keyboardListen];
    [self setLeftBackView];
    [self addGesture];
}

///set btn bg ,and set comment icon
- (void) initChild {
    
    FAKIonIcons *comment_Icon = [FAKIonIcons documentIconWithSize:35];
    [comment_Icon addAttribute:NSForegroundColorAttributeName value:[Utilities parseFromStr:@"#87CEEB"]];
    UIImage *coment_img = [comment_Icon imageWithSize:CGSizeMake(35, 35)];
    [_img_comment setImage:coment_img];
    
    FAKIonIcons *del_Icon = [FAKIonIcons androidDeleteIconWithSize:35];
    [del_Icon addAttribute:NSForegroundColorAttributeName value:[Utilities parseFromStr:@"#87CEEB"]];
    UIImage *del_img = [del_Icon imageWithSize:CGSizeMake(35, 35)];
    [_b_delBtn setImage:del_img forState:UIControlStateNormal];
    
    
}

///override window did touched
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.detail_inputView.sendTextView resignFirstResponder];
}

- (void) keyboardListen {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardShowed:) name:UIKeyboardDidShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardHidden) name:UIKeyboardWillHideNotification object:nil];
}

- (void) keyboardShowed:(NSNotification *)noti {
    CGRect keyboardF = [[noti.userInfo objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
    CGFloat screenHeight = [UIScreen mainScreen].bounds.size.height;
    [UIView animateWithDuration:0 animations:^{
        CGRect frame = self.detail_inputView.frame;
        CGFloat y = screenHeight - 54-keyboardF.size.height;
        frame.origin.y = y;
        self.detail_inputView.frame = frame;
    }];
}

- (void) keyboardHidden {
    CGFloat width = self.view.frame.size.width;
    CGFloat org_y = self.view.frame.size.height;
    CGRect frame = self.detail_inputView.frame;
    frame.origin.y =org_y;
    frame.size.width =width;
    self.detail_inputView.frame = frame;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void) setData {
    _detailDatas   = _detai_ZhInfo.commentArr;
    _l_time.text   = _detai_ZhInfo.mSendTime;
    _l_target.text = _detai_ZhInfo.mTargetName;
    _l_content.text= _detai_ZhInfo.mDetail;
    _l_num.text    = [NSString stringWithFormat:@"%lu",(unsigned long)_detailDatas.count];
    
    [_b_comment addTarget:self action:@selector(b_commentTapped) forControlEvents:UIControlEventTouchUpInside];
    [_b_delBtn addTarget:self action:@selector(b_deleteBtnTapped) forControlEvents:UIControlEventTouchUpInside];
    [self setHeadView];
}

- (void) setHeadView {
    UIView *h_v = self.tableView.tableHeaderView;
    CGFloat height = 151 + [self measureHeight];
    h_v.frame = CGRectMake(0, 0, self.view.frame.size.width,height);
    self.tableView.tableHeaderView = h_v;
}

- (CGFloat) measureHeight {
    CGFloat l_contentHeight = [Utilities measureText:_detai_ZhInfo.mDetail withFont:[UIFont systemFontOfSize:14] andMaxSize:CGSizeMake([UIScreen mainScreen].bounds.size.width-40, 1000)].height;
    return  l_contentHeight;
}

- (void) setLeftBackView {
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(back_)];
}


- (void) b_commentTapped {

    CGFloat org_y = self.view.frame.size.height;
    CGFloat width = self.view.frame.size.width;
    ReplyInputView *reinputView = [[ReplyInputView alloc]initWithFrame:CGRectMake(0, org_y, width, 54) andAboveView:APP_DELEGATE.window];
    [APP_DELEGATE.window addSubview:reinputView];
    self.detail_inputView = reinputView;
    CGRect detail_inputView_rect = reinputView.frame;
    NSValue *var_frame = [NSValue valueWithCGRect:detail_inputView_rect];
    [self.frameDic setValue:var_frame forKey:@"var_frame"];
    [reinputView setContentSizeBlock:^(CGSize contentSize) {
        [self varFrameDidChanged:contentSize];
    }];
    
    [reinputView setReplyAddBlock:^(NSString *replyText, NSInteger replyTag) {
        CommentData *data = [self setSubmitDataWithText:replyText];
        [SearchUrl AddReviewWithInfoType:data.mTypeID infoId:data.mMsgID userReview:data.mPoliceID jgbm:data.mTargetPart infoDetail:data.mReply replyName:data.mReplyName completion:^(NSString *jsonResult, BOOL finished) {
            if (finished) {
                NSString *str = [jsonResult stringByTrimmingCharactersInSet:[NSCharacterSet controlCharacterSet]];
                if ([str  isEqualToString:@"Success"]) {
                    [_detai_ZhInfo.commentArr addObject:data];
                    _detai_ZhInfo.shouldUpdateCache =YES;
                    
                    dispatch_async(dispatch_get_main_queue(), ^{
                        _l_num.text = [NSString stringWithFormat:@"%lu",(unsigned long)_detailDatas.count];
                        [self.tableView reloadData];
                    });
                }
                
            }
        }];
    }];
    
}

- (void) b_deleteBtnTapped {
    CommentCenter *commentCenter = [[CommentCenter alloc] init];
    UIAlertAction *sureAction=[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSMutableArray *muArr = [[NSMutableArray alloc] init];
        [muArr addObject:_detai_ZhInfo];
        NSString *deleStr = [commentCenter postStringAndArrayWithArr:muArr];
        [SearchUrl deleteInfoWithArr:deleStr completion:^(NSString *jsonResult, BOOL finished) {
            if (finished) {
                if ([self.detailVC_delegate respondsToSelector:@selector(deleteBtntappedWithZhdataInfo:)]) {
                    [self.detailVC_delegate deleteBtntappedWithZhdataInfo:_detai_ZhInfo];
                }
                [self dismissViewControllerAnimated:YES completion:nil];
            }
        }];
        
    }];
    [self alertActionSet:sureAction];
  
}

- (void) alertActionSet:(UIAlertAction *) action {
    UIAlertController *alertController=[UIAlertController alertControllerWithTitle:@"" message:@"是否删除？" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [alertController removeFromParentViewController];
        
    }];
    [alertController addAction:action];
    [alertController addAction:cancelAction];
    [self presentViewController:alertController animated:YES completion:nil];
}



- (void) varFrameDidChanged:(CGSize)contentSize {
    CGFloat height = contentSize.height+20;
    CGRect frame = self.detail_inputView.frame;
    frame.origin.y -= height - frame.size.height;  //高度往上拉伸
    frame.size.height = height;
    self.detail_inputView.frame = frame;
}

- (CommentData *) setSubmitDataWithText:(NSString *)text {
    CommentData *data = [[CommentData alloc] init];
    data.mTypeID = _detai_ZhInfo.mTypeID;
    data.mPoliceID = _detai_ZhInfo.mPoliceID;
    data.mMsgID  = _detai_ZhInfo.mMsgID;
    data.mReply  = text;
    data.mReplyTime = [self reviewTime];
    data.mTargetPart = _detai_ZhInfo.mTargetPart;
    data.mUser = _detai_ZhInfo.mUser;
    data.mReviewId = @"01234";
    data.mReplyName = [self user];
    return data;
}

- (NSString *) user {
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    return [user valueForKey:@"username"];
}

- (NSString *) reviewTime {
    NSDate *date = [NSDate date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"YYYY/MM/dd hh:mm:ss"];
    NSString *dateTime = [formatter stringFromDate:date];
    return dateTime;
}

- (void)back_{
    [self dismissViewControllerAnimated:YES completion:^{
        if ([self.detailVC_delegate respondsToSelector:@selector(detailVCHasUpdataDataAndNotificateMainVCToAlsoUpdataData)]) {
            [self.detailVC_delegate detailVCHasUpdataDataAndNotificateMainVCToAlsoUpdataData];
        }
    }];
}




- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _detailDatas.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *identifier = @"CommentDetailCell";
    ComentDetailCell*cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[ComentDetailCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    CommentData *data = [_detailDatas objectAtIndex:indexPath.row];
    [cell configCellWithMode:data];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44;
}

///点击文字放大缩小页面
- (void)addGesture
{
    UITapGestureRecognizer *tapGes = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(prepareForSegueWithtapGesture)];
    [self.tableView.tableHeaderView addGestureRecognizer:tapGes];
}

- (void)prepareForSegueWithtapGesture
{
    ContextViewController *ctv = [[ContextViewController alloc] init];
    ctv.context = _detai_ZhInfo.mDetail;
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:ctv];
    [self.navigationController presentViewController:nav animated:YES completion:nil];
    
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end

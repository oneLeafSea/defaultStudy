//
//  ContextViewController.m
//  ZhuHaiJx
//
//  Created by 冯学仕 on 17/2/27.
//  Copyright © 2017年 rooten. All rights reserved.
//

#import "ContextViewController.h"
#import "ZhJxCommonUse.h"
#import "Utilities.h"

@interface ContextViewController ()

@property (nonatomic, retain) UILabel *contextlabel;



@end



@implementation ContextViewController
{
    float old_width;
    CGFloat fontSize;
    CGFloat sizeRemember;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self setTitle:@"文本"];
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:self.view.frame];
    scrollView.contentSize = CGSizeMake(self.view.frame.size.width, 3.5*self.view.frame.size.height);
    
    [self.view addSubview:scrollView];
    [self setpopLeftItem];
    fontSize = 20;
    sizeRemember = fontSize;
    CGFloat f = [self getNaviControllerHeight];
    CGFloat g = self.view.frame.size.width;
    _contextlabel = [[UILabel alloc] initWithFrame:CGRectMake(15,0,g-30,[ZhJxCommonUse measureText:self.context withFont:[UIFont systemFontOfSize:20] andMaxSize:CGSizeMake(g-30, CGFLOAT_MAX)].height )];
    _contextlabel.text = self.context;
    _contextlabel.font = [UIFont systemFontOfSize:20];
    _contextlabel.numberOfLines = 0;
    _contextlabel.lineBreakMode = NSLineBreakByWordWrapping;
    [scrollView addSubview:_contextlabel];
    UIPinchGestureRecognizer *gesture = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinchScaled:)];
       scrollView.userInteractionEnabled = YES;
    [scrollView addGestureRecognizer:gesture];


   
}

- (CGFloat)getMaxHeightwithFont:(float)fontsize
{
     CGFloat g = self.view.frame.size.width;
    CGFloat f = [ZhJxCommonUse measureText:self.context withFont:[UIFont systemFontOfSize:fontSize] andMaxSize:CGSizeMake(g-30, CGFLOAT_MAX)].height;
    return f;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(CGFloat)getNaviControllerHeight
{
    return self.navigationController.navigationBar.frame.size.height;
}





- (void)pinchScaled:(UIPinchGestureRecognizer *)gesture  {
    
    CGFloat g = self.view.frame.size.width;
     CGFloat f = [self getNaviControllerHeight];
    fontSize = gesture.scale * sizeRemember;
    NSLog(@"%f",gesture.scale);
    if (fontSize > 70) {
        fontSize = 70;
    }
    if (fontSize < 10) {
        fontSize = 10;
    }
    if(gesture.state == UIGestureRecognizerStateEnded)
    {
        sizeRemember = fontSize;
    }
    _contextlabel.font = [UIFont systemFontOfSize:fontSize];
    _contextlabel.frame = CGRectMake(15, 0, [UIScreen mainScreen].bounds.size.width, [self getLabHeight:self.context FontSize:fontSize Width:g-20]);
}

- (CGFloat)getLabHeight:(NSString *)text FontSize:(CGFloat)size Width:(CGFloat)width {
    CGSize titleSize = [text boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:size]} context:nil].size;
    return titleSize.height;
}

- (void)setpopLeftItem
{
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(returnlastController)];
}


- (void)returnlastController
{
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end

//
//  ReviewBtn.m
//  ZhuHaiJx
//
//  Created by 冯学仕 on 17/1/9.
//  Copyright © 2017年 rooten. All rights reserved.
//

#import "ReviewBtn.h"
#import "HeaderContent.h"

@interface ReviewBtn()
@property (nonatomic,weak)UIImageView *commentView;

@property (nonatomic, weak) UIImageView *sendImageView;

@property (nonatomic,weak)UILabel *lblPlaceholder;

@end

@implementation ReviewBtn

- (id)initWithFrame:(CGRect)frame andAboveView:(UIView *)bgView
{
    self = [super initWithFrame:frame];
    if (self) {
        
        
        [self addReplyBtnView];
    
    }
    return self;
}

#define replyTextHeight 54
#define textViewWidth screenWidth - 80

- (void) addReplyBtnView
{
    UIImageView *replyView = [[UIImageView alloc] initWithFrame:CGRectMake(2.0f, 2, 30, (replyTextHeight-2*padding-4))];
    replyView.image = [UIImage imageNamed:@"评论（灰色）.png"];
    replyView.layer.cornerRadius = 2;
    [self addSubview:replyView];
    self.commentView = replyView;
    
    UILabel *lblPlaceholder = [[UILabel alloc] initWithFrame:CGRectMake(32.0f, 2, 95, (replyTextHeight-2*padding-4))];
    lblPlaceholder.font = [UIFont systemFontOfSize:15.0f];
    lblPlaceholder.text = @"我也说几句...";
    lblPlaceholder.textColor = [UIColor lightGrayColor];
    lblPlaceholder.backgroundColor = [UIColor clearColor];
    [self addSubview:lblPlaceholder];
    self.lblPlaceholder = lblPlaceholder;
    
//    UIImageView *sendImageView = [[UIImageView alloc] initWithFrame:CGRectMake(113.0f,0,30, (replyTextHeight-2*padding-4))];
//    sendImageView.image = [UIImage imageNamed:@"发送.png"];
//    sendImageView.layer.cornerRadius = 2;
//    [self addSubview:sendImageView];
//    self.sendImageView = sendImageView;
    
}



@end

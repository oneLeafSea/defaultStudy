//
//  ReplyInputView.m
//  MyFamily
//
//  Created by 陆洋 on 15/7/7.
//  Copyright (c) 2015年 maili. All rights reserved.
//

#import "ReplyInputView.h"
#import "HeaderContent.h"
#import "Utilities.h"
#import "Masonry.h"
@interface ReplyInputView()<UITextViewDelegate>
//@property (nonatomic,weak)UITextView *sendTextView;
@property (nonatomic,weak)UILabel *lblPlaceholder;

@property (nonatomic,weak)UIButton *sendButton;
@property (nonatomic,weak)UIImageView *commentView;
@property (nonatomic, weak) UIImageView *sendImageView;


@property (nonatomic,weak)UIView *tapView;
//block
@property (strong, nonatomic) ContentSizeBlock sizeBlock;
@property (strong,nonatomic) replyAddBlock replyBlock;

@end
@implementation ReplyInputView

-(id)initWithFrame:(CGRect)frame andAboveView:(UIView *)bgView
{
    self = [super initWithFrame:frame];
    if (self) {
        UIView *tapView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, screenWidth, MAXFLOAT)];
        tapView.backgroundColor = [UIColor clearColor];
        tapView.userInteractionEnabled = YES;
        [bgView addSubview:tapView];
        self.tapView = tapView;
        UITapGestureRecognizer *tapGer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(disappear)];
        [self.tapView addGestureRecognizer:tapGer];

        
       // tapView.hidden = YES;
        
        [self addReplyView];
        [self addConstraint];

    }
    return self;
}
#define replyTextHeight 54
#define textViewWidth screenWidth - 80

-(void)addReplyView
{
    self.backgroundColor = [UIColor colorWithRed:246.0/255 green:247.0/255 blue:247.0/255 alpha:1];
    
    UITextView *textView = [[UITextView alloc] initWithFrame:CGRectZero];   //框框不由textview显示，只是由来能够实现协议的方法
    textView.backgroundColor = [Utilities parseFromStr:@"#FFFFFF"];
    textView.delegate = self;
    
    textView.layer.cornerRadius = 6;
    textView.layer.masksToBounds = NO;
    textView.font = [UIFont systemFontOfSize:15.0f];
    [self addSubview:textView];
    self.sendTextView = textView;
    [self.sendTextView becomeFirstResponder];
    
    UIImageView *replyView = [[UIImageView alloc] initWithFrame:CGRectZero];
    //replyView.image = [UIImage imageNamed:@"评论（灰色）.png"];
    replyView.layer.cornerRadius = 2;
    [self addSubview:replyView];
    self.commentView = replyView;
    
    UILabel *lblPlaceholder = [[UILabel alloc] initWithFrame:CGRectMake(padding+2.0f, padding +2, 97, (replyTextHeight-2*padding-4))];
    lblPlaceholder.font = [UIFont systemFontOfSize:15.0f];
    lblPlaceholder.text = @"  我也说几句...";
    lblPlaceholder.textColor = [UIColor lightGrayColor];
    lblPlaceholder.backgroundColor = [UIColor clearColor];
    [self addSubview:lblPlaceholder];
    self.lblPlaceholder = lblPlaceholder;
    
    UIImageView *sendImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    //sendImageView.image = [UIImage imageNamed:@"发送.png"];
    sendImageView.layer.cornerRadius = 2;
    [self addSubview:sendImageView];
    self.sendImageView = sendImageView;
    
    UIButton *sendButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.replyTag = sendButton.tag;
    sendButton.frame = CGRectZero;
    [sendButton setTitle:@"发表" forState:0];
    [sendButton setBackgroundImage:[[UIImage imageNamed:@"buttonSend@2x.png"] stretchableImageWithLeftCapWidth:3 topCapHeight:(replyTextHeight-2*padding-4)] forState:UIControlStateNormal];
    sendButton.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleLeftMargin;
    [sendButton addTarget:self action:@selector(sendButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    sendButton.titleLabel.font = [UIFont systemFontOfSize:15.0f];
    [sendButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self addSubview:sendButton];
    self.sendButton = sendButton;

}

-(void)addConstraint
{
    //给文本框添加约束
    self.sendTextView.translatesAutoresizingMaskIntoConstraints = NO;
    NSString *sendStringH = [NSString stringWithFormat:@"H:|-(%d)-[_sendTextView(%f)]",padding,textViewWidth];
    NSString *sendStringV = [NSString stringWithFormat:@"V:|-(%d)-[_sendTextView]-(%d)-|",padding,padding];
    NSArray *sendTextViewConstraintH = [NSLayoutConstraint constraintsWithVisualFormat:sendStringH options:0 metrics:0 views:NSDictionaryOfVariableBindings(_sendTextView)];
    [self addConstraints:sendTextViewConstraintH];
    
    NSArray *sendTextViewConstraintV = [NSLayoutConstraint constraintsWithVisualFormat:sendStringV options:0 metrics:0 views:NSDictionaryOfVariableBindings(_sendTextView)];
    [self addConstraints:sendTextViewConstraintV];
    
    
   //给发送按钮添加约束
        self.sendButton.translatesAutoresizingMaskIntoConstraints = NO;
        NSString *buttonStringH = [NSString stringWithFormat:@"H:[_sendButton(%d)]-(%d)-|",50,padding];
        NSString *buttonStringV = [NSString stringWithFormat:@"V:|-(%d)-[_sendButton]-(%d)-|",padding ,padding];
        NSArray *sendButtonConstraintH = [NSLayoutConstraint constraintsWithVisualFormat:buttonStringH options:0 metrics:0 views:NSDictionaryOfVariableBindings(_sendButton)];
        [self addConstraints:sendButtonConstraintH];
    
        NSArray *sendButtonConstraintV = [NSLayoutConstraint constraintsWithVisualFormat:buttonStringV options:0 metrics:0 views:NSDictionaryOfVariableBindings(_sendButton)];
        [self addConstraints:sendButtonConstraintV];
}

-(void)sendButtonPressed
{
    if ([self.sendTextView.text isEqualToString:@""]) {  //用户没有输入评价内容
        return;
    }
    self.replyBlock(self.sendTextView.text,self.replyTag);
    [self disappear];
}


-(void)disappear
{
    [self.sendTextView resignFirstResponder];
    [self.tapView removeFromSuperview];
    self.tapView = nil;
    [self removeFromSuperview];
}

-(void)setContentSizeBlock:(ContentSizeBlock)block
{
    self.sizeBlock = block;
}

-(void)setReplyAddBlock:(replyAddBlock)block
{
    self.replyBlock = block;
}

#pragma mark - textview delegate

-(void)textViewDidChange:(UITextView *)textView
{
    self.lblPlaceholder.hidden = (textView.text.length > 0);
    self.commentView.hidden = (textView.text.length > 0);
    self.sendImageView.hidden = (textView.text.length > 0);
    CGSize contentSize = self.sendTextView.contentSize;
    self.sizeBlock(contentSize);
    
  
}
@end

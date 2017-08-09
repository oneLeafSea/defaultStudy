//
//  ZHHeadView.m
//  ZhuHaiJingXun
//
//  Created by 冯学仕 on 16/11/7.
//  Copyright © 2016年 rooten. All rights reserved.
//

#import "ZHHeadView.h"
#import "Masonry.h"
#import "FrameSize.h"
#import "FontAwesomeKit.h"
#import "UIImageView+CornerRadius.h"
#import "FAKFontAwesome.h"
#import "Utilities.h"
@interface ZHHeadView()


@end

@implementation ZHHeadView

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor clearColor];
        self.alpha = 0.7;
        _unreadedNUm = [[NSMutableArray alloc] init];
        [self setupConstaints];
        
    }
    return self;
}

-(UILabel *)imageUserIcon
{
    if (_imageUserIcon == nil) {

        FAKIonIcons *personIcon = [FAKIonIcons iosPersonIconWithSize:40];
        [personIcon addAttribute:NSForegroundColorAttributeName
                         value:[Utilities parseFromStr:@"#4fbf9c"]];
        _imageUserIcon = [[UILabel alloc] initWithFrame:CGRectZero];
        _imageUserIcon.attributedText = [personIcon attributedString];
        [self addSubview:_imageUserIcon];
    }
    return _imageUserIcon;
}

-(UIButton *)xinfengImg
{
    if (_xinfengImg == nil) {
        FAKIonIcons *bellIcon = [FAKIonIcons emailIconWithSize:40];
        [bellIcon addAttribute:NSForegroundColorAttributeName value:[Utilities parseFromStr:@"#008B8B"]];
        UIImage *normalImage = [bellIcon imageWithSize:CGSizeMake(40, 40)];
        _xinfengImg = [[UIButton alloc] initWithFrame:CGRectZero];
        [_xinfengImg setImage:normalImage forState:UIControlStateNormal];
        _xinfengImg.hidden = YES;
        [_xinfengImg addTarget:self action:@selector(xinfengImgSelected:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_xinfengImg];
    }
    return _xinfengImg;
}

-(UILabel *)userLaber
{
    if (_userLaber == nil) {
        _userLaber = [[UILabel alloc] initWithFrame:CGRectZero];
        [_userLaber setText:@"用户名"];
        [self addSubview:_userLaber];
    }
    return _userLaber;
}

-(UILabel*)clockImageV
{
    if (_clockImageV == nil) {
        FAKIonIcons *bellIcon = [FAKIonIcons iosBellIconWithSize:35];
        [bellIcon addAttribute:NSForegroundColorAttributeName
                            value:[UIColor redColor]];
        _clockImageV = [[UILabel alloc] initWithFrame:CGRectZero];
        _clockImageV.attributedText = [bellIcon attributedString];
        [self addSubview:_clockImageV];
    }
    return _clockImageV;
}

- (UILabel*) unreadMsgLabel
{
    if (_unreadMsgLabel == nil) {
        _unreadMsgLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        [_unreadMsgLabel setText:@"0"];
        _unreadMsgLabel.textColor = [UIColor orangeColor];
        _unreadMsgLabel.textAlignment = NSTextAlignmentCenter|NSTextAlignmentLeft;
        [self addSubview:_unreadMsgLabel];
    }
    return _unreadMsgLabel;
}

-(void)setupConstaints
{
    [self.imageUserIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.mas_top).offset(5);
        make.left.mas_equalTo(self).offset(LEFT_PAD);
        make.bottom.mas_equalTo(self.mas_bottom).offset(-BOTTOM_PAD);
        make.width.mas_equalTo(40);
    }];
    
    [self.userLaber mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.imageUserIcon);
        make.width.mas_equalTo(60);
        make.height.mas_equalTo(30);
        make.left.mas_equalTo(self.imageUserIcon.mas_right);
    }];
    
    [self.unreadMsgLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.mas_centerY);
        make.right.equalTo(self.mas_right).offset(-15);
        make.width.mas_equalTo(30);
        make.height.mas_equalTo(30);
    }];
    
    [self.clockImageV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.imageUserIcon);
        make.right.equalTo(self.unreadMsgLabel.mas_left);
        make.width.equalTo(self.clockImageV);
        make.height.mas_equalTo(self.clockImageV);
    }];
    [self.xinfengImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.clockImageV);
        make.right.equalTo(self.clockImageV.mas_left).offset(-5);
        make.width.equalTo(self.xinfengImg);
        make.height.mas_equalTo(self.xinfengImg);
    }];
}

- (void)xinfengImgSelected:(UIButton *)button
{
   
    if ([self.delegate respondsToSelector:@selector(xinfengBtnHasTouched)]) {
        [self.delegate xinfengBtnHasTouched];
    }
}


@end

//
//  ZHHeadView.h
//  ZhuHaiJingXun
//
//  Created by 冯学仕 on 16/11/7.
//  Copyright © 2016年 rooten. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol xinfengBtnDelegate;

@interface ZHHeadView : UIView

@property(nonatomic, retain)UILabel *imageUserIcon; //存放用户的头像

@property(nonatomic, retain)UILabel *userLaber; //存放用户名

@property(nonatomic, retain)UILabel *clockImageV;//存放闹钟的位置

@property(nonatomic, retain) UILabel *unreadMsgLabel; //未读消息列表

@property (nonatomic, retain) NSMutableArray *unreadedNUm; //未读消息数

@property (nonatomic, retain) UIButton *xinfengImg; //存放信封的地方

@property (nonatomic, weak) id<xinfengBtnDelegate>delegate;

@end

@protocol xinfengBtnDelegate <NSObject>

- (void)xinfengBtnHasTouched;

@end

//
//  URL.h
//  ZhuHaiJx
//
//  Created by 冯学仕 on 16/11/18.
//  Copyright © 2016年 rooten. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface URL : NSObject

//登陆
extern NSString *const KTopicLogin;

//退出
extern NSString *const KTopicLogOut;

//获取历史消息

extern NSString *const KTopicGetHistoriyMsg;

//获取信息
extern NSString *const KTopicGetInfo;

//添加回复
extern NSString *const KTopicAddReView;

//获取回复
extern NSString *const KTopicGetReView;

//删除信息
extern NSString *const KTopicDeletInfo;

//标记已读未读消息
extern NSString *const KTopicIsReaded;


@end

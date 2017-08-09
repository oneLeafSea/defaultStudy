//
//  SearchUrl.h
//  ZhuHaiJx
//
//  Created by 冯学仕 on 17/2/27.
//  Copyright © 2017年 rooten. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "URL.h"

@interface SearchUrl : NSObject
//+(void)getZhuhaiPolceInterfaceWithHpColum:(NSString*)hpColum hpId:(NSString *)hpId username:(NSString *)userName accesstoken:(NSString*)accesstoken userid:(NSString*)userId completion:(void(^)(NSString*jsonResult,BOOL finished))completion;

//获取用户信息
+ (void)loginWithUserToken:(NSString *)accessToken uuid:(NSString *)uuid completion:(void(^)(NSString *jsonResult, BOOL finished))completion;

//注册信息参数
+(void)loginZhuhaiJxWithUsername:(NSString *)username token:(NSString *)token device:(NSString *)device completion:(void(^)(NSString*jsonResult,BOOL finished))completion;


//退出
+(void)logOutZhuhaiJxWithUsername:(NSString *)username token:(NSString *)token device:(NSString *)device completion:(void(^)(NSString*jsonResult,BOOL finished))completion;


//获取消息
+(void)getInformationFromMjjh:(NSString *)mjjh completion:(void(^)(NSString*jsonResult,BOOL finished))completion;

//添加回复
+(void)AddReviewWithInfoType:(NSString *)infoType  infoId:(NSString *)infoId userReview:(NSString *)userReview  jgbm:(NSString *)jgbm infoDetail:(NSString *)infoDetail replyName:(NSString *)replyName completion:(void(^)(NSString*jsonResult,BOOL finished))completion;

//获取回复
+(void)getReviewWithArrayData:(NSString *)arrayStr completion:(void(^)(NSString*jsonResult,BOOL finished))completion;

//删除帖子
+ (void)deleteInfoWithArr:(NSString *)arrayString completion:(void(^)(NSString*jsonResult,BOOL finished))completion;

//获取历史消息

+(void)getHistoryInformationFromMjjh:(NSString *)mjjh time:(NSString *)time completion:(void(^)(NSString*jsonResult,BOOL finished))completion;

//向服务器发送已读消息
+(void)postInformationWithReadedFromMjjh:(NSString *)mjjh Xxlx:(NSString *)xxlx Xxid:(NSString *)xxid completion:(void(^)(NSString*jsonResult,BOOL finished))completion;

@end

//
//  ZhDataInfo.h
//  ZhuHaiJingXun
//
//  Created by 冯学仕 on 16/11/7.
//  Copyright © 2016年 rooten. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CommentData.h"
#import "FMDB.h"
@protocol zhuHAiCommentDataDelegate;

@interface ZhDataInfo : NSObject

@property(nonatomic, retain)NSString *mvalue;
@property(nonatomic, retain)NSString *mMsgID;   //信息ID
@property(nonatomic, retain)NSString *mTypeID;   // 类型ID
@property (nonatomic, retain)NSString *mTypeName; //类型名称

@property(nonatomic, retain)NSString *mNameType;  //类型名称
@property(nonatomic, retain)NSString *mDetail;    //信息内容
@property(nonatomic, retain)NSString *mPoliceID;   // 民警警号
@property(nonatomic, retain)NSString *mTargetPart;  //机构

@property (nonatomic, retain) NSString *mTargetName; // 机构名称
@property(nonatomic, retain)NSString *mSendTime;   // 推送时间
@property(nonatomic, retain)NSString *mReceiveTime; //送达时间
@property(nonatomic, retain)NSString *mPhoneNum;     //（接受到的）手机号码
@property(nonatomic, retain)NSString *mUser;         //用户
@property(nonatomic, retain)NSString *mIsReply;       //接受信息种类

@property (nonatomic, retain) NSString *mFsr;        //放行人
@property(nonatomic, assign)BOOL isSeeAppReply;      //是否显示全部评论
@property(nonatomic, assign)BOOL isChecked;         //是否被选中

@property(nonatomic, assign)BOOL isReaded;           //是否已经阅读

@property (nonatomic, assign)id <zhuHAiCommentDataDelegate>delegate;

@property(nonatomic, retain) NSMutableArray*commentArr;
//
//// 因为评论是动态的，因此要标识是否要更新缓存
@property (nonatomic, assign) BOOL shouldUpdateCache;

-(instancetype)initwithDict:(NSDictionary *)dict;

- (NSString *)valueWithBool:(BOOL)ret;

+(NSArray *)getJxDataFromDbq:(FMDatabaseQueue *)dbq limit:(NSInteger )limit;

-(BOOL)insertToDbqWithData:(FMDatabaseQueue *)dbq;

- (instancetype) init;

@end

@protocol zhuHAiCommentDataDelegate <NSObject>

-(void)reloadDataAgain;

@end

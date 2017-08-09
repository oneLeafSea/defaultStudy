//
//  ZhDataInfo.m
//  ZhuHaiJingXun
//
//  Created by 冯学仕 on 16/11/7.
//  Copyright © 2016年 rooten. All rights reserved.
//

#import "ZhDataInfo.h"
#import "SearchUrl.h"
#import "FMDB.h"
#import "JxReviewTb.h"
#import "AppDelegate.h"
@implementation ZhDataInfo

- (instancetype) init
{
    if (self = [super init]) {
        _isChecked = NO;
    }
    return self;
}

-(instancetype)initwithDict:(NSDictionary *)dict
{
    if (self == [super init])
    {
        _commentArr = [[NSMutableArray alloc] init];
        
        [self parseDict:dict];
    
        _shouldUpdateCache = NO;

    }
    return self;
}


- (NSString *)valueWithBool:(BOOL)ret
{
    if (ret == YES) {
        self.mvalue = @"1";
    }
    else
    {
        self.mvalue = @"0";
    }
    return self.mvalue;
}



-(void)parseDict:(NSDictionary *)dict
{
    
    [self parseSecondDic:dict];
}

-(void)parseSecondDic:(NSDictionary *)dict
{
    self.mTypeID = [dict valueForKey:@"xxlx"];
    self.mMsgID  = [dict valueForKey:@"xxid"];
    self.mDetail = [dict valueForKey:@"xxnr"];
    self.mPoliceID = [dict valueForKey:@"mjbh"];
    self.mTargetPart = [dict valueForKey:@"jgbm"];
    self.mSendTime = [dict valueForKey:@"tssj"];
    self.mIsReply =  [dict valueForKey:@"isreply"];
    self.mvalue   = [dict valueForKey:@"dqzt"];
    self.mTypeName = [dict valueForKey:@"lxmc"];
    self.mTargetName = [dict valueForKey:@"jgmc"];
    self.mFsr     = [dict valueForKey:@"fsrxm"];
    
}



@end

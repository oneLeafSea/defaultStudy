//
//  NotiHandleCenter.m
//  ZhuHaiJx
//
//  Created by 冯学仕 on 17/1/12.
//  Copyright © 2017年 rooten. All rights reserved.
//

#import "NotiHandleCenter.h"
#import "ZhDataInfo.h"
#import "NotificationNameCenter.h"
#import "JxTb.h"
#import "CommentData.h"

@implementation NotiHandleCenter

+ (void)handleMsg:(id)msg
{  
    NSDictionary *dict = msg;
    NSLog(@"--handleMsg%@--",[dict valueForKey:@"mjbh"]);
    if ([[dict valueForKey:@"isreply"] isEqualToString:@"0"]) {
        ZhDataInfo *dataInfo = [[ZhDataInfo alloc] initwithDict:dict];
        [[NSNotificationCenter defaultCenter] postNotificationName:KTopic_info object:dataInfo];
    }
    else
    {
        CommentData *commentData = [[CommentData alloc] initwithDict:dict];
         [[NSNotificationCenter defaultCenter] postNotificationName:KTopic_review object:commentData];
    }
    
    
    
   
    
}

@end

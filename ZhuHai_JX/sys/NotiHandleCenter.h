//
//  NotiHandleCenter.h
//  ZhuHaiJx
//
//  Created by 冯学仕 on 17/1/12.
//  Copyright © 2017年 rooten. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDB.h"
#import "JXNotiCenter.h"


@interface NotiHandleCenter : NSObject


+ (void)handleMsg:(id)msg;

@end

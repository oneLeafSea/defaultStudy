//
//  UserCenter.m
//  ZhuHai_JX
//
//  Created by 冯学仕 on 17/8/1.
//  Copyright © 2017年 rooten. All rights reserved.
//

#import "UserCenter.h"

@implementation UserCenter

- (instancetype) init {
    if (self = [super init]) {
        _police_id   = [[NSString alloc] init];
        _police_name = [[NSString alloc] init];
        _police_org  = [[NSString alloc] init];
        _hisData_dic = [[NSMutableDictionary alloc] init];
    }
    return self;
}

- (BOOL) userLogin:(void(^)())login_ than:(void(^)())next_ finished:(void(^)())data_ {
    if (login_) {
        next_();
        if (next_) {
            data_();
            if (data_) {
                return true;
            }
        }
    }
    return false;
}

- (NSString *) getCurrentTime {
    NSDate *date = [NSDate date];
    NSString *dateTime = [[NSString alloc] init];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"YYYY/MM/dd hh:mm:ss"];
    dateTime= [formatter stringFromDate:date];
    return dateTime;
}

- (void)handle_historyData:(NSString *)jsonResult {
    
}

@end

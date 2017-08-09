//
//  UserCenter.h
//  ZhuHai_JX
//
//  Created by 冯学仕 on 17/8/1.
//  Copyright © 2017年 rooten. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserCenter : NSObject

@property (nonatomic, copy) NSString *police_id;
@property (nonatomic, copy) NSString *police_name;
@property (nonatomic, copy) NSString *police_org;

@property (nonatomic, retain) NSMutableDictionary *hisData_dic;

- (BOOL) userLogin:(void(^)())login_ than:(void(^)())next_ finished:(void(^)())data_;

- (NSString *) getCurrentTime;

- (void)handle_historyData:(NSString *)jsonResult;

@end

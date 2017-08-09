//
//  SearchUrl.m
//  ZhuHaiJx
//
//  Created by 冯学仕 on 17/2/27.
//  Copyright © 2017年 rooten. All rights reserved.
//

#import "SearchUrl.h"

@implementation SearchUrl

+ (void)loginWithUserToken:(NSString *)accessToken uuid:(NSString *)uuid completion:(void(^)(NSString *jsonResult, BOOL finished))completion
{
    NSURLSessionConfiguration *sessionConfig = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *postSession = [NSURLSession sessionWithConfiguration:sessionConfig delegate:nil delegateQueue:nil];
    NSURL *url=[NSURL URLWithString:@"http://219.131.222.93:8001/rchc/userinfo"];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url
                                                           cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                       timeoutInterval:60.0];
    NSError *error=nil;
    [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    //[request addValue:@"application/json" forHTTPHeaderField:@"Accept"];
    NSMutableDictionary *params=[[NSMutableDictionary alloc]init];
    
    
    [params setValue:accessToken forKey:@"accesstoken"];
    [params setValue:uuid forKey:@"uuid"];
    
    NSData *paramData=[NSJSONSerialization dataWithJSONObject:params options:NSJSONWritingPrettyPrinted error:&error];
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody:paramData];
    
    NSURLSessionDataTask *postDataTask=[postSession dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *  response, NSError *error) {
        if (error == nil) {
            NSString *str = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
            
            if (completion) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    // completion(str, YES);
                    completion(str,YES);
                    
                });
            }
        } else {
            if (completion) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    completion(nil,NO);
                    NSLog(@"--------->%@",error.userInfo);
                });
            }
        }
        
    }];
    
    [postDataTask resume];
}

+(void)loginZhuhaiJxWithUsername:(NSString *)username token:(NSString *)token device:(NSString *)device completion:(void(^)(NSString*jsonResult,BOOL finished))completion
{
    NSURLSessionConfiguration *sessionConfig = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *postSession = [NSURLSession sessionWithConfiguration:sessionConfig delegate:nil delegateQueue:nil];
    NSURL *url=[NSURL URLWithString:KTopicLogin];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url
                                                           cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                       timeoutInterval:60.0];
    NSError *error=nil;
    [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    //[request addValue:@"application/json" forHTTPHeaderField:@"Accept"];
    NSMutableDictionary *params=[[NSMutableDictionary alloc]init];
    
    [params setValue:username forKey:@"uname"];
    [params setValue:token forKey:@"token"];
    [params setValue:device forKey:@"device"];
    
    
    NSData *paramData=[NSJSONSerialization dataWithJSONObject:params options:NSJSONWritingPrettyPrinted error:&error];
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody:paramData];
    
    NSURLSessionDataTask *postDataTask=[postSession dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *  response, NSError *error) {
        if (error == nil) {
            NSString *str = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
            
            if (completion) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    // completion(str, YES);
                    completion(str,YES);
                    
                });
            }
        } else {
            if (completion) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    completion(nil,NO);
                    NSLog(@"-----error.userInfo---->%@",error.userInfo);
                });
            }
        }
        
    }];
    
    [postDataTask resume];
    
}

+(void)logOutZhuhaiJxWithUsername:(NSString *)username token:(NSString *)token device:(NSString *)device completion:(void(^)(NSString*jsonResult,BOOL finished))completion
{
    NSURLSessionConfiguration *sessionConfig = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *postSession = [NSURLSession sessionWithConfiguration:sessionConfig delegate:nil delegateQueue:nil];
    NSURL *url=[NSURL URLWithString:KTopicLogOut];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url
                                                           cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                       timeoutInterval:60.0];
    NSError *error=nil;
    [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    //[request addValue:@"application/json" forHTTPHeaderField:@"Accept"];
    NSMutableDictionary *params=[[NSMutableDictionary alloc]init];
    
    [params setValue:username forKey:@"uname"];
    [params setValue:token forKey:@"token"];
    [params setValue:device forKey:@"device"];
    
    
    NSData *paramData=[NSJSONSerialization dataWithJSONObject:params options:NSJSONWritingPrettyPrinted error:&error];
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody:paramData];
    
    NSURLSessionDataTask *postDataTask=[postSession dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *  response, NSError *error) {
        if (error == nil) {
            NSString *str = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
            
            if (completion) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    // completion(str, YES);
                    completion(str,YES);
                    
                });
            }
        } else {
            if (completion) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    completion(nil,NO);
                    NSLog(@"----error.userInfo----->%@",error.userInfo);
                });
            }
        }
        
    }];
    
    [postDataTask resume];
    
}

+(void)getInformationFromMjjh:(NSString *)mjjh completion:(void(^)(NSString*jsonResult,BOOL finished))completion
{
    NSURLSessionConfiguration *sessionConfig = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *postSession = [NSURLSession sessionWithConfiguration:sessionConfig delegate:nil delegateQueue:nil];
    NSURL *url=[NSURL URLWithString:KTopicGetInfo];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url
                                                           cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                       timeoutInterval:60.0];
    NSError *error=nil;
    [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    //[request addValue:@"application/json" forHTTPHeaderField:@"Accept"];
    NSMutableDictionary *params=[[NSMutableDictionary alloc]init];
    
    [params setValue:mjjh forKey:@"mjjh"];
    
    
    
    NSData *paramData=[NSJSONSerialization dataWithJSONObject:params options:NSJSONWritingPrettyPrinted error:&error];
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody:paramData];
    
    NSURLSessionDataTask *postDataTask=[postSession dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *  response, NSError *error) {
        if (error == nil) {
            NSString *str = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
            
            if (completion) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    completion(str,YES);
                    
                });
            }
        } else {
            if (completion) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    completion(nil,NO);
                });
            }
        }
        
    }];
    
    [postDataTask resume];
    
}

+(void)getHistoryInformationFromMjjh:(NSString *)mjjh time:(NSString *)time completion:(void(^)(NSString*jsonResult,BOOL finished))completion
{
    NSURLSessionConfiguration *sessionConfig = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *postSession = [NSURLSession sessionWithConfiguration:sessionConfig delegate:nil delegateQueue:nil];
    NSURL *url=[NSURL URLWithString:KTopicGetHistoriyMsg];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url
                                                           cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                       timeoutInterval:60.0];
    NSError *error=nil;
    [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    //[request addValue:@"application/json" forHTTPHeaderField:@"Accept"];
    NSMutableDictionary *params=[[NSMutableDictionary alloc]init];
    
    [params setValue:mjjh forKey:@"mjjh"];
    [params setValue:time forKey:@"time"];
    
    
    NSData *paramData=[NSJSONSerialization dataWithJSONObject:params options:NSJSONWritingPrettyPrinted error:&error];
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody:paramData];
    
    NSURLSessionDataTask *postDataTask=[postSession dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *  response, NSError *error) {
        if (error == nil) {
            NSString *str = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
            
            if (completion) {
                    completion(str,YES);
            }
        } else {
            if (completion) {
                    completion(nil,NO);
            }
        }
        
    }];
    
    [postDataTask resume];
    
}

+(void)AddReviewWithInfoType:(NSString *)infoType infoId:(NSString *)infoId userReview:(NSString *)userReview jgbm:(NSString *)jgbm infoDetail:(NSString *)infoDetail replyName:(NSString *)replyName completion:(void (^)(NSString *, BOOL))completion
{
    NSURLSessionConfiguration *sessionConfig = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *postSession = [NSURLSession sessionWithConfiguration:sessionConfig delegate:nil delegateQueue:nil];
    NSURL *url=[NSURL URLWithString:KTopicAddReView];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url
                                                           cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                       timeoutInterval:60.0];
    NSError *error=nil;
    [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    //[request addValue:@"application/json" forHTTPHeaderField:@"Accept"];
    NSMutableDictionary *params=[[NSMutableDictionary alloc]init];
    
    [params setValue:infoType forKey:@"xxlx"];
    [params setValue:infoId forKey:@"xxid"];
    [params setValue:userReview forKey:@"mjjh"];
    [params setValue:jgbm forKey:@"jgbm"];
    [params setValue:infoDetail forKey:@"xxnr"];
    [params setValue:replyName forKey:@"replyname"];
    
    
    NSData *paramData=[NSJSONSerialization dataWithJSONObject:params options:NSJSONWritingPrettyPrinted error:&error];
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody:paramData];
    
    NSURLSessionDataTask *postDataTask=[postSession dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *  response, NSError *error) {
        if (error == nil) {
            NSString *str = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
            
            if (completion) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    // completion(str, YES);
                    completion(str,YES);
                    
                });
            }
        } else {
            if (completion) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    completion(nil,NO);
                    NSLog(@"--------->%@",error.userInfo);
                });
            }
        }
        
    }];
    
    [postDataTask resume];
}

+(void)getReviewWithArrayData:(NSString *)arrayStr completion:(void(^)(NSString*jsonResult,BOOL finished))completion
{
    NSURLSessionConfiguration *sessionConfig = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *postSession = [NSURLSession sessionWithConfiguration:sessionConfig delegate:nil delegateQueue:nil];
    NSURL *url=[NSURL URLWithString:KTopicGetReView];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url
                                                           cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                       timeoutInterval:60.0];
    // NSError *error=nil;
    [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    
    
    NSData *arrData = [arrayStr dataUsingEncoding:NSUTF8StringEncoding];
    
    //NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:arrData options:NSJSONReadingMutableContainers error:&error];
    //NSData *paramData=[NSJSONSerialization dataWithJSONObject:params options:NSJSONWritingPrettyPrinted error:&error];
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody:arrData];
    
    NSURLSessionDataTask *postDataTask=[postSession dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *  response, NSError *error) {
        if (error == nil) {
            NSString *str = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
            
            if (completion) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    // completion(str, YES);
                    completion(str,YES);
                    
                });
            }
        } else {
            if (completion) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    completion(nil,NO);
                    NSLog(@"--------->%@",error.userInfo);
                });
            }
        }
        
    }];
    
    [postDataTask resume];
}

+ (void)deleteInfoWithArr:(NSString *)arrayString completion:(void(^)(NSString*jsonResult,BOOL finished))completion
{
    NSURLSessionConfiguration *sessionConfig = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *postSession = [NSURLSession sessionWithConfiguration:sessionConfig delegate:nil delegateQueue:nil];
    NSURL *url=[NSURL URLWithString:KTopicDeletInfo];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url
                                                           cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                       timeoutInterval:60.0];
    // NSError *error=nil;
    [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    
    
    NSData *arrData = [arrayString dataUsingEncoding:NSUTF8StringEncoding];
    //NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:arrData options:NSJSONReadingMutableContainers error:&error];
    //NSData *paramData=[NSJSONSerialization dataWithJSONObject:params options:NSJSONWritingPrettyPrinted error:&error];
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody:arrData];
    
    NSURLSessionDataTask *postDataTask=[postSession dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *  response, NSError *error) {
        if (error == nil) {
            NSString *str = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
            

            if (completion) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    // completion(str, YES);
                    completion(str,YES);
                    
                });
            }
        } else {
            if (completion) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    completion(nil,NO);
                    NSLog(@"--------->%@",error.userInfo);
                });
            }
        }
        
    }];
    
    [postDataTask resume];
}

+(void)postInformationWithReadedFromMjjh:(NSString *)mjjh Xxlx:(NSString *)xxlx Xxid:(NSString *)xxid completion:(void(^)(NSString*jsonResult,BOOL finished))completion
{
    NSURLSessionConfiguration *sessionConfig = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *postSession = [NSURLSession sessionWithConfiguration:sessionConfig delegate:nil delegateQueue:nil];
    NSURL *url=[NSURL URLWithString:KTopicIsReaded];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url
                                                           cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                       timeoutInterval:60.0];
    NSError *error=nil;
    [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    //[request addValue:@"application/json" forHTTPHeaderField:@"Accept"];
    NSMutableDictionary *params=[[NSMutableDictionary alloc]init];
    
    [params setValue:mjjh forKey:@"mjjh"];
    [params setValue:xxid forKey:@"xxid"];
    [params setValue:xxlx forKey:@"xxlx"];
    
    
    NSData *paramData=[NSJSONSerialization dataWithJSONObject:params options:NSJSONWritingPrettyPrinted error:&error];
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody:paramData];
    
    NSURLSessionDataTask *postDataTask=[postSession dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *  response, NSError *error) {
        if (error == nil) {
            NSString *str = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
            
            if (completion) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    // completion(str, YES);
                    completion(str,YES);
                    
                });
            }
        } else {
            if (completion) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    completion(nil,NO);
                    NSLog(@"--------->%@",error.userInfo);
                });
            }
        }
        
    }];
    
    [postDataTask resume];
    
}

@end

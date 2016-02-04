//
//  AppDelegate+EaseMobExts.m
//  hxDemo
//
//  Created by heke on 16/2/4.
//  Copyright © 2016年 mhk. All rights reserved.
//

#import "AppDelegate+EaseMobExts.h"

NSString *const TM_EaseMobAppKey = @"max006#hxdemo";
NSString *const hxUser_1 = @"hx_1";
NSString *const hxUser_2 = @"hx_2";
NSString *const hxUserPwd = @"shitou";

@implementation AppDelegate (EaseMobExts)

- (void)tm_application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [[EaseMob sharedInstance].chatManager addDelegate:self delegateQueue:nil];
    
    EMError *anError = nil;
    anError = [[EaseMob sharedInstance] registerSDKWithAppKey:TM_EaseMobAppKey
                                                 apnsCertName:nil
                                                  otherConfig:@{kSDKConfigEnableConsoleLogger:@(YES)}];
    NSLog(@"error:%@",anError);
    
    [[EaseMob sharedInstance] application:application didFinishLaunchingWithOptions:launchOptions];
    if (anError) {
        return;
    }
    
    [self EaseMobLogin];
}

// App进入后台
- (void)tm_applicationDidEnterBackground:(UIApplication *)application {
    [[EaseMob sharedInstance] applicationDidEnterBackground:application];
}

// App将要从后台返回
- (void)tm_applicationWillEnterForeground:(UIApplication *)application {
    [[EaseMob sharedInstance] applicationWillEnterForeground:application];
}

// 申请处理时间
- (void)tm_applicationWillTerminate:(UIApplication *)application {
    [[EaseMob sharedInstance] applicationWillTerminate:application];
}

- (void)EaseMobLogin {
    BOOL isAutoLogin = [[EaseMob sharedInstance].chatManager isAutoLoginEnabled];
    if (isAutoLogin) {
        [[EaseMob sharedInstance].chatManager setIsAutoLoginEnabled:NO];
    }
    
    [[EaseMob sharedInstance].chatManager asyncLoginWithUsername:hxUser_1 password:hxUserPwd completion:^(NSDictionary *loginInfo, EMError *error) {
        if (!error && loginInfo) {
            NSLog(@"登陆成功：%@",hxUser_1);
            [[EaseMob sharedInstance].chatManager setIsAutoLoginEnabled:NO];
        }
    } onQueue:nil];
}

#pragma mark - 自动登陆 回调
/*!
 @method
 @brief 用户将要进行自动登录操作的回调
 @discussion
 @param loginInfo 登录的用户信息
 @param error     错误信息
 @result
 */
- (void)willAutoLoginWithInfo:(NSDictionary *)loginInfo error:(EMError *)error {
    NSLog(@"willAutoLoginWithInfo:%@,--error:%@",loginInfo,error);
}

/*!
 @method
 @brief 用户自动登录完成后的回调
 @discussion
 @param loginInfo 登录的用户信息
 @param error     错误信息
 @result
 */
- (void)didAutoLoginWithInfo:(NSDictionary *)loginInfo error:(EMError *)error {
    NSLog(@"didAutoLoginWithInfo:%@,--error:%@",loginInfo,error);
}

@end

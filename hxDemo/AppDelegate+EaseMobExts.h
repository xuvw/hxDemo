//
//  AppDelegate+EaseMobExts.h
//  hxDemo
//
//  Created by heke on 16/2/4.
//  Copyright © 2016年 mhk. All rights reserved.
//

#import "AppDelegate.h"
#import <EaseMobSDK/EaseMob.h>

@interface AppDelegate (EaseMobExts)
<EMChatManagerDelegate>

- (void)tm_application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions;

// App进入后台
- (void)tm_applicationDidEnterBackground:(UIApplication *)application;

// App将要从后台返回
- (void)tm_applicationWillEnterForeground:(UIApplication *)application;

// 申请处理时间
- (void)tm_applicationWillTerminate:(UIApplication *)application;


@end

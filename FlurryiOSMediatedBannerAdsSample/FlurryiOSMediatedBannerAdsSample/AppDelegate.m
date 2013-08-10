//
//  AppDelegate.m
//  FlurryiOSMediatedBannerAdsSample
//
//  Created by Bisera Ferrero on 6/3/13.
//  Copyright (c) 2013 Flurry. All rights reserved.
//

#import "AppDelegate.h"
#import "Flurry.h"
#import "FlurryAds.h"

@implementation AppDelegate

- (void)dealloc
{
    [_window release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    //enable Flurry Crash Reporting if you dont have any other Crash Reporting frameworks integrated in your app
    [Flurry setCrashReportingEnabled:YES];  
    // Replace this API key with YOUR_API_KEY acquired from Flurry's dev portal
    [Flurry startSession:@"RKGM49YWSY86KYVVS99D"];
    
    // Pointer to your rootViewController
    [FlurryAds initialize:_window.rootViewController];
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{

}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{

}

- (void)applicationDidBecomeActive:(UIApplication *)application
{

}

- (void)applicationWillTerminate:(UIApplication *)application
{

}

@end

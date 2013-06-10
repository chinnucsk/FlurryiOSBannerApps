//
//  ViewController.m
//  FlurryiOSMediatedBannerAdsSample
//
//  Created by Bisera Ferrero on 6/3/13.
//  Copyright (c) 2013 Flurry. All rights reserved.
//

#import "ViewController.h"
#import "FlurryAdDelegate.h"
#import "FlurryAds.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    // Optional step: Register yourself as a delegate for ad callbacks
    [FlurryAds setAdDelegate:self];
    
    // Fetch and display banner ad for a given ad space.
    //    Note: Choose an adspace name that
    // will uniquely identifiy the ad's placement within your app
    [FlurryAds fetchAndDisplayAdForSpace:@"MediatedBannerBottom" view:self.view size:BANNER_BOTTOM];
}

- (BOOL) spaceShouldDisplay:(NSString*)adSpace interstitial:(BOOL) interstitial {
    if (interstitial) {
        NSLog(@"Pause app state now");
    }
    
    // Continue ad display
    return YES;
}

/*
 *  Resume app state when the interstitial is dismissed.
 */
- (void)spaceDidDismiss:(NSString *)adSpace interstitial:(BOOL)interstitial {
    if (interstitial) {
        NSLog(@"Resume app state here");
    }
}

- (void)spaceDidReceiveAd:(NSString *)adSpace {
    NSLog(@"=========== Ad Space [%@] Did Receive Ad ================ ", adSpace);
    
}

- (void)spaceDidFailToReceiveAd:(NSString *)adSpace error:(NSError *)error {
    NSLog(@"=========== Ad Space [%@] Did Fail to Receive Ad with error [%@] ================ ", adSpace, error);
    
}

- (void) videoDidFinish:(NSString *)adSpace{
    NSLog(@"=========== Ad Space [%@] Video Did Finish  ================ ", adSpace);
}


- (void)spaceWillDismiss:(NSString *)adSpace interstitial:(BOOL)interstitial {
    NSLog(@"=========== Ad Space [%@] Will Dismiss for interstitial [%d] ================ ", adSpace, interstitial);
}


- (void)spaceWillLeaveApplication:(NSString *)adSpace {
    NSLog(@"=========== Ad Space [%@] Will Leave Application ================ ", adSpace);
}

- (void) spaceDidFailToRender:(NSString *) adSpace error:(NSError *)error {
    NSLog(@"=========== Ad Space [%@] Did Fail to Render with error [%@] ================ ", adSpace, error);
}

- (void) spaceDidReceiveClick:(NSString *)adSpace {
    NSLog(@"=========== Ad Space [%@] Did Receive Click ================ ", adSpace);
}

- (void)spaceWillExpand:(NSString *)adSpace {
    NSLog(@"=========== Ad Space [%@] Will Expand ================ ", adSpace);
}

- (void)spaceDidCollapse:(NSString *)adSpace {
    NSLog(@"=========== Ad Space [%@] Did Collapse ================ ", adSpace);
}




-(void) viewWillDisappear:(BOOL)animated {
    
    [super viewWillDisappear:animated];
    
    // Remove the ad when view dissappears
    [FlurryAds removeAdFromSpace:@"MediatedBannerBottom"];
    
    // Reset delegate, if set earlier
    [FlurryAds setAdDelegate:nil];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

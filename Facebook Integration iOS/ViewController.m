//
//  ViewController.m
//  Facebook Integration iOS
//
//  Created by Keshav Priyadarshi on 26.10.19.
//  Copyright © 2019 Keshav Priyadarshi. All rights reserved.

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
FBAdView *adView;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadAd];
  
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    FBAdSize adSize = [self fbAdSize];
    CGSize viewSize = self.view.bounds.size;
    CGSize tabBarSize = self.tabBarController.tabBar.frame.size;
    viewSize = CGSizeMake(viewSize.width, viewSize.height - tabBarSize.height);
    UIEdgeInsets insets = [self safeAreaInsets];
    CGFloat bottomAlignedY = viewSize.height - adSize.size.height - insets.bottom;
    self.adView.frame = CGRectMake(insets.left,
                                   bottomAlignedY,
                                   viewSize.width - insets.right - insets.left,
                                   adSize.size.height);
}

- (UIEdgeInsets)safeAreaInsets
{
    // Comment the following if-statement if you are not running XCode 9+
    if (@available(iOS 11.0, *)) {
        UIWindow *window = [[UIApplication sharedApplication].delegate window];
        return [window safeAreaInsets];
    }
    return UIEdgeInsetsZero;
}



- (void)loadAd
{
    if (nil != self.adView) {
        [self.adView removeFromSuperview];
    }
    
    // Create a banner's ad view with a unique placement ID (generate your own on the Facebook app settings).
    // Use different ID for each ad placement in your app.
    // 549167759165615_554613651954359 | YOUR_PLACEMENT_ID
    FBAdSize adSize = [self fbAdSize];
    self.adView = [[FBAdView alloc] initWithPlacementID:@"YOUR_PLACEMENT_ID"
                                                 adSize:adSize
                                     rootViewController:self];
    
    // Set a delegate to get notified on changes or when the user interact with the ad.
    self.adView.delegate = self;
    
    // When testing on a device, add its hashed ID to force test ads.
    // The hash ID is printed to console when running on a device.
    // [FBAdSettings addTestDevice:@"THE HASHED ID AS PRINTED TO CONSOLE"];
    
    // Set autoresizingMask so the rotation is automatically handled
    self.adView.autoresizingMask =
    UIViewAutoresizingFlexibleRightMargin |
    UIViewAutoresizingFlexibleLeftMargin|
    UIViewAutoresizingFlexibleWidth |
    UIViewAutoresizingFlexibleTopMargin;
//
    // Add adView to the view hierarchy.
    [self.view addSubview:self.adView];
    [self.adView loadAd];
}

- (FBAdSize)fbAdSize
{
    BOOL isIPAD = ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad);
    return isIPAD ? kFBAdSizeHeight90Banner : kFBAdSizeHeight50Banner;
}


- (void)adViewDidLoad:(FBAdView *)adView
    {
        NSLog(@"Ad was loaded and ready to be displayed");
        self.adView.hidden = NO;
    }

//- (void)showBanner
//    {
//        if (self.adView && self.adView.isAdValid) {
//            [self.adContainer addSubview:self.adView];
//        }
//    }

- (void)adView:(FBAdView *)adView didFailWithError:(NSError *)error
{
    NSLog(@"Banner Ad failed to load with error: %@", error);
    
    // Hide the unit since no ad is shown.
    self.adView.hidden = YES;
}

- (void)adViewDidClick:(FBAdView *)adView
    {
        NSLog(@"Banner ad was clicked.");
    }

- (void)adViewDidFinishHandlingClick:(FBAdView *)adView
    {
        NSLog(@"Banner ad did finish click handling.");
    }

- (void)adViewWillLogImpression:(FBAdView *)adView
    {
        NSLog(@"Banner ad impression is being captured.");
    }


- (IBAction)refreshBannerAds:(id)sender {
    NSLog(@"refreshBannerAds called");
    self.adView.hidden = YES;
    [self loadAd];
}
@end
    

